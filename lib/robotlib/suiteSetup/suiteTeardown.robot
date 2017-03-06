*** Settings ***
Library             SSHLibrary
Library             DatabaseLibrary
Resource        	resources/automationProperties.robot

**** Variables***
${Docker_feedPath}

*** Keywords ***

Suite Teardown
	Run Keyword And Ignore Error 	Close All Connections
	Run Keyword And Ignore Error 	Disconnect From Database
