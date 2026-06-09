Feature: This feature is to verify API status of Launcher controller of admin api

  @adminapi @LauncherController @validusers @Launchermoduleview
	Scenario Outline: Verify Response schema and status code of viewing Launcher module for systemadmin and systemapiadmin
                      user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "LauncherModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "12"
        Then verify response for inner nested key "Id" should be "AdvancedVisualization"
        Then verify response for inner nested key "Id" should be "EasyViz"
        Then verify response for inner nested key "Id" should be "Epic"
        Then verify response for inner nested key "Id" should be "Infervision"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @LauncherController @otherusers @Launchermoduleview
	Scenario Outline: Verify Response schema and status code of viewing Launcher module for
                      Technologists,Optimizer Admin,Scheduler and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "LauncherModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @LauncherController @validusers @Launcherview
	Scenario Outline: Verify Response schema and status code of viewing a particular Launcher for systemadmin ,systemapiadmin
                      user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "LauncherView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify response for inner nested key "Id" should be "AdvancedVisualization"
        Then verify response for inner nested key "LauncherKey" should be "AdvancedVisualization"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @LauncherController @otherusers @Launcherview
	Scenario Outline: Verify Response schema and status code of viewing a particular Launcher for
                      Technologists,Optimizer Admin,Scheduler and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "LauncherView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @LauncherController @validusers @LauncherCreate
	Scenario Outline: Verify Response schema and status code of creating a new Launcher, editing and deleting
                      for systemadmin and systemapiadmin User
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "LauncherCreate" of apiadmin using "TestData/POST_Data/CreateLauncher.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
		Given User hits the put api for "LauncherEdit" of using "TestData/POST_Data/EditLauncher.json" data
        Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the response time
        Given User hits the delete api for "LauncherEdit" of apiadmin
        Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @LauncherController @otherusers @LauncherEdit
	Scenario Outline: Verify Response schema and status code of editing a new Launcher for
                      Technologists,Optimizer Admin,Scheduler and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "LauncherView" of using "TestData/POST_Data/EditLauncher.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @LauncherController @otherusers @LauncherDelete
	Scenario Outline: Verify Response schema and status code of deleting a new Launcher for
                      Technologists,Optimizer Admin,Scheduler and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "LauncherView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

    @adminapi @LauncherController @otherusers @LauncherCreate
	Scenario Outline: Verify Response schema and status code of a new Launcher creating
                      for Technologists,Optimizer Admin,Scheduler and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "LauncherCreate" of apiadmin using "TestData/POST_Data/CreateLauncher.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have LauncherCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|