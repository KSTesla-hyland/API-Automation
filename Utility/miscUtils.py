import base64
import inspect
import json
import os
import re
import sys
import time

import PyPDF2
import requests
import xmltodict

sys.path.append(os.getcwd())


class miscUtils:

    """
        This method takes a dictionary as argument, returns all of its Keys. 
    """

    @staticmethod
    def getAllKeysFromDict(dicttobefound):
        return dicttobefound.keys()

    """
        This method takes a dictionary as argument, returns all of its Values. 
    """

    @staticmethod
    def getAllValuesFromDict(dicttobefound):
        return dicttobefound.values()

    """
        This method takes a dictionary and key as argument, returns value for the key provided. 
        Returns NONE if the key is not found in dictionary
    """

    @staticmethod
    def getValueForASpecificKeyFromDict(dicttobefound, key):
        return dicttobefound.get(key)

    """
        This method takes path of a file as argument, returns contents of the file in string format. 
    """

    @staticmethod
    def readFileContentAsString(filepath):
        try:
            file = open(filepath, "r")
            filecontent = file.read()
            file.close()
            return filecontent
        except:
            print("File not found in provided path!!")

    @staticmethod
    def xml_to_dict(xml_string):
        """
        This method takes a string xml or xml file path and returns the corresponding python dictionary
        """
        if xml_string.endswith(".xml"):
            file = open(xml_string, "r")
            xml_string = file.read()
            file.close()
        python_dict = xmltodict.parse(str(xml_string))
        return python_dict

    @staticmethod
    def json_to_dict(json_string):
        """
        This method takes a string json or json file path and returns the corresponding python dictionary
        """
        if json_string.endswith(".json"):
            file = open(json_string, "r")
            json_string = file.read()
            file.close()
        python_dict = json.loads(str(json_string))
        return python_dict

    """@staticmethod
    def getspecificattributevalueofclass(classname, attributename):
        attrval = None
        for i in inspect.getmembers(classname):
            if str(i[0]) == attributename:
                attrval = str(i[1])
                break
        if attrval is not None:
            return attrval

        else:
            print("provided attribute is not available!!")"""


    @staticmethod
    def getspecificattributevalueofclass(classname, attributename):
        for name, value in inspect.getmembers(classname):
            if name == attributename:
                # If it's a method, call it
                if callable(value):
                    return value()
                else:
                    return value
        print("Provided attribute is not available!!")

    @staticmethod
    def read_specific_word_from_pdf_file(filepath,key):
        pdfFileObj = open(filepath, 'rb')
        pdf_Reader = PyPDF2.PdfReader(pdfFileObj)

        pageObj = pdf_Reader.pages[0]
        page_text = pageObj.extract_text()
        split_list = re.split(': |, |\*|\n', page_text)

        new_list = []
        for i in split_list:
            new = i.replace(' ', '')
            new_list.append(new)

        new_list = list(dict.fromkeys(new_list))

        file_content_as_a_dictionary = {new_list[i]: new_list[i + 1] for i in range(0, len(new_list), 2)}

        URI = file_content_as_a_dictionary.get(key)
        return URI


    @staticmethod
    def read_specific_word_from_text_file(filepath,key):
        with open(filepath) as f:
            pageObj = f.readlines()

        new_list = []
        for i in range(len(pageObj)):
            new_list.append(pageObj[i].strip('\n'))

        d = dict()
        for word in new_list:
            l2 = word.split(':')
            d[l2[0]] = l2[1]

        URI = d.get(key)
        return URI


    @staticmethod
    def api_response_time(baseurl, endpoint):
        start_time = time.time()
        response = requests.get(baseurl+endpoint, verify=False)
        end_time = time.time()
        response_time = round((end_time - start_time) * 1000, 2)
        return response_time

    @staticmethod
    def get_nested_value(data, keys):
        for key in keys:
            if isinstance(data, dict):
                data = data.get(key)
            else:
                return None
        return data


    """ this method will capitalize all the keys of the dictionary, In the code it is checking if the data is dictionary or list , then it
     calls capitalize method on each value of the dictionary , then it return a new dictionary or list with the first letter capitalized."""
    @staticmethod
    def capitalize_keys_first_letter(data):
        if isinstance(data, dict):
            return {
                (key[0].upper() + key[1:] if key else key): miscUtils.capitalize_keys_first_letter(value)
                for key, value in data.items()
            }
        elif isinstance(data, list):
            return [miscUtils.capitalize_keys_first_letter(item) for item in data]
        else:
            return data

    @staticmethod
    def get_id_by_name_from_response(response_dict, target_name, resource_path):
        try:
            items = response_dict.get("result", {}).get("items", [])
            for item in items:
                if item.get("name") == target_name:
                    ID = item.get("id")
                    return f"api/{resource_path}/{ID}"
            print(f"Name '{target_name}' not found in response.")
            return None
        except Exception as e:
            print("Error while extracting ID:", e)
            return None

    @staticmethod
    def verify_value_exists(data, key,key1, search_value):
        """
        Checks if a specific value exists for a given key in the Result data
        Returns: True if found, False otherwise
        """
        if not data.get(key):
            return False

        return any(
            str(item.get(key1, '')).lower() == str(search_value).lower()
            for item in data[key]
        )

    @staticmethod
    def find_values(data, target_key):
        results = []

        if isinstance(data, dict):
            for key, value in data.items():
                if key == target_key:
                    results.append(value)
                # Recursive call
                results.extend(miscUtils.find_values(value, target_key))
        elif isinstance(data, list):
            for item in data:
                results.extend(miscUtils.find_values(item, target_key))

        return results

    @staticmethod
    def get_groupid_by_name_from_response(response_dict, target_name, resource_path):
        try:
            items = response_dict.get("result", {}).get("items", [])
            for item in items:
                if item.get("name") == target_name:
                    ID = item.get("groupId")
                    return f"api/{resource_path}/{ID}"
            print(f"Name '{target_name}' not found in response.")
            return None
        except Exception as e:
            print("Error while extracting ID:", e)
            return None

    @staticmethod
    def get_code_from_response(response_dict, target_name, resource_path):
        try:
            items = response_dict.get("result", {}).get("items", [])
            for item in items:
                name = item.get("name", "")
                description = item.get("description", "")
                if target_name in (name, description):
                    code = item.get("code")
                    base_code = base64.b64encode(str(code).encode("utf-8")).decode("utf-8")
                    return f"api/{resource_path}/{base_code}"
            print(f"'{target_name}' not found in 'name' or 'description' fields.")
            return None
        except Exception as e:
            print("Error while extracting code:", e)
            return None

    @staticmethod
    def get_id_by_firstname_from_response(response_dict, target_name, resource_path):
        try:
            items = response_dict.get("result", {}).get("items", [])
            for item in items:
                if item.get("firstName") == target_name:
                    ID = item.get("id")
                    return f"api/{resource_path}/{ID}"
            print(f"Name '{target_name}' not found in response.")
            return None
        except Exception as e:
            print("Error while extracting ID:", e)
            return None





