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
*** Test Cases ***


Open NCAT Page and follow Validation
	Given resource.Open Browser NCAT Page
	Then resource.Verify All Element on Login Page 
	[Teardown]    Close Browser
	
Verify Admin Login TO NCAT
	Given NCATHome_Resource.Open NCAT Web HomePage and Login By Valid Admin
	Then NCATHome_Resource.Verify All Element on NCAT Home Page  
	[Teardown]    Close Browser