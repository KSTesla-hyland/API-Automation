import os
import sys

from Utility.miscUtils import miscUtils
sys.path.append(os.getcwd())

from Utility.CommonAPIUtility.ResponseUtils import GenericResponse, GenericResponseUtils


class Response(GenericResponse):
    def __init__(self, response):
        self.api_response = response


class RESTResponseUtils(GenericResponseUtils):
    
    def get_response_data(self, response,key):
        """
        This method takes api response as argument and returns any key value in response (success/failure mesage)
        """
        response_dict = RESTResponseUtils().parseJSONbodyToDictionary(response)
        capital_dict = miscUtils.capitalize_keys_first_letter(response_dict)
        return capital_dict[key]

    def get_nested_response_data(self, response,key1,key2):
        response_dict = RESTResponseUtils().parseJSONbodyToDictionary(response)
        capital_dict = miscUtils.capitalize_keys_first_letter(response_dict)
        nested_response = miscUtils.get_nested_value(capital_dict, [key1, key2])
        return nested_response
