import os
import sys

from requests import HTTPError, Timeout

sys.path.append(os.getcwd())

from Configuration.RESTDEMOAPI.config import ConfigData


class CommonRESTRequestUtils:
    
    def addorupdateheader(self, api_request_context, key, value):
        """
        This method updates the request header.
        Adds the key and value to dictionary if key is not present
        Else the old value will be updated with te new one
        """
        api_request_context.headers.update({key: value})

    def deleteheader(self, api_request_context, key):
        del api_request_context.headers[key]

    def post(self, api_request_context, api_response_context, endpoint, json_data=None):
        """
        Sends a POST request. Returns Response object.
        It takes request_context, endpoint, json data, header, etc. as arguments
        """
        URI = ConfigData.BASE_URL + endpoint
        try:
            response = api_request_context.post(
                url=URI, json=json_data, verify=ConfigData.VERIFY_SSL_ERROR
            )
            api_response_context.set_response(response)
        except HTTPError as e:
            print("An HHTP error occured: " + str(e))
        except Timeout as e:
            print("Request Timeout Error occued: " + str(e))
        except Exception as e:
            print("An Error occured: " + str(e))

    def put(self, api_request_context, api_response_context, endpoint, json_data=None):
        """
        Sends a PUT request. Returns Response object.
        It takes request_context, endpoint, json data, header, etc. as arguments
        """
        URI = ConfigData.BASE_URL + endpoint
        try:
            response = api_request_context.put(
                url=URI, json=json_data, verify=ConfigData.VERIFY_SSL_ERROR
            )
            api_response_context.set_response(response)
        except HTTPError as e:
            print("An HHTP error occured: " + str(e))
        except Timeout as e:
            print("Request Timeout Error occued: " + str(e))
        except Exception as e:
            print("An Error occured: " + str(e))

    def get(self, api_request_context, api_response_context, endpoint):
        """
        Sends a GET request. Returns Response object.
        It takes request_context, endpoint, header, etc. as arguments
        """
        URI = ConfigData.BASE_URL + endpoint
        try:
            response = api_request_context.get(
                url=URI, verify=ConfigData.VERIFY_SSL_ERROR
            )
            api_response_context.set_response(response)
        except HTTPError as e:
            print("An HHTP error occured: " + str(e))
        except Timeout as e:
            print("Request Timeout Error occued: " + str(e))
        except Exception as e:
            print("An Error occured: " + str(e))

    def delete(self, api_request_context, api_response_context, endpoint):
        """
        Sends a DELETE request. Returns Response object.
        It takes request_context, endpoint, header, etc. as arguments
        """
        URI = ConfigData.BASE_URL + endpoint
        try:
            response = api_request_context.delete(
                url=URI, verify=ConfigData.VERIFY_SSL_ERROR
            )
            api_response_context.set_response(response)
        except HTTPError as e:
            print("An HHTP error occured: " + str(e))
        except Timeout as e:
            print("Request Timeout Error occued: " + str(e))
        except Exception as e:
            print("An Error occured: " + str(e))

    def patch(
        self, api_request_context, api_response_context, endpoint, json_data=None
    ):
        """
        Sends a PATCH request. Returns Response object.
        It takes request_context, endpoint, json data, header, etc. as arguments
        """
        URI = ConfigData.BASE_URL + endpoint
        try:
            response = api_request_context.patch(
                url=URI, json=json_data, verify=ConfigData.VERIFY_SSL_ERROR
            )
            api_response_context.set_response(response)
        except HTTPError as e:
            print("An HHTP error occured: " + str(e))
        except Timeout as e:
            print("Request Timeout Error occued: " + str(e))
        except Exception as e:
            print("An Error occured: " + str(e))
