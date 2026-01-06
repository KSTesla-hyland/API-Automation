Feature: This feature is to verify API status of Role controller of admin api

  @adminapi @RoleController @validusers @Rolemoduleview
	Scenario Outline: Verify Response schema and status code of viewing Role module for systemadmin
                        and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "RoleModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "11"
        Then verify response for inner nested key "Name" should be "System: Admin"
        Then verify response for inner nested key "Name" should be "System: Scheduler"
        Then verify response for inner nested key "Name" should be "System: Technologist"
        Then verify response for inner nested key "Name" should be "System: ApiAdmin"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @RoleController @otherusers @Rolemoduleview
	Scenario Outline: Verify Response schema and status code of viewing Role module for
                      Technologists, Optimizer Admin, Schedular and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "RoleModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have RoleRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @RoleController @validusers @Roleview
	Scenario Outline: Verify Response schema and status code of viewing a particular Role for systemadmin
                      and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "RoleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify response for inner nested key "Value" should be "AbsencesCreate"
        Then verify response for inner nested key "Value" should be "CollectionDelete"
        Then verify response for inner nested key "Value" should be "DoctorLayoutPush"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @RoleController @otherusers @Roleview
	Scenario Outline: Verify Response schema and status code of viewing a particular Role for
                      Technologists, Schedular, Optimizer Admin and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "RoleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have RoleRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @RoleController @validusers @RoleCreate
	Scenario Outline: Verify Response schema and status code of creating a new Role, editing and deleting
                      for systemadmin and systemapiadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "RoleCreate" of apiadmin using "TestData/POST_Data/CreateRole.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
        Given User creates new endpoint from newly created Role using "RoleModuleView" api
        Given User hits the put api for Role of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for Role of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify response "Message" should be "Success"
        Then verify response schema is valid
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @RoleController @otherusers @RoleEdit
	Scenario Outline: Verify Response schema and status code of editing a new Role for
                      Technologists, Schedular, Optimizer Admin and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "RoleView" of using "TestData/POST_Data/EditRole.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have RoleModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @RoleController @otherusers @RoleDelete
	Scenario Outline: Verify Response schema and status code of deleting a new Role for
                      Technologists, Schedular, Optimizer Admin and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "RoleView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have RoleDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @RoleController @otherusers @RoleCreate
	Scenario Outline: Verify Response schema and status code of a new Role creating
                      Technologists, Schedular, Optimizer Admin and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "RoleCreate" of apiadmin using "TestData/POST_Data/CreateRole.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have RoleCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @RoleController @validusers @RoleResetClaims
	Scenario Outline: Verify Response schema and status code of a existing Role Reset
                      for systemadmin and systemapiadmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "RoleReset" of apiadmin using "TestData/POST_Data/ResetRole.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify response for inner nested key "Status" should be "9eff8915-0f9d-4dc3-a2a4-7f9c89c8c214 role claims have been reset"
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @RoleController @otherusers @RoleCreate
	Scenario Outline: Verify Response schema and status code of a existing Role Reset
                      Technologists, Schedular, Optimizer Admin and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "RoleReset" of apiadmin using "TestData/POST_Data/ResetRole.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have RoleModify permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|


