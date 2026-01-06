Feature: This feature is to verify API status of DoctorLayout controller of admin api

  @adminapi @DoctorLayoutController @DoctorLayout @adminusers @view
	Scenario Outline: Verify Response schema and status code of viewing DoctorLayout page for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayout" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Count" should be "3"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @DoctorLayoutController @DoctorLayout @otherusers @view
	Scenario Outline: Verify Response schema and status code of viewing DoctorLayout page for OptimizerAdmin,Schedular,
                      Technologists and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayout" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have DoctorLayoutRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @DoctorLayoutController @DoctorLayout @adminusers @read
	Scenario Outline: Verify Response schema and status code of reading Doctor'sLayout for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayoutRead" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Id" should be "2"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @DoctorLayoutController @DoctorLayout @otherusers @read
	Scenario Outline: Verify Response schema and status code of reading Doctor'sLayout for OptimizerAdmin,Schedular,
                      Technologists and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayoutRead" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have DoctorLayoutRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @DoctorLayoutController @DoctorLayout @adminusers @Create
	Scenario Outline: Verify Response schema and status code of creating a new Doctor'sLayout, editing and deleting for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "DoctorLayoutCreate" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the response time
        Given User creates new endpoint from newly created Doctor layout using "DoctorLayout" api
        Given User hits the put api for Doctor layout of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify the response time
        Then verify response "Message" should be "Success"
        Given User hits the delete api for Doctor layout of apiadmin
        Then verify status should be "200"
        Then verify response schema is valid
        Then verify response "Message" should be "Success"
        Then verify response schema is valid
        Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @DoctorLayoutController @DoctorLayout @otherusers @Create
	Scenario Outline: Verify Response schema and status code of creating doctor layout for OptimizerAdmin,Schedular,
                      Technologists and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "DoctorLayoutCreate" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have DoctorLayoutCreate permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @DoctorLayoutController @DoctorLayout @otherusers @Edit
	Scenario Outline: Verify Response schema and status code of editing doctor layout for OptimizerAdmin,Schedular,
                      Technologists and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits put api for "DoctorLayoutEdit" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have DoctorLayoutModify permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @DoctorLayoutController @DoctorLayout @otherusers @Delete
	Scenario Outline: Verify Response schema and status code of deleting doctor layout for OptimizerAdmin,Schedular,
                      Technologists and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits delete api for "DoctorLayoutDelete" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have DoctorLayoutDelete permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @DoctorLayoutController @DoctorLayout @adminusers @WrongData
	Scenario Outline: Verify Response schema and status code for editing wrong doctor layout id for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits put api for "DoctorLayoutWrongData" of apiadmin
		Then verify status should be "400"
		Then verify response "Result" should be "None"
		Then verify nested response "Error, Id" should contain text "The value is not valid."
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @DoctorLayoutController @DoctorLayout @adminusers @WrongData
	Scenario Outline: Verify Response schema and status code for accessing wrong doctor layout id for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayoutWrongData" of apiadmin
		Then verify status should be "404"
		Then verify response "Result" should be "None"
		Then verify response "Message" should be "Doctor Layout with id 0 was not found"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @DoctorLayoutController @DoctorLayout @adminusers @WrongData
	Scenario Outline: Verify Response schema and status code for deleting wrong doctor layout id for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits delete api for "DoctorLayoutWrongData" of apiadmin
		Then verify status should be "404"
		Then verify response "Result" should be "None"
		Then verify response "Message" should be "Doctor Layout with id 0 was not found"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @DoctorLayoutController @DoctorLayout @adminusers @WrongData
	Scenario Outline: Verify Response schema and status code for creating doctor layout with wrong data for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits post api for "DoctorLayoutCreate" of apiadmin with wrongdata
		Then verify status should be "400"
		Then verify response "Result" should be "None"
		Then verify nested response "Error, IsDefault" should contain text "Could not convert string to boolean"
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @DoctorLayoutController @DoctorLayout @adminusers @check
	Scenario Outline: Verify Response schema and status code of checking a DoctorLayout for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayoutCheck" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested result response "Result ,UserName" should be "kumar shivam"
        Then verify nested result response "Result ,UserName" should be "Admin System"
        Then verify nested result response "Result ,UserName" should be "Test Four"
        Then verify nested result response "Result ,UserName" should be "Jen Tucker"
        Then verify nested result response "Result ,UserName" should be "Shubhajit Roy"
        Then verify nested result response "Result ,UserName" should be "Stacey Gordon"
        Then verify nested result response "Result ,UserName" should be "user two"
        Then verify nested result response "Result ,UserName" should be "user one"
        Then verify nested result response "Result ,UserName" should be "Kumar Shivam"
        Then verify nested result response "Result ,UserName" should be "Puspendu Mukherjee"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @adminapi @DoctorLayoutController @DoctorLayout @otherusers @check
	Scenario Outline: Verify Response schema and status code of checking a DoctorLayout for OptimizerAdmin,Schedular,
                      Technologists and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayoutCheck" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have DoctorLayoutPush permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

    @adminapi @DoctorLayoutController @DoctorLayout @adminusers @apply
	Scenario Outline: Verify Response schema and status code of applying a DoctorLayout for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits patch api for "DoctorLayoutApply" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Status" should be "success"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

    @adminapi @DoctorLayoutController @DoctorLayout @otherusers @apply
	Scenario Outline: Verify Response schema and status code of applying a DoctorLayout for OptimizerAdmin,Schedular,
                      Technologists and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayoutApply" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have DoctorLayoutRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @DoctorLayoutController @DoctorLayout @adminusers @default
	Scenario Outline: Verify Response schema and status code of checking if a doctor layout is default for systemadmin and systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayoutDefault" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,Name" should be "Jen/Quartz"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

    @adminapi @DoctorLayoutController @DoctorLayout @otherusers @default
	Scenario Outline: VVerify Response schema and status code of checking if a doctor layout is default for OptimizerAdmin,Schedular,
                      Technologists and imagining provider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "DoctorLayoutDefault" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have DoctorLayoutRead permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

