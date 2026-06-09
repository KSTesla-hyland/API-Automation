Feature: This feature is to verify API status of InsuranceCode controller of admin api

  @adminapi @InsuranceCodeController @validusers @InsuranceCodemoduleview
	Scenario Outline: Verify Response schema and status code of viewing InsuranceCode module for systemadmin ,systemapiadmin
                      Optimizer Admin and Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "InsuranceCodeModuleView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "14"
        Then verify response for inner nested key "Name" should be "Government"
        Then verify response for inner nested key "Name" should be "Privately Insured"
        Then verify response for inner nested key "Name" should be "test1"
        Then verify response for inner nested key "Name" should be "test2"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @InsuranceCodeController @otherusers @InsuranceCodemoduleview
	Scenario Outline: Verify Response schema and status code of viewing InsuranceCode module for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "InsuranceCodeModuleView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have InsuranceCodeRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @InsuranceCodeController @validusers @InsuranceCodeview
	Scenario Outline: Verify Response schema and status code of viewing a particular InsuranceCode for systemadmin ,systemapiadmin
                      Optimizer Admin and Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "InsuranceCodeView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Name" should be "test1"
        Then verify response for inner nested key "Value" should be "Test4"
        Then verify response for inner nested key "Value" should be "test1"
        Then verify response for inner nested key "Value" should be "user2"
        Then verify response for inner nested key "Value" should be "Stacey"
        Then verify response for inner nested key "Value" should be "User1"
        Then verify response for inner nested key "Value" should be "User4"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @InsuranceCodeController @otherusers @InsuranceCodeview
	Scenario Outline: Verify Response schema and status code of viewing a particular InsuranceCode for
                      Technologists and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "InsuranceCodeView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have InsuranceCodeRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @InsuranceCodeController @validusers @InsuranceCodeCreate
	Scenario Outline: Verify Response schema and status code of creating a new InsuranceCode, editing and deleting
                      for systemadmin ,systemapiadmin and Optimizer Admin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "InsuranceCodeCreate" of apiadmin using "TestData/POST_Data/CreateInsuranceCode.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify the response time
        Given User creates new endpoint from newly created InsuranceCode using "InsuranceCodeModuleView" api
        Given User hits the put api for InsuranceCode of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for InsuranceCode of apiadmin
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

  @adminapi @InsuranceCodeController @otherusers @InsuranceCodeEdit
	Scenario Outline: Verify Response schema and status code of editing a new InsuranceCode for Imagining Provider
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "InsuranceCodeView" of using "TestData/POST_Data/EditInsuranceCode.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have InsuranceCodeModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @InsuranceCodeController @otherusers @InsuranceCodedelete
	Scenario Outline: Verify Response schema and status code of deleting a new InsuranceCode for Imagining Provider
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "InsuranceCodeView" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have InsuranceCodeDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @InsuranceCodeController @otherusers @InsuranceCodeCreate
	Scenario Outline: Verify Response schema and status code of a new InsuranceCode creating
                      for Technologists, schedular and Imagining Provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "InsuranceCodeCreate" of apiadmin using "TestData/POST_Data/CreateInsuranceCode.json" data
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have InsuranceCodeCreate permission."
        Then verify the response time
        Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|