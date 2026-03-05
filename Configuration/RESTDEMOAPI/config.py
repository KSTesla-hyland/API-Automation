class ConfigData:

    BASE_URL = "https://adminapi.nilnexus.com/"
    # BASE_URL = "https://rdv-008248.hylandqa.net/"

    CONTENT_TYPE = "application/json; charset=UTF-8" #Use "application/json" or "application/xml" as required

    VERIFY_SSL_ERROR = False

    TEST_DATA_DIRECTORY = "TestData\\RESTDEMOAPI"

    ############################################################
    #                  IDP Details                             #
    ############################################################

    BASE_URL_AUTH = "https://adminapi.nilnexus.com/"

    ############################################################
    #              NilRead 25 API Details                      #
    ############################################################

    BASE_URL_NILREAD = "https://nilread.nilnexus.com/"

    CONTENT_TYPE_AUTH = "application/json; charset=utf-8"
    rememberMe = "true"

    ############################################################
    #    DATABASE LEVEL DETAILS                                #
    ############################################################

    DB_SERVER_NAME = "NilNexusVM4\SQLSERVER2K22"

    DB_USERID = "sa"

    DB_PASSWORD = "hylandsoftware"

    DB_NAME = "NilNexus-API"
