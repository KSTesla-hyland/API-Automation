import ast
import json

from pytest_bdd import scenarios, then, given, parsers
import sys
import os

from Configuration.RESTDEMOAPI import passwordreset
from Configuration.RESTDEMOAPI.config import ConfigData
from Configuration.RESTDEMOAPI.endpoints import Endpoints
from Configuration.RESTDEMOAPI.passwordreset import PasswordReset
from Tests.RESTDEMOAPI.Steps.conftest import get_update_token
from Utility.APIUtility.RESTDEMOAPI.RESTResponseUtils import RESTResponseUtils

sys.path.append(os.getcwd())

from Utility.miscUtils import miscUtils
from Utility.APIUtility.RESTDEMOAPI.RESTRequestUtils import RESTRequestUtils


scenarios("../Features/ConfigController_Adminapi.feature")

@then(parsers.parse('verify response schema is valid'))
def reset_password_schema(api_respone_context):
    assert RESTResponseUtils().json_schema_validator("TestData/RESTDEMOAPI_TestData/adminresetpassword.json",
                                                     api_respone_context.get_response_content())