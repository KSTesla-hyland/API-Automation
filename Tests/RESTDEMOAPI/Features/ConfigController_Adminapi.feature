Feature: This feature is to verify API status of Config controller of admin api

  @adminapi @ConfigController @validusers @ConfigViewJson
	Scenario Outline: Verify Response schema and status code of viewing config for json format for all users
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "ConfigControllerViewWithJson" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|

  @adminapi @ConfigController @validusers @ConfigView
	Scenario Outline: Verify Response schema and status code of viewing config for all users
		Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
		Given User hits get api for "ConfigControllerView" of apiadmin
		Then verify status should be "200"
		Then verify response schema is valid
		Then verify response "Message" should be "Success"
        Then verify nested response "Result ,ApplicationTitle" should be "Admin"
        Then verify response for inner nested key "AdminApi" should be "https://adminapi.nilnexus.com"
        Then verify response for inner nested key "AdminFront" should be "https://admin.nilnexus.com"
        Then verify response for inner nested key "Analytics" should be "https://analytics.nilnexus.com"
        Then verify response for inner nested key "ChatFront" should be "https://webchat.nilnexus.com"
        Then verify response for inner nested key "Notificator" should be "wss://notificator.nilnexus.com"
        Then verify response for inner nested key "UWLApi" should be "https://api.nilnexus.com"
        Then verify response for inner nested key "UWLFront" should be "https://app.nilnexus.com/"
		Then verify the response time
		Examples:
			| appname | app_name | user_name | username | password | encodedPassword |
			|app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
            |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|
            |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
            |app_name|Admin|username|user1|encodedPassword|VGVzdEAxMjM=|