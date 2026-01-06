import json
import os
import sys

import xmltodict
from bs4 import BeautifulSoup
from jsonschema import validate
import xmlschema
from jsonschema.exceptions import ValidationError

sys.path.append(os.getcwd())


from Utility.miscUtils import miscUtils


class GenericResponse:
    def __init__(self, response):
        self.api_response = response

    def set_response(self, response):
        """
        This method takes response as argument and set/update the response value
        """
        self.api_response = response

    def get_response(self):
        """
        This method returns the last returned response from the session request
        """
        return self.api_response

    """
    This method takes response as argument and returns status code of the same
    """

    def get_status_code(self):
        return self.api_response.status_code

    """
        This method takes response as argument and returns text representation of the same
    """

    def get_response_text(self):
        return self.api_response.text

    def get_response_json(self):
        """
        This method takes api response as argument and returns json representation of the same
        """
        return self.api_response.json()

    def get_response_content(self):
        """
        This method returns all the content of response,mainly it will be used if the response is other then JSON or string
        """
        return self.api_response.content

    def get_status_text(self):
        """
        This method takes response as argument and returns status text of the same
        """
        return self.api_response.reason

class GenericResponseUtils:

    """
    This method takes response as argument, parses its body to dictionary.
    !!!Use this method when the response is of XML type
    """

    def parseXMLbodyToDictionary(self, response):
        return xmltodict.parse(response.text)

    """
        This method takes response as argument, parses its body to dictionary. 
        !!!Use this method when the response is of JSON type
    """

    def parseJSONbodyToDictionary(self, response):
        return json.loads(response.text)

    """
    This method verifies JSON schema
    """

    def json_schema_validator(self, schema_file_path, response):
        try:
            expectedSchema = miscUtils.json_to_dict(schema_file_path)
            if isinstance(response, bytes):
                response_str = response.decode('utf-8')
            else:
                response_str = response.text
            actualSchema = miscUtils.json_to_dict(response_str)
            validate(instance=actualSchema, schema=expectedSchema)
            return True
        except ValidationError as e:
            error_details = (
                f"Schema validation failed!\n"
                f"Message: {e.message}\n"
                f"Response Path: {' -> '.join(map(str, e.path))}\n"
                f"Schema Path: {' -> '.join(map(str, e.schema_path))}\n"
                f"Invalid Value: {e.instance}"
            )
            raise AssertionError(error_details)


    def extarct_specific_tag_value(self, content, tag_name):
        soup = BeautifulSoup(content, "lxml")
        if tag_name == "title":
            return soup.title

    def xml_schema_validator(self, schema_file_path, response):
        try:
            expectedSchema = miscUtils.readFileContentAsString(schema_file_path)
            actualSchema = response.text
            xmlschema.validate(actualSchema, expectedSchema)
            return True
        except Exception as e:
            return False
