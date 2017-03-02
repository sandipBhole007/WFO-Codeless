*** Settings ***
Library             SSHLibrary
Library             OperatingSystem
Library           	Selenium2Library
Library           	Screenshot
Library             DatabaseLibrary
Resource            resources/automationProperties.robot
Resource			MobileApp/LinkedinFlow_Resource.robot
**** Variables***


*** Keywords ***

Feed Test Setup	
	[Documentation]   	This Keyword is to 
	...					${docker_ip} = docker.ip=10.44.170.35
	...					${docker_username}=	docker.username=worker
	...					${docker_password}=	docker.password=f1zzb4ck
	...
	
	Log 	nothing is implemented yet

UI Test Setup 
	Screenshot.Set Screenshot Directory		${ScreenshotOutputDirectory}
	Selenium2Library.Set Selenium Speed     ${DELAY}  
	Log 	UI Test Setup nothing is implemented yet
	
SSH Test Setup
	Log 	UI Test Setup nothing is implemented yet
	
DB Test Setup
	Log 	UI Test Setup nothing is implemented yet
	
ReST Test Setup
	Log 	UI Test Setup nothing is implemented yet
	
Mobile Test Setup
	LinkedinFlow_Resource.Open Mobile Application