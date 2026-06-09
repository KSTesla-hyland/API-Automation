import os
import sys
import time
import json
import pytest
import requests
from allure_commons import fixture
from pytest_bdd import given, parsers, scenarios, then

from Configuration.ADMIN.config import ConfigData
from Configuration.ADMIN.endpoints import Endpoints
from Utility.CommonAPIUtility.RESTRequestUtils import CommonRESTRequestUtils
from Utility.DBOperations import DbOperations
from Utility.miscUtils import miscUtils
from Utility.APIUtility.ADMIN.RESTRequestUtils import RESTRequestUtils
from Utility.APIUtility.ADMIN.RESTResponseUtils import Response, RESTResponseUtils


sys.path.append(os.getcwd())


@pytest.fixture()
def api_request_context():
    request_context = requests.Session()
    # Setting global header which will be accessed across features
    request_context.headers = RESTRequestUtils().header_dict.copy()
    start_time =time.time()
    yield request_context
    request_context.close()

@pytest.fixture(scope="session")
def test_data_store():
    return {}

@pytest.fixture(scope="function")
def get_bearer_token(request, test_data_store):
    # Get credentials from the scenario
    creds = getattr(request.node, 'user_credentials', None)
    if not creds:
        raise ValueError("User credentials not found in scenario step.")

    app_name = creds["app_name"]
    origin_url = f"https://{app_name}.nilnexus.com"

    token_context = requests.post(
        url=ConfigData.BASE_URL_AUTH + "api/Account/login",
        headers={"Content-Type": ConfigData.CONTENT_TYPE_AUTH,"origin":origin_url},
        json={
            "appname": creds["app_name"],
            "remember": ConfigData.rememberMe,
            "username": creds["username"],
            "encodedPassword": creds["encodedPassword"]
        },
        verify=False,
    )
    yield token_context
    token_context.close()


@pytest.fixture()
def api_request_context_auth(get_bearer_token):
    request_context_auth = requests.Session()
    request_context_auth.headers = RESTRequestUtils().header_dict_auth.copy()
    parsed_response = RESTResponseUtils().parseJSONbodyToDictionary(get_bearer_token)
    # Use the utility function to get the token
    token_value = miscUtils.get_nested_value(parsed_response, ["result", "token", "token"])
    request_context_auth.headers["Authorization"] = f"Bearer {token_value}"
    RESTRequestUtils().addorupdateheader(request_context_auth, "Authorization", f"Bearer {token_value}")
    RESTRequestUtils().addorupdateheader(request_context_auth, "origin", "https://admin.nilnexus.com")
    yield request_context_auth

@pytest.fixture()
def get_update_token(get_bearer_token):
    parsed_response = RESTResponseUtils().parseJSONbodyToDictionary(get_bearer_token)
    token_value = miscUtils.get_nested_value(parsed_response, ["result", "token", "token"])
    print(token_value)
    #refresh_token = miscUtils.get_nested_value(parsed_response, ["result", "token", "refreshToken"])
    update_token= {
        "token": token_value,
        #"refreshToken": refresh_token,
    }
    return update_token

@pytest.fixture()
def api_respone_context():
    response_context = Response("None")
    yield response_context


@pytest.fixture()
def get_bad_update_token(get_bearer_token,test_data_store):
    parsed_response = RESTResponseUtils().parseJSONbodyToDictionary(get_bearer_token)
    token_value = miscUtils.get_nested_value(parsed_response, ["result", "token", "token"])
    # refreshToken intentionally omitted for negative test case
    update_token= {
        "token": token_value,
        # "refreshToken": refresh_token,
    }
    return update_token

@given(parsers.parse('User hits get api for "{endpointname}" of apiadmin'))
def user_hit_get_api(api_request_context_auth, api_respone_context, endpointname):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    RESTRequestUtils().get(api_request_context_auth, api_respone_context, endpoint)

@given(parsers.parse('user with "{appname}" as "{app_name}", "{user_name}" as "{username}","{password}" as "{encodedPassword}"'))
def store_user_credentials(request, app_name, username, encodedPassword):
    if username == "BLANK":
        username = ""
    if encodedPassword == "BLANK":
        encodedPassword = ""
    request.node.user_credentials = {
        "app_name": app_name,
        "username": username,
        "encodedPassword": encodedPassword
    }

@then(parsers.parse('verify status should be "{status_code}"'))
def verify_status_code(api_respone_context, status_code):
    assert int(api_respone_context.get_status_code()) == int(status_code)


@then(parsers.parse('verify response "{response_object}" should be "{expected_message}"'))
def verify_response_message(api_respone_context,expected_message,response_object):
    response = api_respone_context.get_response()
    actual_message = RESTResponseUtils().get_response_data(response,response_object)
    if expected_message == 'None':
        expected_message = None
    assert actual_message == expected_message


@given(parsers.parse('user add or updates header for "{key}" as "{value}"'))
def user_adds_a_new_header(api_request_context, key, value):
    RESTRequestUtils().addorupdateheader(api_request_context, key, value)


