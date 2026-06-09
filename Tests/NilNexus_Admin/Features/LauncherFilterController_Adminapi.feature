Feature: This feature is to verify API status of Launcher Filter controller of admin api

  @adminapi @LauncherFilterController @validusers @LauncherFiltermoduleview
	Scenario Outline: Verify Response schema and status code of viewing Launcher Filter module for systemadmin and systemapiadmin
                      user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "LauncherFilterModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "1"
        Then verify response for inner nested key "Key" should be "EasyViz"
        Then verify response for inner nested key "Key" should be "Nil"
        Then verify response for inner nested key "ExamCode" should be "None"
        Then verify response for inner nested key "ExamProvider" should be "None"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @LauncherFilterController @otherusers @LauncherFiltermoduleview
	Scenario Outline: Verify Response schema and status code of viewing Launcher Filter module for
                      Technologists,Optimizer Admin,Scheduler and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "LauncherFilterModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherFilterRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @LauncherFilterController @validusers @LauncherFilterview
	Scenario Outline: Verify Response schema and status code of viewing a particular Launcher Filter for systemadmin ,systemapiadmin
                      user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "LauncherFilterView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify response for inner nested key "Key" should be "EasyViz"
        Then verify response for inner nested key "Key" should be "Nil"
        Then verify response for inner nested key "Name" should be "Test"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @LauncherFilterController @otherusers @LauncherFilterview
	Scenario Outline: Verify Response schema and status code of viewing a particular Launcher Filter for
                      Technologists,Optimizer Admin,Scheduler and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "LauncherFilterView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherFilterRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @LauncherFilterController @validusers @LauncherFilterview
	Scenario Outline: Verify Response schema and status code of creating a new Launcher Filter, editing and deleting
                      for systemadmin ,systemapiadmin and Optimizer Admin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "LauncherFilterCreate" of apiadmin using "TestData/POST_Data/CreateLauncherFilter.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
        Given User creates new endpoint from newly created Launcher Filter using "LauncherFilterModuleView" api
        Given User hits the put api for Launcher Filter of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for Launcher Filter of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify response "Message" should be "Success"
        Then verify response schema is valid
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @LauncherFilterController @otherusers @LauncherFilterEdit
	Scenario Outline: Verify Response schema and status code of editing a new Launcher Filter for
                      Technologists,Optimizer Admin,Scheduler and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "LauncherFilterView" of using "TestData/POST_Data/EditLauncherFilter.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherFilterModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @LauncherFilterController @otherusers @LauncherFilterDelete
	Scenario Outline: Verify Response schema and status code of deleting a new Launcher Filter for
                      Technologists,Optimizer Admin,Scheduler and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "LauncherFilterView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherFilterDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @LauncherFilterController @otherusers @LauncherFilterCreate
	Scenario Outline: Verify Response schema and status code of a new Launcher Filter creating
                      for Technologists,Optimizer Admin,Scheduler and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "LauncherFilterCreate" of apiadmin using "TestData/POST_Data/CreateLauncherFilter.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherFilterCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|