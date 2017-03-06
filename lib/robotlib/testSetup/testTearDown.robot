*** Settings ***
Resource            resources/automationProperties.robot
Resource            AngularJS/AngularJS.robot
Resource            UI/NCATHome_Resource.robot
Resource            MobileApp/LinkedinFlow_Resource.robot
**** Variables***


*** Keywords ***

UI Test Teardown
	NCATHome_Resource.UI Failed Step 	

SSH Test Teardown
	Log 	SSH Test Teardown nothing is implemented yet
	
DB Test Teardown
	Log 	SSH Test Teardown nothing is implemented yet
	
Mobile Test Teardown
	LinkedinFlow_Resource.Close Application

ReST Test Teardown
	Log 	SSH Test Teardown nothing is implemented yet
	
AngularJS Test Teardown
	AngularJS.AngularJS Failed Step