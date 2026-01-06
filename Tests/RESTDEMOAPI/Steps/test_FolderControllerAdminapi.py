from pytest_bdd import scenarios, then, given, parsers
import sys
import os
import json

from Configuration.RESTDEMOAPI.endpoints import Endpoints
from Configuration.RESTDEMOAPI.passwordreset import PasswordReset
from Tests.RESTDEMOAPI.Steps.conftest import get_update_token
from Utility.APIUtility.RESTDEMOAPI.RESTResponseUtils import RESTResponseUtils

sys.path.append(os.getcwd())

from Utility.miscUtils import miscUtils
from Utility.APIUtility.RESTDEMOAPI.RESTRequestUtils import RESTRequestUtils

scenarios("../Features/FolderController_Adminapi.feature")

@then(parsers.parse('verify response schema is valid'))
def reset_password_schema(api_respone_context):
    assert RESTResponseUtils().json_schema_validator("TestData/RESTDEMOAPI_TestData/adminresetpassword.json",
                                                     api_respone_context.get_response_content())


@given(parsers.parse('User creates new endpoint from newly created folder using "{endpointname}" api'))
def store_Id_and_endpoint_of_new_folder_layout(api_request_context_auth, api_respone_context, endpointname,
                                                test_data_store):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    RESTRequestUtils().get(api_request_context_auth, api_respone_context, endpoint)
    response = api_respone_context.get_response_json()
    Folder_update = miscUtils.get_id_by_name_from_response(response, "ApiAutomation","Folder")
    test_data_store["Folder_id"] = Folder_update

@given(parsers.parse('User hits the put api for folder of apiadmin'))
def edit_the_folder(api_request_context_auth, api_respone_context, test_data_store):
    folder_id = test_data_store.get("Folder_id")
    endpoint = f"{folder_id}"
    uuid_only = endpoint.split("/")[-1]
    final_data = miscUtils.readFileContentAsString("TestData/POST_Data/EditFolder.json")
    data = json.loads(final_data)
    data["id"] = uuid_only
    RESTRequestUtils().put(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
    )

@given(parsers.parse('User hits the delete api for Folder of apiadmin'))
def delete_the_folder(api_request_context_auth, api_respone_context, test_data_store):
    folder_id = test_data_store.get("Folder_id")
    endpoint = f"{folder_id}"
    RESTRequestUtils().delete(
        api_request_context_auth,
        api_respone_context,
        endpoint,
    )