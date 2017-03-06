*** Settings ***
Resource            resources/automationProperties.robot
Resource			MobileApp/LinkedinFlow_Resource.robot
Resource            AngularJS/AngularJS.robot
Resource            UI/NCATHome_Resource.robot
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
	Set Library Search Order	Selenium2Library	ExtendedSelenium2Library		
	NCATHome_Resource.UI Set Properties
	Log 	UI Test Setup nothing is implemented yet
	
SSH Test Setup
	Log 	UI Test Setup nothing is implemented yet
	
DB Test Setup
	Log 	UI Test Setup nothing is implemented yet
	
ReST Test Setup
	Log 	UI Test Setup nothing is implemented yet
	
Mobile Test Setup
	Set Library Search Order	AppiumLibrary	Selenium2Library	ExtendedSelenium2Library
	LinkedinFlow_Resource.Open Mobile Application

AngularJS Test Setup
	Set Library Search Order	ExtendedSelenium2Library	Selenium2Library	
	AngularJS.Open Application in Browser