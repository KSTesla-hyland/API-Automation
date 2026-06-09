import ast
import json

from pytest_bdd import scenarios, then, given, parsers
import sys
import os

from Configuration.ADMIN import passwordreset
from Configuration.ADMIN.config import ConfigData
from Configuration.ADMIN.endpoints import Endpoints
from Configuration.ADMIN.passwordreset import PasswordReset
from Tests.NilNexus_ADMIN.Steps.conftest import get_update_token
from Utility.APIUtility.ADMIN.RESTResponseUtils import RESTResponseUtils
from Utility.CommonAPIUtility.RESTRequestUtils import CommonRESTRequestUtils

sys.path.append(os.getcwd())

from Utility.miscUtils import miscUtils
from Utility.APIUtility.ADMIN.RESTRequestUtils import RESTRequestUtils


scenarios("../Features/AccountController_Adminapi.feature")

@then(parsers.parse('verify permission response schema is valid'))
def verify_response_schema(api_respone_context):
    assert RESTResponseUtils().json_schema_validator("TestData/ADMIN_TestData/permissions.json", api_respone_context.get_response_content())


@then(parsers.parse('verify the response time'))
def api_response_time():
    url=ConfigData.BASE_URL
    endpoint=Endpoints.GetUWLID
    result= miscUtils.api_response_time(url,endpoint)
    assert result < 1000


@given(parsers.parse('User hits post api for "{endpointname}" of apiadmin for "{user}"'))
def user_reset_the_password(api_request_context_auth, api_respone_context, endpointname, user):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    request_body = miscUtils.getspecificattributevalueofclass(PasswordReset, user)
    print(type(request_body))
    #final_data = ast.literal_eval(request_body)
    final_data= request_body
    RESTRequestUtils().post(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=final_data,
                    )


@then(parsers.parse('verify response schema is valid'))
def reset_password_schema(api_respone_context):
    assert RESTResponseUtils().json_schema_validator("TestData/ADMIN_TestData/adminresetpassword.json",
                                                     api_respone_context.get_response_content())


@given(parsers.parse('User hits correct Update token post api for "{endpointname}" of apiadmin'))
def user_update_the_token(api_request_context_auth, api_respone_context, endpointname,get_update_token):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    RESTRequestUtils().post(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=get_update_token,
                    )


@given(parsers.parse('User hits Incorrect Update token post api for "{endpointname}" of apiadmin'))
def user_update_the_wrong_token_value(api_request_context_auth, api_respone_context, endpointname,get_bad_update_token):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    RESTRequestUtils().post(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=get_bad_update_token,
                    )


@then(parsers.parse('verify error status should be "{expected_status_code}"'))
def verify_error_status_code(api_request_context_error, expected_status_code):
    response = miscUtils.get_nested_value(api_request_context_error, ["StatusCode"])
    assert (response) == int(expected_status_code)

@then(parsers.parse('verify message contain "{expected_message}"'))
def verify_message_error(api_request_context_error, expected_message):
    response = miscUtils.get_nested_value(api_request_context_error, ["Message"])
    assert expected_message in response

@then(parsers.parse('verify error encodedmessage contain "{expected_message}"'))
def verify_error_message(api_request_context_error, expected_message):
    response = miscUtils.get_nested_value(api_request_context_error, ["Error","EncodedPassword"])
    assert expected_message in response

@then(parsers.parse('verify error usermessage contain "{expected_message}"'))
def verify_username_error_message(api_request_context_error, expected_message):
    response = miscUtils.get_nested_value(api_request_context_error, ["Error","UserName"])
    assert expected_message in response

@then(parsers.parse('verify nested response Result ,TokenTTL should be "{expected_response}"'))
def verify_tokenttl_time(api_respone_context, expected_response):
    response = api_respone_context.get_response()
    actual_message = RESTResponseUtils().get_nested_response_data_tokenttl(response)
    #if expected_response == 'None':
        #expected_response = None
    assert int(actual_message) == int(expected_response)