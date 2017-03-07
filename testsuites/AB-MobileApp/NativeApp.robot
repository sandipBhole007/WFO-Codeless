***Settings***
Library				AppiumLibrary	run_on_failure=AppiumLibrary.CapturePageScreenshot
Resource			MobileApp/LinkedinFlow_Resource.robot
Resource    		resources/automationProperties.robot
Resource          	suiteSetup/suiteSetup.robot
Resource          	suiteSetup/suiteTeardown.robot
Resource          	testSetup/testSetup.robot
Resource          	testSetup/testTearDown.robot
Test Setup			Mobile Test Setup   
Test Teardown       Mobile Test Teardown
***Variables***

***TestCases***
Invalid Login in Linkedin App 
	[Tags] 	Mobile
	[Setup] 	Mobile Test Setup
	Open Linkedin Login Page
	Login TO App 	${muserName} 	${mInvalidPassword}
	Verfiy Page Contains Text 	Bad username/password
	[Teardown]  testTearDown.Mobile Test Teardown
	
Search NICE Ltd in Linkedin App 
	[Tags] 		Mobile
	[Setup] 	Mobile Test Setup
	Open Linkedin Login Page
	Login TO App	${muserName}		${mpassword}
	Select NICE From Recent Search History
	Verfiy Page Contains Text		NICE Ltd
	[Teardown] 	testTearDown.Mobile Test Teardown
	