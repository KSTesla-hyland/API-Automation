
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

scenarios("../Features/PhysiciansController_Adminapi.feature")

@then(parsers.parse('verify response schema is valid'))
def reset_password_schema(api_respone_context):
    assert RESTResponseUtils().json_schema_validator("TestData/ADMIN_TestData/adminresetpassword.json",
                                                     api_respone_context.get_response_content())

@given(parsers.parse('User creates new endpoint from newly created Physicians using "{endpointname}" api'))
def store_Id_and_endpoint_of_new_Physicians(api_request_context_auth, api_respone_context, endpointname,
                                                test_data_store):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    RESTRequestUtils().get(api_request_context_auth, api_respone_context, endpoint)
    response = api_respone_context.get_response_json()
    Physicians_update = miscUtils.get_id_by_firstname_from_response(response, "API","Physician")
    test_data_store["Physicians_id"] = Physicians_update

@given(parsers.parse('User hits the put api for Physicians of apiadmin'))
def edit_the_Physicians(api_request_context_auth, api_respone_context, test_data_store):
    physicians_id = test_data_store.get("Physicians_id")
    endpoint = f"{physicians_id}"
    uuid_only = endpoint.split("/")[-1]
    final_data = miscUtils.readFileContentAsString("TestData/POST_Data/EditPhysicians.json")
    data = json.loads(final_data)
    data["id"] = uuid_only
    RESTRequestUtils().put(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
    )

@given(parsers.parse('User hits the delete api for Physicians of apiadmin'))
def delete_the_Physicians(api_request_context_auth, api_respone_context, test_data_store):
    physicians_id = test_data_store.get("Physicians_id")
    endpoint = f"{physicians_id}"
    RESTRequestUtils().delete(
        api_request_context_auth,
        api_respone_context,
        endpoint,
    )