@given(parsers.parse('user removes header for "{key}" key'))
def user_removes_a_header(api_request_context, key):
    RESTRequestUtils().deleteheader(api_request_context, key)


#  Headers are resetted to global header for each scenario
#  This don't need to be called explicitly until it is required to reset headers within the same scenario
@given(parsers.parse("user reset the header"))
def reset_the_header(api_request_context):
    api_request_context.headers = RESTRequestUtils().header_dict.copy()

@then(parsers.parse('verify nested response "{key} ,{key1}" should be "{value}"'))
def verify_nested_response_result(api_respone_context, key, key1, value):
    response = api_respone_context.get_response()
    nested_response = RESTResponseUtils().get_nested_response_data(response,key,key1)
    assert str(nested_response) == value

@then(parsers.parse('verify response "{response_object}" should contain text "{expected_message}"'))
def verify_response_result(api_respone_context,expected_message,response_object):
    response = api_respone_context.get_response()
    actual_message = RESTResponseUtils().get_response_data(response, response_object)
    if expected_message == 'None':
        expected_message = None
    assert expected_message in actual_message

@then(parsers.parse('verify the response time'))
def api_response_time():
    url=ConfigData.BASE_URL
    endpoint=Endpoints.GetUWLID
    result= miscUtils.api_response_time(url,endpoint)
    assert result < 1000

"""Here in this when we have called the fixture get_bearer_token in the function parameter, then that function is already executed.
same goes for api_respone_context and the return value is passed in the function. Then in the second line we have set the response value based on 
the return value of get bearer token."""
@given(parsers.parse('user hits login api'))
def verify_login(get_bearer_token,api_respone_context):
    api_respone_context.set_response(get_bearer_token)

@then(parsers.parse('verify the content length is "{length}"'))
def user_verifies_the_length_of_content(api_respone_context,length):
    response = api_respone_context.get_response_content()
    assert int(len(response)) == int(length)


@given(parsers.parse('User hits patch api for "{endpointname}" of apiadmin'))
def user_hits_the_patch_api(api_request_context_auth,api_respone_context,endpointname):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    final_data = miscUtils.readFileContentAsString("TestData/POST_Data/ApplyDoctorLayout.json")
    data = json.loads(final_data)
    RESTRequestUtils().patch(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
    )

@then(parsers.parse('verify nested result response "{key} ,{key1}" should be "{value}"'))
def verify_nested_result_response_result(api_respone_context, key, key1, value):
    response = api_respone_context.get_response()
    response_dict = RESTResponseUtils().parseJSONbodyToDictionary(response)
    capital_dict = miscUtils.capitalize_keys_first_letter(response_dict)
    nested_response = miscUtils().verify_value_exists(capital_dict, key,key1, value)
    assert nested_response == True

@then(parsers.parse('verify response for inner nested key "{key}" should be "{value}"'))
def verify_nested_result_response_result(api_respone_context, key, value):
    response = api_respone_context.get_response()
    response_dict = RESTResponseUtils().parseJSONbodyToDictionary(response)
    capital_dict = miscUtils.capitalize_keys_first_letter(response_dict)
    nested_response = miscUtils().find_values(capital_dict,key)
    if nested_response[0] == None:
        assert True
    elif  str(value) in str(nested_response):
        assert True
    else:
        assert False

@given(parsers.parse('User hits post api for "{endpointname}" of apiadmin using "{data}" data'))
def post_api_to_create(api_request_context_auth,api_respone_context,endpointname,data):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    final_data = miscUtils.readFileContentAsString(data)
    data = json.loads(final_data)
    RESTRequestUtils().post(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
    )

@given(parsers.parse('User hits the put api for "{endpointname}" of using "{data}" data'))
def put_api_to_edit(api_request_context_auth,api_respone_context,endpointname,data):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    final_data = miscUtils.readFileContentAsString(data)
    data = json.loads(final_data)
    RESTRequestUtils().put(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
    )

@given(parsers.parse('User hits the delete api for "{endpointname}" of apiadmin'))
def delete_api_to_edit(api_request_context_auth, api_respone_context, endpointname):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    RESTRequestUtils().delete(
        api_request_context_auth,
        api_respone_context,
        endpoint,
    )

@then(parsers.parse('verify response for inner nested key "{key}" for mutiple values should be "{value}"'))
def verify_nested_result_response_result(api_respone_context, key, value):
    response = api_respone_context.get_response()
    response_dict = RESTResponseUtils().parseJSONbodyToDictionary(response)
    capital_dict = miscUtils.capitalize_keys_first_letter(response_dict)
    nested_response = miscUtils.find_values(capital_dict, key)
    expected_values = [v.strip() for v in value.split(',')]

    if nested_response[0] is None:
        assert True
    elif any(str(expected) in str(nested_response) for expected in expected_values):
        assert True
    else:
        assert False

@then(parsers.parse('User executes select query "{querystring}" to verify value is equal to "{expectedvalue}"'))
def User_verifies_row_count(querystring, expectedvalue):
    actualvalue = DbOperations.executeSelectQuery(querystring)
    if expectedvalue.strip() == str(actualvalue).strip():
        assert True
    else:
        assert False
