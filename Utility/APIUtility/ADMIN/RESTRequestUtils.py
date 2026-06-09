import os
import sys

sys.path.append(os.getcwd())
from Configuration.ADMIN.config import ConfigData
from Utility.CommonAPIUtility.RESTRequestUtils import CommonRESTRequestUtils

class RESTRequestUtils(CommonRESTRequestUtils):
    
    # Dictionary of header key and their values stored in configuration file
    header_dict = {"Content-Type": ConfigData.CONTENT_TYPE, "Connection": "keep-alive"}
    header_dict_auth = {"Content-Type": ConfigData.CONTENT_TYPE_AUTH, "Connection": "keep-alive"}


    def create_request_body(self, attribute_keys, attribute_values):
        """
        This method takes the list of attribute keys and values and returns key-value request body dictionary
        """
        try:
            return dict(zip(attribute_keys, attribute_values))
        except Exception as e:
            print("Data provided is in wrong format : " + str(e))
