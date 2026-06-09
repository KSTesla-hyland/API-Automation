Feature: This feature is to verify API status of subspecialty controller of admin api

  @adminapi @subspecialtyController @validusers @subspecialtymoduleview
	Scenario Outline: Verify Response schema and status code of viewing subspecialty module for systemadmin
                        Schedular,Optimizer Admin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "subspecialtyModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "3"
        Then verify response for inner nested key "Name" should be "BODY"
        Then verify response for inner nested key "Name" should be "VASCULAR"
        Then verify response for inner nested key "Name" should be "Default"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @subspecialtyController @otherusers @subspecialtymoduleview
	Scenario Outline: Verify Response schema and status code of viewing subspecialty module for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "subspecialtyModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have SubspecialtyRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @subspecialtyController @validusers @subspecialtyview
	Scenario Outline: Verify Response schema and status code of viewing a particular subspecialty for systemadmin
                      Schedular,Optimizer Admin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "subspecialtyView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify response for inner nested key "Value" should be "CT HEAD/ORBITS W/WO"
        Then verify response for inner nested key "Value" should be "CT COLONOGRAPHY DX W IV CONTRAST"
        Then verify response for inner nested key "Value" should be "CT COLONOGRAPHY DX WO IV CONTRAST"
        Then verify response for inner nested key "Value" should be "CT ABDOMEN W & W/O IV CONTRAST"
        Then verify response for inner nested key "Value" should be "CT ABDOMEN W IV CONTRAST"
        Then verify response for inner nested key "Key" should be "RAD3330633"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @subspecialtyController @otherusers @subspecialtyview
	Scenario Outline: Verify Response schema and status code of viewing a particular subspecialty for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "subspecialtyView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have SubspecialtyRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @subspecialtyController @validusers @subspecialtyCreate
	Scenario Outline: Verify Response schema and status code of creating a new subspecialty, editing and deleting
                      for systemadmin ,Optimizer Admin and systemapiadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "subspecialtyCreate" of apiadmin using "TestData/POST_Data/Createsubspecialty.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
        Given User creates new endpoint from newly created subspecialty using "subspecialtyModuleView" api
        Given User hits the put api for subspecialty of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for subspecialty of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify response "Message" should be "Success"
        Then verify response schema is valid
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @subspecialtyController @otherusers @subspecialtyEdit
	Scenario Outline: Verify Response schema and status code of editing a new subspecialty for
                      Technologists, Schedular and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "subspecialtyView" of using "TestData/POST_Data/EditSubspecialty.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have SubspecialtyModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @subspecialtyController @otherusers @subspecialtyDelete
	Scenario Outline: Verify Response schema and status code of deleting a new subspecialty for
                      Technologists, Schedular and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "subspecialtyView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have SubspecialtyDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @subspecialtyController @otherusers @subspecialtyCreate
	Scenario Outline: Verify Response schema and status code of a new subspecialty creating
                      Technologists, Schedular and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "subspecialtyCreate" of apiadmin using "TestData/POST_Data/Createsubspecialty.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have SubspecialtyCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|