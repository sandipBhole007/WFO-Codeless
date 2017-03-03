*** Settings ***
Library             SSHLibrary
Library             OperatingSystem
Library           	Selenium2Library
Library           	Screenshot
Library             DatabaseLibrary
Resource            resources/automationProperties.robot
**** Variables***


*** Keywords ***

UI Test Teardown
	Run Keyword If Test Failed    	Capture Page Screenshot		${ScreenshotName}
	Close Browser

SSH Test Teardown
	Log 	SSH Test Teardown nothing is implemented yet
	
DB Test Teardown
	Log 	SSH Test Teardown nothing is implemented yet
	
Mobile Test Teardown
	Log 	Mobile Test Teardown nothing is implemented yet

ReST Test Teardown
	Log 	SSH Test Teardown nothing is implemented yet