import base64

from pytest_bdd import scenarios, then, given, parsers
import sys
import os
import json

from Configuration.ADMIN.endpoints import Endpoints
from Configuration.ADMIN.passwordreset import PasswordReset
from Tests.NilNexus_ADMIN.Steps.conftest import get_update_token, api_respone_context
from Utility.APIUtility.ADMIN.RESTResponseUtils import RESTResponseUtils

sys.path.append(os.getcwd())

from Utility.miscUtils import miscUtils
from Utility.APIUtility.ADMIN.RESTRequestUtils import RESTRequestUtils

scenarios("../Features/ClaimsVerification.feature")

@then(parsers.parse('verify response schema is valid'))
def reset_password_schema(api_respone_context):
    assert RESTResponseUtils().json_schema_validator("TestData/ADMIN_TestData/adminresetpassword.json",
                                                     api_respone_context.get_response_content())

@then(parsers.parse('verify the value of response for inner nested key "{key}" is "{number}"'))
def count_values_from_response(api_respone_context,key, number):
    response = api_respone_context.get_response()
    response_dict = RESTResponseUtils().parseJSONbodyToDictionary(response)
    capital_dict = miscUtils.capitalize_keys_first_letter(response_dict)
    nested_response = miscUtils.find_values(capital_dict, key)
    if str(len(nested_response)) == str(number):
        return True
    else:
        return False