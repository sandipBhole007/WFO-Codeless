*** Settings ***
Library		ExtendedSelenium2Library

*** test cases ***
InValid Login
	ExtendedSelenium2Library.Open Browser	https://dev.wfosaas.com/login/#/	chrome
	ExtendedSelenium2Library.Input Text	model=user.email		sandip.bhole@mailinator.com	
	ExtendedSelenium2Library.Input Text	model=user.password			Password
	ExtendedSelenium2Library.Click Element	id=loginBtn
	Should Be Equal  ${loginError}  You have entered a wrong email address or password
	Close Browser
	

Valid Login
	ExtendedSelenium2Library.Open Browser	https://dev.wfosaas.com/login/#/	chrome
	ExtendedSelenium2Library.Input Text	model=user.email		sandip.bhole@mailinator.com	
	ExtendedSelenium2Library.Input Text	model=user.password			Password1
	ExtendedSelenium2Library.Click Element	id=loginBtn
	Close Browser
	
New Employee Registration
	ExtendedSelenium2Library.Open Browser	https://dev.wfosaas.com/login/#/	chrome
	ExtendedSelenium2Library.Maximize Browser Window
	ExtendedSelenium2Library.Input Text	model=user.email		sandip.bhole@mailinator.com	
	ExtendedSelenium2Library.Input Text	model=user.password			Password1
	ExtendedSelenium2Library.Click Element	id=loginBtn
	ExtendedSelenium2Library.Click Element	id=newUser
	sleep	5s	
	ExtendedSelenium2Library.Input Text	id=firstName	1stSpark 
	ExtendedSelenium2Library.Input Text	id=lastName	Athon
	ExtendedSelenium2Library.Input Text	id=emailAddress	sample@gmail5.com
	ExtendedSelenium2Library.Click Element	id=saveWithPopoverBtn
	#ExtendedSelenium2Library.Input Text	xpath=.//*[@class='ng-untouched ng-valid ng-dirty ng-valid-parse ng-empty']	Spark
	ExtendedSelenium2Library.Click Element	xpath=.//*[@class='btn-link delete-button pull-right']
	ExtendedSelenium2Library.Click Element	id=popup-delete
	sleep	2s
	Close Browser

	
	