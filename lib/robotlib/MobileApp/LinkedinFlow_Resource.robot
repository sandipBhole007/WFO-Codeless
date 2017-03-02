***Settings***
Library		AppiumLibrary
Resource    resources/automationProperties.robot
Resource    POM/MobileApp.txt
***Variables***


***Keywords***

Open Mobile Application
	Open Application	http://127.0.0.1:4723/wd/hub	platformName=Android	platformVersion=4.4.4	deviceName=emulator-5554	appPackage=com.linkedin.android		appActivity=com.linkedin.android.growth.login.LoginActivity

Open Linkedin Login Page
	sleep	 40s
	AppiumLibrary.Click Element	${LinkSignIn}

Login TO App
	[Arguments]		${userName}		${password}
	sleep 	20s
	AppiumLibrary.Input Text		${InputUserName}		${userName}
	AppiumLibrary.Input Text		${InputPassword}		${password}
	AppiumLibrary.Click Element	${ButtonSignIN}
	
Select NICE From Recent Search History
	AppiumLibrary.Click Element		${InputSearchBar}
	sleep	20s	
	AppiumLibrary.Click Element		${ImgNICELtd}
	sleep	40s

Verfiy Page Contains Text
	[Arguments]		${text}
	AppiumLibrary.Page Should Contain Text	${text}