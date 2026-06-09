Feature: This feature is to verify API status of account controller of admin api

	@adminapi @accountcontroller @permissions @systemadmin
	Scenario Outline: Verify Response schema and status code of permission api for systemadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AccountPermissions" of apiadmin
		Then verify status should be "200"
		Then verify permission response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "4187"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	@adminapi @accountcontroller @permissions @Imaginingprovider
	Scenario Outline: Verify Response schema and status code of permission api for Imagining provider
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AccountPermissions" of apiadmin
		Then verify status should be "200"
		Then verify permission response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "1379"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @permissions @systemapiadmin
	Scenario Outline: Verify Response schema and status code of permission api for systemapiadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AccountPermissions" of apiadmin
		Then verify status should be "200"
		Then verify permission response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "4261"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	@adminapi @accountcontroller @permissions @Scheduler
	Scenario Outline: Verify Response schema and status code of permission api for Scheduler
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AccountPermissions" of apiadmin
		Then verify status should be "200"
		Then verify permission response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "1394"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @permissions @OptimizerAdmin
	Scenario Outline: Verify Response schema and status code of permission api for OptimizerAdmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AccountPermissions" of apiadmin
		Then verify status should be "200"
		Then verify permission response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "2168"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @permissions @Technologist
	Scenario Outline: Verify Response schema and status code of permission api for Technologist
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AccountPermissions" of apiadmin
		Then verify status should be "200"
		Then verify permission response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "1094"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @resetpassword @systemadmin
	Scenario Outline: Verify password reset is successful for systemadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "ResetPassword" of apiadmin for "systemadmin"
		Then verify status should be "200"
		Then verify response "Result" should be "Password has been successfully changed"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "101"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	@adminapi @accountcontroller @resetpassword @Imaginingprovider
	Scenario Outline: Verify password reset is successful for Imagining provider
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "ResetPassword" of apiadmin for "NonAdminUser"
		Then verify status should be "403"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have UsersPasswordReset permission."
		Then verify the content length is "104"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @resetpassword @systemapiadmin
	Scenario Outline: Verify password reset is successful for systemapiadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "ResetPassword" of apiadmin for "systemapiadmin"
		Then verify status should be "403"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "ApiAdmin's password cannot be changed"
		Then verify the content length is "95"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	@adminapi @accountcontroller @resetpassword @Scheduler
	Scenario Outline: Verify password reset is successful for Scheduler
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "ResetPassword" of apiadmin for "NonAdminUser"
		Then verify status should be "403"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have UsersPasswordReset permission."
		Then verify the content length is "104"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @resetpassword @OptimizerAdmin
	Scenario Outline: Verify password reset is successful for OptimizerAdmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "ResetPassword" of apiadmin for "NonAdminUser"
		Then verify status should be "403"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have UsersPasswordReset permission."
		Then verify the content length is "104"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @resetpassword @Technologist
	Scenario Outline: Verify password reset is successful for Technologist
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "ResetPassword" of apiadmin for "NonAdminUser"
		Then verify status should be "403"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have UsersPasswordReset permission."
		Then verify the content length is "104"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @applaunch @systemadmin
	Scenario Outline: Verify app launch api for systemadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AppLaunch" of apiadmin
		Then verify status should be "200"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @appclose @systemadmin
	Scenario Outline: Verify admin close api for systemadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "CloseApp" of apiadmin
		Then verify status should be "200"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @logout @systemadmin
	Scenario Outline: Verify admin logout api for systemadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Logout" of apiadmin
		Then verify status should be "200"
		Then verify response "Result" should be "logged out"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "73"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	@adminapi @accountcontroller @logout @Imaginingprovider
	Scenario Outline: Verify admin logout api for Imagining provider
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Logout" of apiadmin
		Then verify status should be "200"
		Then verify response "Result" should be "logged out"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "73"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @logout @systemapiadmin
	Scenario Outline: Verify admin logout api for systemapiadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Logout" of apiadmin
		Then verify status should be "200"
		Then verify response "Result" should be "logged out"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "73"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	@adminapi @accountcontroller @logout @Scheduler
	Scenario Outline: Verify admin logout api for Scheduler
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Logout" of apiadmin
		Then verify status should be "200"
		Then verify response "Result" should be "logged out"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "73"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @logout @OptimizerAdmin
	Scenario Outline: Verify admin logout api for OptimizerAdmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Logout" of apiadmin
		Then verify status should be "200"
		Then verify response "Result" should be "logged out"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "73"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @logout @Technologist
	Scenario Outline: Verify admin logout api for Technologist
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Logout" of apiadmin
		Then verify status should be "200"
		Then verify response "Result" should be "logged out"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the content length is "73"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @incorrectupdatetoken @Imaginingprovider
	Scenario Outline: Verify that incorrect update token is getting generated for Imagining provider
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Incorrect Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "409"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "Invalid token"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @incorrectupdatetoken @systemadmin
	Scenario Outline: Verify that incorrect update token is getting generated for systemadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Incorrect Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "409"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "Invalid token"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	@adminapi @accountcontroller @incorrectupdatetoken @systemapiadmin
	Scenario Outline: Verify that incorrect update token is getting generated for systemapiadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Incorrect Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "409"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "Invalid token"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	@adminapi @accountcontroller @incorrectupdatetoken @Scheduler
	Scenario Outline: Verify that incorrect update token is getting generated for Scheduler
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Incorrect Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "409"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "Invalid token"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @incorrectupdatetoken @OptimizerAdmin
	Scenario Outline: Verify that incorrect update token is getting generated for OptimizerAdmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Incorrect Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "409"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "Invalid token"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @incorrectupdatetoken @Technologist
	Scenario Outline: Verify that incorrect update token is getting generated for Technologist
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Incorrect Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "409"
		Then verify response "Result" should be "None"
		Then verify response schema is valid
		Then verify response "Message" should be "Invalid token"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @correctupdatetoken @systemadmin @1
	Scenario Outline: Verify that update token is getting generated for systemadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Correct Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "200"
		Then verify nested response "Result ,TokenTTL" should be "15"
		Then verify nested response "Result ,Username" should be "System Admin"
		Then verify nested response "Result ,UserId" should be "1473ed04-861b-f011-bc42-005056908b86"
		Then verify nested response "Result ,IsPasswordChangedByFirstLogin" should be "True"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	@adminapi @accountcontroller @correctupdatetoken @Imaginingprovider
	Scenario Outline: Verify that update token is getting generated for Imagining provider
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Correct Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "200"
		Then verify nested response "Result ,TokenTTL" should be "15"
		Then verify nested response "Result ,Username" should be "one user"
		Then verify nested response "Result ,UserId" should be "5c1906b5-43c6-4023-9278-ca06051795e8"
		Then verify nested response "Result ,IsPasswordChangedByFirstLogin" should be "True"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @correctupdatetoken @systemapiadmin
	Scenario Outline: Verify that update token is getting generated for systemapiadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Correct Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "200"
		Then verify nested response "Result ,TokenTTL" should be "15"
		Then verify nested response "Result ,Username" should be "System ApiAdmin"
		Then verify nested response "Result ,UserId" should be "1273ed04-861b-f011-bc42-005056908b86"
		Then verify nested response "Result ,IsPasswordChangedByFirstLogin" should be "True"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	@adminapi @accountcontroller @correctupdatetoken @Scheduler
	Scenario Outline: Verify that update token is getting generated for Scheduler
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Correct Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "200"
		Then verify nested response "Result ,TokenTTL" should be "15"
		Then verify nested response "Result ,Username" should be "C S"
		Then verify nested response "Result ,UserId" should be "f79e9f88-d674-4f75-ab06-ede2914812ec"
		Then verify nested response "Result ,IsPasswordChangedByFirstLogin" should be "True"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @correctupdatetoken @OptimizerAdmin
	Scenario Outline: Verify that update token is getting generated for OptimizerAdmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Correct Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "200"
		Then verify nested response "Result ,TokenTTL" should be "15"
		Then verify nested response "Result ,Username" should be "a o"
		Then verify nested response "Result ,UserId" should be "0a9cf00b-93b2-4935-96c5-d721e8bde745"
		Then verify nested response "Result ,IsPasswordChangedByFirstLogin" should be "True"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @correctupdatetoken @Technologist
	Scenario Outline: Verify that update token is getting generated for Technologist
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits Correct Update token post api for "UpdateToken" of apiadmin
		Then verify status should be "200"
		Then verify nested response "Result ,TokenTTL" should be "15"
		Then verify nested response "Result ,Username" should be "no tech"
		Then verify nested response "Result ,UserId" should be "196b685e-f5ae-4603-a7b7-167fcb910fbe"
		Then verify nested response "Result ,IsPasswordChangedByFirstLogin" should be "True"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @passwordwrong
	Scenario Outline: Verify that user is unable to login if password is invalid
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given user hits login api
		Then verify status should be "404"
		Then verify response "Message" should contain text "The password provided is incorrect."
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|Techno|encodedPassword|DGVzdEAxMjM=|

	@adminapi @accountcontroller @passwordplaintext
	Scenario Outline: Verify that user is unable to login if password is plaintext
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given user hits login api
		Then verify status should be "500"
		Then verify response "Message" should contain text "Something went wrong, please contact us."
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|jfj|

	@adminapi @accountcontroller @passwordblank
	Scenario Outline: Verify that user is unable to login if password is blank
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given user hits login api
		Then verify status should be "400"
		Then verify nested response "Error ,EncodedPassword" should be "The EncodedPassword field is required."
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|BLANK|

	@adminapi @accountcontroller @userwrong
	Scenario Outline: Verify that user is unable to login if user is invalid
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given user hits login api
		Then verify status should be "404"
		Then verify response "Message" should contain text "doesn't exist"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|v|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @userblank
	Scenario Outline: Verify that user is unable to login if username is blank
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given user hits login api
		Then verify status should be "400"
		Then verify nested response "Error ,UserName" should be "The User Name field is required."
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|BLANK|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @wronguserinput
	Scenario Outline: Verify that user is unable to login if password is blank and username is wrong
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given user hits login api
		Then verify status should be "400"
		Then verify nested response "Error ,EncodedPassword" should be "The EncodedPassword field is required."
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user|encodedPassword|BLANK|

	@adminapi @accountcontroller @wronguserinput
	Scenario Outline: Verify that user is unable to login if password is blank and username is blank
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given user hits login api
		Then verify status should be "400"
		Then verify nested response "Error ,EncodedPassword" should be "The EncodedPassword field is required."
		Then verify nested response "Error ,UserName" should be "The User Name field is required."
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|BLANK|encodedPassword|BLANK|