Feature: This feature is to verify API status of analytics controller of admin api

  @adminapi @analyticscontroller @access @systemadmin @12
	Scenario Outline: Verify Response schema and status code of analyticspermission api for systemadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AnalyticsAccess" of apiadmin
		#Then verify status should be "200"
		#Then verify response schema is valid
		#Then verify response "Message" should be "Success"
		#Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	@adminapi @accountcontroller @access @Imaginingprovider
	Scenario Outline: Verify Response schema and status code of analyticspermission api for Imagining provider
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AnalyticsAccess" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have AnalyticsManage permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @access @systemapiadmin
		Scenario Outline: Verify Response schema and status code of analyticspermission api for systemapiadmin
			Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
			Given User hits get api for "AnalyticsAccess" of apiadmin
			Then verify status should be "200"
			Then verify response schema is valid
			Then verify response "Message" should be "Success"
			Then verify the response time
			Examples:
				| appname | app_name | user_name | username | password | encodedPassword |
				|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	@adminapi @accountcontroller @access @Scheduler
	Scenario Outline: Verify Response schema and status code of analyticspermission api for Scheduler
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AnalyticsAccess" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have AnalyticsManage permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @access @OptimizerAdmin
	Scenario Outline: Verify Response schema and status code of analyticspermission api for OptimizerAdmin
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AnalyticsAccess" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have AnalyticsManage permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	@adminapi @accountcontroller @access @Technologist
	Scenario Outline: Verify Response schema and status code of analyticspermission api for Technologist
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "AnalyticsAccess" of apiadmin
		Then verify status should be "403"
		Then verify response schema is valid
		Then verify response "Message" should be "You should have AnalyticsManage permission."
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	@adminapi @analyticscontroller @speedometer @systemadmin
	Scenario Outline: Verify Response of Speedometer api for systemadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Speedometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "0.0"
		Then verify nested response "Result ,TotalExamCnt" should be "0"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	@adminapi @analyticscontroller @speedometer @Imaginingprovider
	Scenario Outline: Verify Response of Speedometer api for Imaginingprovider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Speedometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "0.0"
		Then verify nested response "Result ,TotalExamCnt" should be "0"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	@adminapi @analyticscontroller @speedometer @systemapiadmin
	Scenario Outline: Verify Response of Speedometer api for systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Speedometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "0.0"
		Then verify nested response "Result ,TotalExamCnt" should be "0"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	@adminapi @analyticscontroller @speedometer @Scheduler
	Scenario Outline: Verify Response of Speedometer api for Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Speedometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "0.0"
		Then verify nested response "Result ,TotalExamCnt" should be "0"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	@adminapi @analyticscontroller @speedometer @OptimizerAdmin
	Scenario Outline: Verify Response of Speedometer api for OptimizerAdmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Speedometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "0.0"
		Then verify nested response "Result ,TotalExamCnt" should be "0"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	@adminapi @analyticscontroller @speedometer @Technologist
	Scenario Outline: Verify Response of Speedometer api for Technologist user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Speedometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "0.0"
		Then verify nested response "Result ,TotalExamCnt" should be "0"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|

	@adminapi @analyticscontroller @Odometer @systemadmin
	Scenario Outline: Verify Response of Odometer api for systemadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Odometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify the content length is "125"
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "15.0"
		Then verify nested response "Result ,TotalExamCnt" should be "3"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|

	@adminapi @analyticscontroller @Odometer @Imaginingprovider
	Scenario Outline: Verify Response of Odometer api for Imaginingprovider user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Odometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify the content length is "125"
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "15.0"
		Then verify nested response "Result ,TotalExamCnt" should be "3"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

	@adminapi @analyticscontroller @Odometer @systemapiadmin
	Scenario Outline: Verify Response of Odometer api for systemapiadmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Odometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify the content length is "125"
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "15.0"
		Then verify nested response "Result ,TotalExamCnt" should be "3"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

	@adminapi @analyticscontroller @Odometer @Scheduler
	Scenario Outline: Verify Response of Odometer api for Scheduler user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Odometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify the content length is "125"
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "15.0"
		Then verify nested response "Result ,TotalExamCnt" should be "3"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|

	@adminapi @analyticscontroller @Odometer @OptimizerAdmin
	Scenario Outline: Verify Response of Odometer api for OptimizerAdmin user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Odometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify the content length is "125"
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "15.0"
		Then verify nested response "Result ,TotalExamCnt" should be "3"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|

	@adminapi @analyticscontroller @Odometer @Technologist
	Scenario Outline: Verify Response of Odometer api for Technologist user
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "Odometer" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify the content length is "125"
		Then verify response "Message" should be "Success"
		Then verify nested response "Result ,Total" should be "15.0"
		Then verify nested response "Result ,TotalExamCnt" should be "3"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|