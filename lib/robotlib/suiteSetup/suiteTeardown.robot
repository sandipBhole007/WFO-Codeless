*** Settings ***
Library             SSHLibrary
Library             DatabaseLibrary
Resource        	resources/automationProperties.robot

**** Variables***
${Docker_feedPath}

*** Keywords ***

Suite Teardown
	Close All Connections
	Disconnect From Database