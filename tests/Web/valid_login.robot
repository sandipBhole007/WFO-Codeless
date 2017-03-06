*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource            UI/resource.robot
Resource            UI/NCATHome_Resource.robot
Resource          	suiteSetup/suiteSetup.robot
Resource          	suiteSetup/suiteTeardown.robot
Resource          	testSetup/testSetup.robot
Resource          	testSetup/testTearDown.robot
Suite Setup			Suite Setup     
Suite Teardown      Suite Teardown
Test Setup			UI Test Setup     
Test Teardown       UI Test Teardown
*** Test Cases ***


Open NCAT Page and follow Validation
	[Tags]    UI
	Given NCATHome_Resource.Open NCAT Web HomePage
	Then NCATHome_Resource.Verify All Element on Login Page  
	[Teardown]	testTearDown.UI Test Teardown
	

Login TO NCAT and Verify Login Succssful
	[Tags]    UI	
	Given NCATHome_Resource.Open NCAT Web HomePage and Login By Valid Admin 
	Then NCATHome_Resource.Verify Admin Got Logged in Succssfully 
	[Teardown]    testTearDown.UI Test Teardown
	
	
Invalid password
	[Tags]    UI
    [Template]    Invalid user with invalid password should fail
    abCD5            abCD5
    abCD567890123    abCD567890123
    123DEFG          123DEFG
    abcd56789        abcd56789
    AbCdEfGh         AbCdEfGh
    abCD56+          abCD56+
    [Teardown]    testTearDown.UI Test Teardown