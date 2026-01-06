Feature: This feature is to verify API status of Physicians controller of admin api

  @adminapi @PhysiciansController @validusers @Physiciansmoduleview
	Scenario Outline: Verify Response schema and status code of viewing Physicians module for systemadmin,
                      Optimizer Admin, Schedular and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "PhysiciansModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "12"
        Then verify response for inner nested key "ExternalId" should be "111"
        Then verify response for inner nested key "ExternalId" should be "MH111"
        Then verify response for inner nested key "ExternalId" should be "UoeJOxrk"
        Then verify response for inner nested key "ExternalId" should be "kZqJEcMP"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PhysiciansController @otherusers @Physiciansmoduleview
	Scenario Outline: Verify Response schema and status code of viewing Physicians module for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "PhysiciansModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PhysicianRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PhysiciansController @validusers @Physiciansview
	Scenario Outline: Verify Response schema and status code of viewing a particular Physicians for systemadmin,
                      Optimizer Admin, Schedular and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "PhysiciansView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify response for inner nested key "Id" should be "aa33ad28-a63f-f011-bc5c-00505690d83d"
        Then verify response for inner nested key "ExternalId" should be "UoeJOxrk"
        Then verify response for inner nested key "PhoneNumber" should be "PzLyeZn"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PhysiciansController @otherusers @Physiciansview
	Scenario Outline: Verify Response schema and status code of viewing a particular Physicians for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "PhysiciansView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PhysicianRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PhysiciansController @validusers @PhysiciansCreate
	Scenario Outline: Verify Response schema and status code of creating a new Physicians, editing and deleting
                      for systemadmin and systemapiadmin.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "PhysiciansCreate" of apiadmin using "TestData/POST_Data/CreatePhysicians.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
        Given User creates new endpoint from newly created Physicians using "PhysiciansModuleView" api
        Given User hits the put api for Physicians of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for Physicians of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify response "Message" should be "Success"
        Then verify response schema is valid
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @PhysiciansController @otherusers @PhysiciansEdit
	Scenario Outline: Verify Response schema and status code of editing a new Physicians for
                      Technologists, Scheduler, Optimizer Admin and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "PhysiciansView" of using "TestData/POST_Data/EditPhysicians.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PhysicianModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PhysiciansController @otherusers @PhysiciansDelete
	Scenario Outline: Verify Response schema and status code of deleting a new Physicians for
                      Technologists, Scheduler, Optimizer Admin and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "PhysiciansView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PhysicianDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PhysiciansController @otherusers @PhysiciansCreate
	Scenario Outline: Verify Response schema and status code of a new Physicians creating
                      Technologists, Scheduler, Optimizer Admin and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "PhysiciansCreate" of apiadmin using "TestData/POST_Data/CreatePhysicians.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PhysicianCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|