*** Settings ***
Documentation     A test suite with a single test for DB connection.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          	SSHUtils/serverConnection.robot
Resource          	suiteSetup/suiteSetup.robot
Resource          	suiteSetup/suiteTeardown.robot
Resource          	testSetup/testSetup.robot
Resource          	testSetup/testTearDown.robot
Resource            resources/automationProperties.robot
Library      		SSHLibrary
Library           	DatabaseLibrary
Library           	OperatingSystem
* Variables


 	
*** Keywords ***
DB Suite Setup Step
	Run Keyword And Ignore Error	Disconnect From Database
	Open Connection To MYSQL PHS_EDB Database
	
	
Open Connection To MYSQL PHS_EDB Database
	Log		 	${DBName}
	Log		 	${DBUser}
	Log		 	${DBPass}
	Log		 	${DBHost}
	Log		 	${DBPort} 
	Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}  
	