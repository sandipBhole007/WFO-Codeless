*** Settings ***
Library             SSHLibrary
Library             OperatingSystem
Library             Collections
Library             DateTime
Library             Process
Library             String
Library				Screenshot
Library          	Selenium2Library
Library      		DatabaseLibrary
Resource          	SSHUtils/serverConnection.robot
Resource        	resources/automationProperties.robot
**** Variables***

*** Keywords ***

Suite Setup

	Set Automation Global Variables
	SSHLibrary.Set Default Configuration	timeout=20 minute
	serverConnection.Open Server connecions
	
Set Automation Global Variables	
	##############  Automation Variable ###################
	Set Global Variable 	${ScreenshotOutputDirectory}
	Set Global Variable 	${DELAY}
	Set Global Variable		${ScreenshotName}
	Set Global Variable		${LocalLogFolderPath} 
	Set Global Variable		${NCATLogFolderPath}
	Set Global Variable		${linux_server3}
	Screenshot.Set Screenshot Directory		${ScreenshotOutputDirectory}
	Selenium2Library.Set Selenium Speed     ${DELAY}