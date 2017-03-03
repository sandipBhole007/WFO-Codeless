*** Settings ***
Library             SSHLibrary
Library             OperatingSystem
Library             Collections
Library             DateTime
Library             Process
Library             String
Library				Screenshot
#Library          	Selenium2Library	run_on_failure=AppiumLibrary.CapturePageScreenshot
Library      		DatabaseLibrary
Resource          	SSHUtils/serverConnection.robot
Resource        	resources/automationProperties.robot
Resource        	DB/DB_intaraction.robot
**** Variables***

*** Keywords ***

Suite Setup
	Run Keyword And Ignore Error	Disconnect From Database
	Set Automation Global Variables
	SSHLibrary.Set Default Configuration	timeout=20 minute
	serverConnection.Open Server connecions
	DB_intaraction.Open Connection To MYSQL PHS_EDB Database
	
Set Automation Global Variables	
	##############  Automation Variable ###################
	Set Global Variable 	${ScreenshotOutputDirectory}
	Set Global Variable 	${DELAY}
	Set Global Variable		${ScreenshotName}
	Set Global Variable		${LocalLogFolderPath} 
	Set Global Variable		${NCATLogFolderPath}
	Set Global Variable		${linux_server3}
	