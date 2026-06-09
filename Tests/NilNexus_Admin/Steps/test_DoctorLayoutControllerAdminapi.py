import ast
import json
import re
from pytest_bdd import scenarios, then, given, parsers
import sys
import os

from Configuration.ADMIN import passwordreset
from Configuration.ADMIN.config import ConfigData
from Configuration.ADMIN.endpoints import Endpoints
from Configuration.ADMIN.passwordreset import PasswordReset
from Tests.NilNexus_ADMIN.Steps.conftest import get_update_token
from Utility.APIUtility.ADMIN.RESTResponseUtils import RESTResponseUtils

sys.path.append(os.getcwd())

from Utility.miscUtils import miscUtils
from Utility.APIUtility.ADMIN.RESTRequestUtils import RESTRequestUtils

scenarios("../Features/DoctorLayoutController_Adminapi.feature")
global Doctorlayout
@then(parsers.parse('verify response schema is valid'))
def reset_password_schema(api_respone_context):
    assert RESTResponseUtils().json_schema_validator("TestData/ADMIN_TestData/adminresetpassword.json",
                                                     api_respone_context.get_response_content())

@given(parsers.parse('User hits post api for "{endpointname}" of apiadmin'))
def create_new_doctor_layout(api_request_context_auth, api_respone_context, endpointname):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    final_data =miscUtils.readFileContentAsString("TestData/POST_Data/CreateDoctorLayout.json")
    data = json.loads(final_data)
    RESTRequestUtils().post(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
            )



@given(parsers.parse('User creates new endpoint from newly created Doctor layout using "{endpointname}" api'))
def store_Id_and_endpoint_of_new_doctors_layout(api_request_context_auth, api_respone_context, endpointname,
                                                test_data_store):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    RESTRequestUtils().get(api_request_context_auth, api_respone_context, endpoint)
    response = api_respone_context.get_response_json()
    Doctorlayout_update = miscUtils.get_id_by_name_from_response(response, "new4","DoctorLayout")
    test_data_store["doctor_layout_id"] = Doctorlayout_update


@given(parsers.parse('User hits the put api for Doctor layout of apiadmin'))
def edit_the_doctor_layout(api_request_context_auth, api_respone_context, test_data_store):
    layout_id = test_data_store.get("doctor_layout_id")
    endpoint = f"{layout_id}"
    final_data = miscUtils.readFileContentAsString("TestData/POST_Data/EditDoctorLayout.json")
    data = json.loads(final_data)
    RESTRequestUtils().put(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
    )

@given(parsers.parse('User hits the delete api for Doctor layout of apiadmin'))
def delete_the_doctor_layout(api_request_context_auth, api_respone_context, test_data_store):
    layout_id = test_data_store.get("doctor_layout_id")
    endpoint = f"{layout_id}"
    RESTRequestUtils().delete(
        api_request_context_auth,
        api_respone_context,
        endpoint,
    )
@given(parsers.parse('User hits put api for "{endpointname}" of apiadmin'))
def edit_the_existing_doctor_layout(api_request_context_auth, api_respone_context, endpointname):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    final_data = miscUtils.readFileContentAsString("TestData/POST_Data/EditDoctorLayout.json")
    data = json.loads(final_data)
    RESTRequestUtils().put(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
    )

@given(parsers.parse('User hits delete api for "{endpointname}" of apiadmin'))
def edit_the_doctor_layout(api_request_context_auth, api_respone_context, endpointname):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    RESTRequestUtils().delete(
        api_request_context_auth,
        api_respone_context,
        endpoint,
    )


@then(parsers.parse('verify nested response "{key1}, {key2}" should contain text "{expected_message}"'))
def verify_response_result(api_respone_context, expected_message, key1, key2):
    response = api_respone_context.get_response()
    nested_response = RESTResponseUtils().get_nested_response_data(response, key1, key2)
    message = re.sub(r"\s*'[^']*'\s*", " ", nested_response).strip()
    assert str(expected_message) in (message)

@given(parsers.parse('User hits post api for "{endpointname}" of apiadmin with wrongdata'))
def create_new_doctor_layout(api_request_context_auth, api_respone_context, endpointname):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    final_data =miscUtils.readFileContentAsString("TestData/POST_Data/WrongCreateDoctorLayout.json")
    data = json.loads(final_data)
    RESTRequestUtils().post(
        api_request_context_auth,
        api_respone_context,
        endpoint,
        json_data=data,
            )

