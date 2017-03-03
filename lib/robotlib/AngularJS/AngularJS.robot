*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library			  ExtendedSelenium2Library		run_on_failure=ExtendedSelenium2Library.CapturePageScreenshot
Resource          POM/WFO_POM.txt
Resource          resources/automationProperties.robot


*** Keywords ***


AngularJS Failed Step
	Run Keyword If Test Failed    	ExtendedSelenium2Library.Capture Page Screenshot		${ScreenshotName}
	ExtendedSelenium2Library.Close Browser
	
Open Application in Browser
	ExtendedSelenium2Library.Open Browser	${AngularJSURL}		${AngularJS_BROWSER}
	ExtendedSelenium2Library.Element Should Be Visible		${logo_NICELogo}
	ExtendedSelenium2Library.Element Should Be Visible		${btn_LogIn_Button}
	
Login to WFO with UserName and Password from PropertyFile
	[Documentation]    This Keyword  will login to WFO by System username and Password

	ExtendedSelenium2Library.Input Text		${txt_Login_emailID}		${AngularJS_VALID_USER} 		
	ExtendedSelenium2Library.Input Text		${txt_Password}				${AngularJS_VALID_PASSWORD}
	ExtendedSelenium2Library.Click Element	${btn_LogIn_Button}
	ExtendedSelenium2Library.Wait Until Element Is Visible		${Logo_NICE_App_IMG}
	sleep  3s
	ExtendedSelenium2Library.Element Should Be Visible		${Logo_NICE_App_IMG}
	ExtendedSelenium2Library.Element Should Be Visible		${Lbl_NICE_EvolveWFO}
	ExtendedSelenium2Library.Element Should Be Visible		${ttl_UserName}

Login to WFO with Given UserName and Password 
	[Arguments]     ${UserName}		${Password} 	
	[Documentation]    This Keyword  will login to WFO by System username and Password
	...					arg1 ${UserName} =  Username
	...					arg1 ${Password}  = Password
	...	
	
	ExtendedSelenium2Library.Input Text		${txt_Login_emailID}		${AngularJS_VALID_USER} 		
	ExtendedSelenium2Library.Input Text		${txt_Password}				${Password} 
	ExtendedSelenium2Library.Click Element	${btn_LogIn_Button}
	sleep  3s
	ExtendedSelenium2Library.Wait Until Element Is Visible		${Logo_NICE_App_IMG}
	ExtendedSelenium2Library.Element Should Be Visible		${Logo_NICE_App_IMG}
	ExtendedSelenium2Library.Element Should Be Visible		${Lbl_NICE_EvolveWFO}
	ExtendedSelenium2Library.Element Should Be Visible		${ttl_UserName}

	
	
	###################3
	
InValid Login 123
	ExtendedSelenium2Library.Open Browser	https://dev.wfosaas.com/login/#/	chrome
	ExtendedSelenium2Library.Input Text	model=user.email		sandip.bhole@mailinator.com	
	ExtendedSelenium2Library.Input Text	model=user.password			Password
	ExtendedSelenium2Library.Click Element	id=loginBtn
	${loginError}=	Get Text 	css=.error-message.login-error-message.ng-binding
	Log		${loginError}
	Should Be Equal  ${loginError}  You have entered a wrong email address or password
	Close Browser
		
Valid Login123
	ExtendedSelenium2Library.Open Browser	https://dev.wfosaas.com/login/#/	chrome
	ExtendedSelenium2Library.Input Text	model=user.email		sandip.bhole@mailinator.com	
	ExtendedSelenium2Library.Input Text	model=user.password			Password1
	ExtendedSelenium2Library.Click Element	id=loginBtn
	Close Browser
	
New Employee Registration123
	ExtendedSelenium2Library.Open Browser	https://dev.wfosaas.com/login/#/	chrome
	ExtendedSelenium2Library.Maximize Browser Window
	ExtendedSelenium2Library.Input Text	model=user.email		sandip.bhole@mailinator.com	
	ExtendedSelenium2Library.Input Text	model=user.password			Password1
	ExtendedSelenium2Library.Click Element	id=loginBtn
	ExtendedSelenium2Library.Click Element	id=newUser
	sleep	5s	
	ExtendedSelenium2Library.Input Text	id=firstName	1stSpark 
	ExtendedSelenium2Library.Input Text	id=lastName	Athon
	ExtendedSelenium2Library.Input Text	id=emailAddress	sample1234@gmail5.com
	ExtendedSelenium2Library.Click Element	id=saveWithPopoverBtn
	#ExtendedSelenium2Library.Input Text	xpath=.//*[@class='ng-untouched ng-valid ng-dirty ng-valid-parse ng-empty']	Spark
	ExtendedSelenium2Library.Click Element	xpath=.//*[@class='btn-link delete-button pull-right']
	ExtendedSelenium2Library.Click Element	id=popup-delete
	sleep	2s
	Close Browser
	
New Employee Registration34
	ExtendedSelenium2Library.Open Browser	https://dev.wfosaas.com/login/#/	chrome
	ExtendedSelenium2Library.Maximize Browser Window
	ExtendedSelenium2Library.Input Text	model=user.email		sandip.bhole@mailinator.com	
	ExtendedSelenium2Library.Input Text	model=user.password			Password1
	ExtendedSelenium2Library.Click Element	id=loginBtn
	ExtendedSelenium2Library.Click Element	id=newUser
	sleep	5s	
	ExtendedSelenium2Library.Input Text	id=firstName	1stSpark 
	ExtendedSelenium2Library.Input Text	id=lastName	Athon
	ExtendedSelenium2Library.Input Text	id=emailAddress	sample1234@gmail5.com
	ExtendedSelenium2Library.Click Element	id=saveWithPopoverBtn
	#ExtendedSelenium2Library.Input Text	xpath=.//*[@class='ng-untouched ng-valid ng-dirty ng-valid-parse ng-empty']	Spark
	ExtendedSelenium2Library.Click Element	xpath=.//*[@class='btn-link delete-button pull-right']
	ExtendedSelenium2Library.Click Element	id=popup-delete
	sleep	2s
	Close Browser