Feature: This feature is to verify API status of Priority controller of admin api

  @adminapi @PriorityController @validusers @Prioritymoduleview
	Scenario Outline: Verify Response schema and status code of viewing Priority module for systemadmin,
                      Optimizer Admin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "PriorityModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "6"
        Then verify response for inner nested key "Code" should be "STAT"
        Then verify response for inner nested key "Code" should be "R"
        Then verify response for inner nested key "Code" should be "S"
        Then verify response for inner nested key "Code" should be "A"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PriorityController @otherusers @Prioritymoduleview
	Scenario Outline: Verify Response schema and status code of viewing Priority module for
                      Technologists, Schedular and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "PriorityModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PriorityRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PriorityController @validusers @Priorityview
	Scenario Outline: Verify Response schema and status code of viewing a particular Priority for systemadmin,
                      Optimizer Admin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "PriorityView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify response for inner nested key "Code" should be "STAT"
        Then verify response for inner nested key "Description" should be "STAT"
        Then verify response for inner nested key "Rank" should be "1"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PriorityController @otherusers @Priorityview
	Scenario Outline: Verify Response schema and status code of viewing a particular Priority for
                      Technologists Schedular and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "PriorityView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PriorityRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PriorityController @validusers @PriorityCreate
	Scenario Outline: Verify Response schema and status code of creating a new Priority, editing and deleting
                      for systemadmin ,systemapiadmin and Optimizer Admin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "PriorityCreate" of apiadmin using "TestData/POST_Data/CreatePriority.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
        Given User creates new endpoint from newly created Priority using "PriorityModuleView" api
        Given User hits the put api for Priority of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for Priority of apiadmin
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

  @adminapi @PriorityController @otherusers @PriorityEdit
	Scenario Outline: Verify Response schema and status code of editing a new Priority for
                      Technologists, Scheduler and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "PriorityView" of using "TestData/POST_Data/EditPriority.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PriorityModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PriorityController @otherusers @PriorityDelete
	Scenario Outline: Verify Response schema and status code of deleting a new Priority for
                      Technologists, Scheduler and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "PriorityView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PriorityDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @PriorityController @otherusers @PriorityCreate
	Scenario Outline: Verify Response schema and status code of a new Priority creating
                      Technologists, Scheduler, Optimizer Admin and Imagining Provider user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "PriorityCreate" of apiadmin using "TestData/POST_Data/CreatePriority.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have PriorityCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|