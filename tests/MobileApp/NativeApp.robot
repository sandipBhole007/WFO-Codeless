***Settings***
Library				AppiumLibrary
Resource			MobileApp/LinkedinFlow_Resource.robot
Resource    		resources/automationProperties.robot
Resource          	suiteSetup/suiteSetup.robot
Resource          	suiteSetup/suiteTeardown.robot
Resource          	testSetup/testSetup.robot
Resource          	testSetup/testTearDown.robot
Suite Setup			Suite Setup     
Suite Teardown      Suite Teardown
Test Setup			Mobile Test Setup   
Test Teardown       Mobile Test Teardown
***Variables***

***TestCases***
Search NICE Ltd in Linkedin App 
	[Tags] 		Mobile
	[Setup] 	Mobile Test Setup
	Open Linkedin Login Page
	Login TO App	${muserName}		${mpassword}
	Select NICE From Recent Search History
	Verfiy Page Contains Text		NICE Ltd