Feature: This feature is to verify API status of Geography controller of admin api

  @adminapi @GeographyController @validusers @Geographymoduleview
	Scenario Outline: Verify Response schema and status code of viewing Geography module for systemadmin ,systemapiadmin
                      Optimizer Admin and Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GeographyModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "51"
        Then verify response for inner nested key "Name" should be "IL"
        Then verify response for inner nested key "Name" should be "ID"
        Then verify response for inner nested key "Name" should be "IN"
        Then verify response for inner nested key "Name" should be "KS"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GeographyController @otherusers @Geographymoduleview
	Scenario Outline: Verify Response schema and status code of viewing Geography module for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GeographyModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GeographyRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GeographyController @validusers @Geographyview
	Scenario Outline: Verify Response schema and status code of viewing a particular Geography for systemadmin ,systemapiadmin
                      Optimizer Admin and Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GeographyView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Name" should be "KS"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GeographyController @otherusers @Geographyview
	Scenario Outline: Verify Response schema and status code of viewing a particular Geography for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GeographyView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GeographyRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GeographyController @validusers @GeographyCreate
	Scenario Outline: Verify Response schema and status code of creating a new Geography, editing and deleting
                      for systemadmin ,systemapiadmin and Optimizer Admin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "GeographyCreate" of apiadmin using "TestData/POST_Data/CreateGeography.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
        Given User creates new endpoint from newly created Geography using "GeographyModuleView" api
        Given User hits the put api for Geography of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for Geography of apiadmin
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

  @adminapi @GeographyController @otherusers @GeographyEdit
	Scenario Outline: Verify Response schema and status code of editing a new Geography for Imagining Provider
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "GeographyView" of using "TestData/POST_Data/EditGeography.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GeographyModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GeographyController @otherusers @Geographydelete
	Scenario Outline: Verify Response schema and status code of deleting a new Geography for Imagining Provider
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "GeographyView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GeographyDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GeographyController @otherusers @GeographyCreate
	Scenario Outline: Verify Response schema and status code of a new Geography creating
                      for Technologists, schedular and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "GeographyCreate" of apiadmin using "TestData/POST_Data/CreateGeography.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GeographyCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|