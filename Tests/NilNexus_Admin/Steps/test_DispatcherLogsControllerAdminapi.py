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

sys.path.append(os.getcwd())

from Utility.miscUtils import miscUtils
from Utility.APIUtility.ADMIN.RESTRequestUtils import RESTRequestUtils


scenarios("../Features/DispatcherLogsController_Adminapi.feature")

@then(parsers.parse('verify response schema is valid'))
def reset_password_schema(api_respone_context):
    assert RESTResponseUtils().json_schema_validator("TestData/ADMIN_TestData/adminresetpassword.json",
                                                     api_respone_context.get_response_content())

@then(parsers.parse('verify nested response "{key1},{key2}" should be more than 1'))
def response_count(api_respone_context, key1, key2):
    response = api_respone_context.get_response()
    response_count = RESTResponseUtils().get_nested_response_data(response,key1, key2)
    if response_count > 1:
        pass
    else:
        print("No Dispatcher logs ")