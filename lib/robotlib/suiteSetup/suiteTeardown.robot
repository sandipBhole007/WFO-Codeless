*** Settings ***
Library             SSHLibrary
Library             OperatingSystem
Library             DatabaseLibrary
Resource        	resources/automationProperties.robot

**** Variables***
${Docker_feedPath}

*** Keywords ***

Suite Teardown
	Close All Connections
	Disconnect From Database