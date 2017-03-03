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
Library       		OperatingSystem
Suite Setup			Suite Setup     
Suite Teardown      Suite Teardown
Test Setup			DB Test Setup   
Test Teardown       DB Test Teardown
*** Test Cases ***


Connect To DB Servers and Create Employee Table
	[Tags]    DB
	[Setup]		DB Test Setup
 	${output} =    Execute SQL String    CREATE TABLE Employee (id integer unique,first_name varchar(20),last_name varchar(20));
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
	[Teardown] 	 testTearDown.DB Test Teardown


    
Execute SQL Script - Insert Data Employee table
    [Tags]    DB    DB_SMOKE
    Log		${EMP_DataSql}
    OperatingSystem.File Should Exist		${EMP_DataSql}
    ${output} =    Execute SQL Script 	${EMP_DataSql}
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
    
Table Must Exist - Employee
    [Tags]    DB    DB_SMOKE
    Table Must Exist    Employee
    
    
Table Must Exist - Employee1
    [Tags]    DB    DB_SMOKE
    Table Must Exist    Employee1
    
Check If Exists In DB - Franz Allan
    [Tags]     DB    DB_SMOKE
    Check If Exists In Database    SELECT id FROM Employee WHERE first_name = 'Franz Allan';
    
    
Retrieve Row Count
    [Tags]    DB    DB_SMOKE
    ${output} =    Row Count    SELECT id FROM Employee;
    Log    ${output}
    Should Be Equal As Strings    ${output}    2
    
    
Add Employee in first transaction
    [Tags]    DB    DB_SMOKE
    ${output} =    Execute SQL String    INSERT INTO Employee VALUES(101,'Bilbo','Baggins');
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
    
 Connect To DB Servers and Drop Employee Table
	[Tags]    DB
	[Setup]		DB Test Setup
 	${output} =    Execute SQL String    DROP TABLE Employee ;
    Log    ${output}
    Should Be Equal As Strings    ${output}    None
	[Teardown] 	 testTearDown.DB Test Teardown