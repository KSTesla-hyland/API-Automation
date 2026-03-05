Feature: This feature is to verify the forget action on saved bookmarks in NilRead 25

  @nilread @BookmarkController @validusers @bookmarkforget
  Scenario Outline: Verify that the forget POST call returns a successful response for valid users
    Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
    Given User hits nilread post api for "BookmarkForget" using "TestData/POST_Data/ForgetBookmark.json" data
    Then verify status should be "200"
    Then verify response "Message" should be "Success"
    Then verify the response time
    Examples:
      | appname  | app_name | user_name | username      | password        | encodedPassword      |
      |app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
      |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @nilread @BookmarkController @validusers @bookmarkforgetverify
  Scenario Outline: Verify that bookmarks are actually deleted after the forget action in NilRead 25
    Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
    Given User hits nilread post api for "BookmarkForget" using "TestData/POST_Data/ForgetBookmark.json" data
    Then verify status should be "200"
    Then verify response "Message" should be "Success"
    Given User hits nilread get api for "BookmarkView"
    Then verify status should be "200"
    Then verify that forgotten study is absent from bookmark list
    Then verify the response time
    Examples:
      | appname  | app_name | user_name | username      | password        | encodedPassword      |
      |app_name|Admin|username|systemadmin|encodedPassword|SHkxQGFuZE5O|
      |app_name|Admin|username|systemapiadmin|encodedPassword|U0t5WDB5Xngjcjh6YVEz|

  @nilread @BookmarkController @otherusers @bookmarkforget
  Scenario Outline: Verify that the forget POST call returns 403 for users without bookmark permission
    Given user with "<appname>" as "<app_name>", "<user_name>" as "<username>","<password>" as "<encodedPassword>"
    Given User hits nilread post api for "BookmarkForget" using "TestData/POST_Data/ForgetBookmark.json" data
    Then verify status should be "403"
    Then verify the response time
    Examples:
      | appname  | app_name | user_name | username | password        | encodedPassword |
      |app_name|Admin|username|Techno|encodedPassword|VGVzdEAxMjM=|
      |app_name|Admin|username|OA|encodedPassword|VGVzdEAxMjM=|
      |app_name|Admin|username|SC|encodedPassword|VGVzdEAxMjM=|
