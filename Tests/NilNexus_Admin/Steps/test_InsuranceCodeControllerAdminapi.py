import base64

from pytest_bdd import scenarios, then, given, parsers
import sys
import os
import json

from Configuration.ADMIN.endpoints import Endpoints
from Configuration.ADMIN.passwordreset import PasswordReset
from Tests.NilNexus_ADMIN.Steps.conftest import get_update_token
from Utility.APIUtility.ADMIN.RESTResponseUtils import RESTResponseUtils

sys.path.append(os.getcwd())

from Utility.miscUtils import miscUtils
from Utility.APIUtility.ADMIN.RESTRequestUtils import RESTRequestUtils

scenarios("../Features/InsuranceCodeController_Adminapi.feature")

@then(parsers.parse('verify response schema is valid'))
def reset_password_schema(api_respone_context):
    assert RESTResponseUtils().json_schema_validator("TestData/ADMIN_TestData/adminresetpassword.json",
                                                     api_respone_context.get_response_content())

@given(parsers.parse('User creates new endpoint from newly created InsuranceCode using "{endpointname}" api'))
def store_Id_and_endpoint_of_new_InsuranceCode(api_request_context_auth, api_respone_context, endpointname,
                                                test_data_store):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    RESTRequestUtils().get(api_request_context_auth, api_respone_context, endpoint)
    response = api_respone_context.get_response_json()
    InsuranceCode_update = miscUtils.get_code_from_response(response, "API","InsuranceCode")
    test_data_store["InsuranceCode_id"] = InsuranceCode_update

@given(parsers.parse('User hits the put api for InsuranceCode of apiadmin'))
def edit_the_InsuranceCode(api_request_context_auth, api_respone_context, test_data_store):
    insuranceCode_id = test_data_store.get("InsuranceCode_id")
    endpoint = f"{insuranceCode_id}"
    uuid_only = endpoint.split("/")[-1]
    uuid_decoded = base64.b64decode(uuid_only).decode("utf-8")
    final_data = miscUtils.readFileContentAsString("TestData/POST_Data/EditInsuranceCode.json")
    data = json.loads(final_data)
    data["code"] = uuid_decoded
    RESTRequestUtils().put(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
    )

@given(parsers.parse('User hits the delete api for InsuranceCode of apiadmin'))
def delete_the_InsuranceCode(api_request_context_auth, api_respone_context, test_data_store):
    insuranceCode_id = test_data_store.get("InsuranceCode_id")
    endpoint = f"{insuranceCode_id}"
    RESTRequestUtils().delete(
        api_request_context_auth,
        api_respone_context,
        endpoint,
    )