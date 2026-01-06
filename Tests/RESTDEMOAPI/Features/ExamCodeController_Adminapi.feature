Feature: This feature is to verify API status of ExamCode controller of admin api

  @adminapi @ExamCodeController @validusers @examview
	Scenario Outline: Verify Response schema and status code of viewing examcode for systemadmin ,systemapiadmin
                      OptimizerAdmin and Schedular user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "ExamCodeView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "1599"
        Then verify response for inner nested key "Description" should be "TEST"
        Then verify response for inner nested key "Description" should be "CT HEAD/ORBITS W/WO"
        Then verify response for inner nested key "Description" should be "CT PANEL CHEST/ABD/PELV W/WO CONTRAST"
        Then verify response for inner nested key "Description" should be "CATH LAB PROCEDURE"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @ExamCodeController @otherusers @examview
	Scenario Outline: Verify Response schema and status code of viewing examcode for
                      Technologists and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "ExamCodeView" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have ExamCodeRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @ExamCodeController @validusers @ExamCreate
	Scenario Outline: Verify Response schema and status code of creating a new Exam code, editing and deleting
                      for systemadmin ,OptimizerAdmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "ExamCodeCreate" of apiadmin using "TestData/POST_Data/CreateExamCode.json" data
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Given User hits the put api for "ExamCodeEditOrDelete" of using "TestData/POST_Data/EditExamCode.json" data
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for "ExamCodeEditOrDelete" of apiadmin
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

  @adminapi @ExamCodeController @otherusers @ExamCreate
	Scenario Outline: Verify Response schema and status code of creating a new Exam code for Imagining provider
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "ExamCodeCreate" of apiadmin using "TestData/POST_Data/CreateExamCode.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have ExamCodeCreate permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @ExamCodeController @otherusers @ExamEdit
	Scenario Outline: Verify Response schema and status code of editing a new Exam code for Imagining provider
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "ExamCodeEditOrDelete" of using "TestData/POST_Data/EditExamCode.json" data
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have ExamCodeModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @ExamCodeController @otherusers @ExamDelete
	Scenario Outline: Verify Response schema and status code of deleting a new Exam code for Imagining provider
                      ,Technologist and Scheduler user.
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "ExamCodeEditOrDelete" of apiadmin
        Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have ExamCodeDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

  @adminapi @ExamCodeController @Validusers @WrongData
	Scenario Outline: Verify Response schema and status code for creating examcodes with wrong data
                      for systemadmin ,Optimizer and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "ExamCodeCreate" of apiadmin using "TestData/POST_Data/WrongExamCreateData.json" data
		Then verify status should be "400"
		Then verify response "Result" should be "None"
		Then verify nested response "Error ,Code" should be "The Code field is required."
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @ExamCodeController @Validusers @WrongData
	Scenario Outline: Verify Response schema and status code for editing wrong examcodes
                      for systemadmin ,Optimizer and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the put api for "WrongExamCodeEditOrDelete" of using "TestData/POST_Data/EditExamCode.json" data
		Then verify status should be "404"
		Then verify response "Result" should be "None"
		Then verify response "Message" should be "Exam code with code 002-test was not found"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

  @adminapi @ExamCodeController @Validusers @WrongData
	Scenario Outline: Verify Response schema and status code for deleting wrong examcodes
                      for systemadmin ,Optimizer and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits the delete api for "WrongExamCodeEditOrDelete" of apiadmin
		Then verify status should be "404"
		Then verify response "Result" should be "None"
		Then verify response "Message" should contain text "not found"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

