import json
import sys
import os

from pytest_bdd import scenarios, then, given, parsers

from Configuration.RESTDEMOAPI.config import ConfigData
from Configuration.RESTDEMOAPI.endpoints import Endpoints
from Utility.APIUtility.RESTDEMOAPI.RESTResponseUtils import RESTResponseUtils
from Utility.miscUtils import miscUtils
from Utility.APIUtility.RESTDEMOAPI.RESTRequestUtils import RESTRequestUtils

sys.path.append(os.getcwd())

scenarios("../Features/NilReadBookmarkController.feature")

_forget_data = json.loads(miscUtils.readFileContentAsString("TestData/POST_Data/ForgetBookmark.json"))
FORGOTTEN_STUDY_INSTANCE_UIDS = _forget_data.get("studyInstanceUids", [])


@given(parsers.parse('User hits nilread post api for "{endpointname}" using "{data}" data'))
def nilread_post_api_forget(api_request_context_auth, api_respone_context, endpointname, data):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    final_data = miscUtils.readFileContentAsString(data)
    json_data = json.loads(final_data)
    uri = ConfigData.BASE_URL_NILREAD + endpoint
    try:
        response = api_request_context_auth.post(
            url=uri,
            json=json_data,
            verify=ConfigData.VERIFY_SSL_ERROR,
        )
        api_respone_context.set_response(response)
    except Exception as e:
        print("An error occurred during NilRead POST request: " + str(e))


@given(parsers.parse('User hits nilread get api for "{endpointname}"'))
def nilread_get_api_bookmarks(api_request_context_auth, api_respone_context, endpointname):
    endpoint = miscUtils.getspecificattributevalueofclass(Endpoints, endpointname)
    uri = ConfigData.BASE_URL_NILREAD + endpoint
    try:
        response = api_request_context_auth.get(
            url=uri,
            verify=ConfigData.VERIFY_SSL_ERROR,
        )
        api_respone_context.set_response(response)
    except Exception as e:
        print("An error occurred during NilRead GET request: " + str(e))


@then(parsers.parse('verify that forgotten study is absent from bookmark list'))
def verify_bookmark_deleted(api_respone_context):
    response_dict = RESTResponseUtils().parseJSONbodyToDictionary(api_respone_context.get_response())
    all_uids = miscUtils.find_values(response_dict, "studyInstanceUid")
    for uid in FORGOTTEN_STUDY_INSTANCE_UIDS:
        assert uid not in all_uids, (
            f"Bookmark with studyInstanceUid '{uid}' "
            f"was not deleted by the forget action in NilRead 25."
        )
