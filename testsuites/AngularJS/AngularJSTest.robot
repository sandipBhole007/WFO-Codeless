*** Settings ***
Library				ExtendedSelenium2Library	run_on_failure=ExtendedSelenium2Library.CapturePageScreenshot
Resource          	AngularJS/POM/WFO_POM.txt
Resource            AngularJS/AngularJS.robot
Resource          	resources/automationProperties.robot
Resource          	suiteSetup/suiteSetup.robot
Resource          	suiteSetup/suiteTeardown.robot
Resource          	testSetup/testSetup.robot
Resource          	testSetup/testTearDown.robot
Test Setup			AngularJS Test Setup     
Test Teardown       AngularJS Test Teardown

*** test cases ***
InValid Login
	[Tags]    	AngularJS
	[Setup]		AngularJS Test Setup
	Run Keyword And Ignore Error	 AngularJS.Login to WFO with Given UserName and Password		sandip.bhole@mailinator.com		pASS
	${ActualError}=	ExtendedSelenium2Library.Get Text 	${Login_Error}
	Log		${ActualError}
	Should Be Equal  ${ActualError}  You have entered a wrong email address or password
	[Teardown] 	 testTearDown.AngularJS Test Teardown

	
Valid Login
	[Tags]    	AngularJS
	[Setup]		AngularJS Test Setup
	
	AngularJS.Login to WFO with UserName and Password from PropertyFile
	ExtendedSelenium2Library.Element Should Be Visible		${Logo_NICE_App_IMG}
	ExtendedSelenium2Library.Element Should Be Visible		${Lbl_NICE_EvolveWFO}
	ExtendedSelenium2Library.Element Should Be Visible		${ttl_UserName}	

Follow InValid Login and Expecting Vlaid Login
	[Tags]    	AngularJS
	[Setup]		AngularJS Test Setup
	AngularJS.Login to WFO with Given UserName and Password		sandip.bhole@mailinator123.com		pASS123
	[Teardown] 	 testTearDown.AngularJS Test Teardown
	
	
New Employee Registration
	[Tags]    	AngularJS
	[Setup]		AngularJS Test Setup
	AngularJS.Login to WFO with UserName and Password from PropertyFile
	ExtendedSelenium2Library.Click Element	id=newUser
	sleep	5s	
	ExtendedSelenium2Library.Input Text	id=firstName	1stSpark 
	ExtendedSelenium2Library.Input Text	id=lastName	Athon
	ExtendedSelenium2Library.Input Text	id=emailAddress	sample@gmail5234.com
	ExtendedSelenium2Library.Click Element	id=saveWithPopoverBtn
	#ExtendedSelenium2Library.Input Text	xpath=.//*[@class='ng-untouched ng-valid ng-dirty ng-valid-parse ng-empty']	Spark
	ExtendedSelenium2Library.Click Element	xpath=.//*[@class='btn-link delete-button pull-right']
	ExtendedSelenium2Library.Click Element	id=popup-delete
	sleep	2s
	[Teardown] 	 testTearDown.AngularJS Test Teardown