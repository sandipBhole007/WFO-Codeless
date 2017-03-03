*** Settings ***
Resource          	SSHUtils/serverConnection.robot
Resource        	resources/automationProperties.robot
Resource        	DB/DB_intaraction.robot
**** Variables***

*** Keywords ***

Suite Setup
	Set Automation Global Variables
	serverConnection.SSH Suite Setup Step
	DB_intaraction.DB Suite Setup Step
	
Set Automation Global Variables	
	##############  Automation Variable ###################
	Set Global Variable 	${ScreenshotOutputDirectory}
	Set Global Variable 	${DELAY}
	Set Global Variable		${ScreenshotName}
	Set Global Variable		${LocalLogFolderPath} 
	Set Global Variable		${NCATLogFolderPath}
	Set Global Variable		${linux_server3}
	