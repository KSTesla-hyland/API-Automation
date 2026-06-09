Feature: This feature is to verify API status of analytics  dropdown controller of admin api

	  @adminapi @analyticsdropdown @users @systemadmin
		Scenario Outline: Verify Response schema and status code of analyticsdropdownusers api for systemadmin user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "200"
			Then verify usersdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	  @adminapi @analyticsdropdown @users @Imaginingprovider
		Scenario Outline: Verify Response schema and status code of analyticsdropdownusers api for Imaginingprovider user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "200"
			Then verify usersdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @users @systemapiadmin
		Scenario Outline: Verify Response schema and status code of analyticsdropdownusers api for systemapiadmin user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "200"
			Then verify usersdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	  @adminapi @analyticsdropdown @users @Scheduler
		Scenario Outline: Verify Response schema and status code of analyticsdropdownusers api for Scheduler user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "200"
			Then verify usersdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @users @OptimizerAdmin
		Scenario Outline: Verify Response schema and status code of analyticsdropdownusers api for OptimizerAdmin user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "200"
			Then verify usersdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @users @Technologist
		Scenario Outline: Verify Response schema and status code of analyticsdropdownusers api for Technologist user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "200"
			Then verify usersdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @users @wronguser
		Scenario Outline: Verify api Response and status code of analyticsdropdownusers api for wrong user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|fsf|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @users @wrongpassword
		Scenario Outline: Verify api Response and status code of analyticsdropdownusers api for wrong password
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|user1|encodedPassword|DGVzdEAxMjM=|


	  @adminapi @analyticsdropdown @users @blankuser
		Scenario Outline: Verify api Response and status code of analyticsdropdownusers api for blank user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|BLANK|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @users @blankpassword
		Scenario Outline: Verify api Response and status code of analyticsdropdownusers api for blank password
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|user1|encodedPassword|BLANK|

	  @adminapi @analyticsdropdown @users @blankdetails
		Scenario Outline: Verify api Response and status code of analyticsdropdownusers api for blank password and username
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownUsers" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|BLANK|encodedPassword|BLANK|


	  @adminapi @analyticsdropdown @locations @systemadmin
		Scenario Outline: Verify Response schema and status code of analyticsdropdownlocation api for systemadmin user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "200"
			Then verify locationdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	  @adminapi @analyticsdropdown @locations @Imaginingprovider
		Scenario Outline: Verify Response schema and status code of analyticsdropdownlocation api for Imaginingprovider user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "200"
			Then verify locationdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @locations @Scheduler
		Scenario Outline: Verify Response schema and status code of analyticsdropdownlocation api for Scheduler user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "200"
			Then verify locationdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @locations @OptimizerAdmin
		Scenario Outline: Verify Response schema and status code of analyticsdropdownlocation api for OptimizerAdmin user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "200"
			Then verify locationdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @locations @systemapiadmin
		Scenario Outline: Verify Response schema and status code of analyticsdropdownlocation api for systemapiadmin user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "200"
			Then verify locationdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	  @adminapi @analyticsdropdown @locations @Technologist
		Scenario Outline: Verify Response schema and status code of analyticsdropdownlocation api for Technologist user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "200"
			Then verify locationdropdown response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	   @adminapi @analyticsdropdown @locations @wronguser
		Scenario Outline: Verify api Response and status code of analyticsdropdownlocation api for wrong user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|fsf|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @locations @wrongpassword
		Scenario Outline: Verify api Response and status code of analyticsdropdownlocation api for wrong password
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|user1|encodedPassword|DGVzdEAxMjM=|


	  @adminapi @analyticsdropdown @locations @blankuser
		Scenario Outline: Verify api Response and status code of analyticsdropdownlocation api for blank user
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|BLANK|encodedPassword|VGVzdEAxMjM=|

	  @adminapi @analyticsdropdown @locations @blankpassword
		Scenario Outline: Verify api Response and status code of analyticsdropdownlocation api for blank password
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|user1|encodedPassword|BLANK|

	  @adminapi @analyticsdropdown @locations @blankdetails
		Scenario Outline: Verify api Response and status code of analyticsdropdownlocation api for blank password and username
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "DropdownLocations" of apiadmin
			Then verify status should be "401"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|BLANK|encodedPassword|BLANK|