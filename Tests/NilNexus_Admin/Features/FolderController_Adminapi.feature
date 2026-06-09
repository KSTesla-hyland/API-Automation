Feature: This feature is to verify API status of Folder controller of admin api

  @adminapi @FolderController @validusers @foldermoduleview
	Scenario Outline: Verify Response schema and status code of viewing folder module for systemadmin ,systemapiadmin
                      and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "FolderModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "4"
        Then verify response for inner nested key "Name" should be "TEST"
        Then verify response for inner nested key "Name" should be "shivam1"
        Then verify response for inner nested key "Name" should be "shivam2"
        Then verify response for inner nested key "Name" should be "Quartz"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

    @adminapi @FolderController @otherusers @foldermoduleview
	Scenario Outline: Verify Response schema and status code of viewing folder module for
                      Technologists,OptimizerAdmin and Schedular user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "FolderModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have FolderRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

    @adminapi @FolderController @validusers @folderview
	Scenario Outline: Verify Response schema and status code of viewing a particular folder for systemadmin ,systemapiadmin
                      and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "FolderView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Name" should be "TEST"
        Then verify nested response "Result ,IsTeaching" should be "False"
        Then verify response for inner nested key "Value" should be "systemapiadmin"
        Then verify response for inner nested key "Value" should be "systemtestuser"
        Then verify response for inner nested key "Value" should be "systemadmin"
        Then verify response for inner nested key "Value" should be "MD"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

    @adminapi @FolderController @otherusers @folderview
	Scenario Outline: Verify Response schema and status code of viewing a particular folder for
                      Technologists,OptimizerAdmin and Schedular user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "FolderView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have FolderRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

    @adminapi @FolderController @validusers @folderCreate
	Scenario Outline: Verify Response schema and status code of creating a new folder, editing and deleting
                      for systemadmin ,Imagining Provider and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "FolderCreate" of apiadmin using "TestData/POST_Data/CreateFolder.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
        Given User creates new endpoint from newly created folder using "FolderModuleView" api
        Given User hits the put api for folder of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for Folder of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify response "Message" should be "Success"
        Then verify response schema is valid
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

    @adminapi @FolderController @otherusers @folderedit
	Scenario Outline: Verify Response schema and status code of editing a new Folder for Optimizer admin
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "FolderView" of using "TestData/POST_Data/EditFolder.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have FolderModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

    @adminapi @FolderController @otherusers @folderdelete
	Scenario Outline: Verify Response schema and status code of deleting a new folder for Optimizer admin
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "FolderView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have FolderDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

    @adminapi @FolderController @otherusers @FolderCreate
	Scenario Outline: Verify Response schema and status code of creating a new Folder
                      for Optimizer admin,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "FolderCreate" of apiadmin using "TestData/POST_Data/CreateFolder.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have FolderCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|