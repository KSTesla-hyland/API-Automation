Feature: This feature is to verify API status of Group controller of admin api

  @adminapi @GroupController @validusers @Groupmoduleview
	Scenario Outline: Verify Response schema and status code of viewing Group module for systemadmin ,systemapiadmin
                      Optimizer Admin and Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GroupModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "2"
        Then verify response for inner nested key "Name" should be "Test Group"
        Then verify response for inner nested key "Name" should be "New Group"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @otherusers @Groupmoduleview
	Scenario Outline: Verify Response schema and status code of viewing Group module for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GroupModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GroupRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @validusers @Groupview
	Scenario Outline: Verify Response schema and status code of viewing a particular Group for systemadmin ,systemapiadmin
                      Optimizer Admin and Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GroupView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Name" should be "Test Group"
        Then verify response for inner nested key "Value" should be "systemapiadmin"
        Then verify response for inner nested key "Value" should be "systemtestuser"
        Then verify response for inner nested key "Value" should be "systemadmin"
        Then verify response for inner nested key "Value" should be "Test4"
        Then verify response for inner nested key "Value" should be "Jen"
        Then verify response for inner nested key "Value" should be "Test"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @otherusers @Groupview
	Scenario Outline: Verify Response schema and status code of viewing a particular Group for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GroupView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GroupRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @validusers @GroupCreate
	Scenario Outline: Verify Response schema and status code of creating a new Group, editing and deleting
                      for systemadmin ,systemapiadmin and Optimizer Admin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "GroupCreate" of apiadmin using "TestData/POST_Data/CreateGroup.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
        Given User creates new endpoint from newly created Group using "GroupModuleView" api
        Given User hits the put api for Group of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for Group of apiadmin
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

  @adminapi @GroupController @otherusers @GroupEdit
	Scenario Outline: Verify Response schema and status code of editing a new Group for Imagining Provider
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "GroupView" of using "TestData/POST_Data/EditGroup.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GroupModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @otherusers @Groupdelete
	Scenario Outline: Verify Response schema and status code of deleting a new Group for Imagining Provider
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "GroupView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GroupDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @otherusers @GroupCreate
	Scenario Outline: Verify Response schema and status code of a new Group creating
                      for Technologists, schedular and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "GroupCreate" of apiadmin using "TestData/POST_Data/CreateGroup.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GroupCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @validusers @Groupusers
	Scenario Outline: Verify Response schema and status code of viewing Group users for systemadmin ,systemapiadmin
                      Optimizer Admin and Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GroupUsers" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "11"
        Then verify response for inner nested key "UserName" should be "systemapiadmin"
        Then verify response for inner nested key "UserName" should be "systemtestuser"
        Then verify response for inner nested key "UserName" should be "systemadmin"
        Then verify response for inner nested key "UserName" should be "Test4"
        Then verify response for inner nested key "UserName" should be "Jen"
        Then verify response for inner nested key "UserName" should be "Test"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @otherusers @Groupusers
	Scenario Outline: Verify Response schema and status code of viewing Group users for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GroupUsers" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GroupRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @validusers @Groupworklists
	Scenario Outline: Verify Response schema and status code of viewing Group Worklists for systemadmin ,systemapiadmin
                      Optimizer Admin and Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GroupWorklist" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "2"
        Then verify response for inner nested key "Name" should be "Government"
        Then verify response for inner nested key "Name" should be "isoneofinsurance"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @GroupController @otherusers @Groupworklists
	Scenario Outline: Verify Response schema and status code of viewing Group Worklists for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "GroupWorklist" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have GroupRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
