*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource            UI/resource.robot
Resource            UI/NCATHome_Resource.robot
Resource          	suiteSetup/suiteSetup.robot
Resource          	suiteSetup/suiteTeardown.robot
Resource          	testSetup/testSetup.robot
Resource          	testSetup/testTearDown.robot

*** Test Cases ***
    
Valid Login2
    Given Open Browser NPM Page  http://172.30.16.219:63080/web/guest
    Then Welcome Page Should Be Open
    [Teardown]    Close Browser
Valid Login
    Given Open Browser NCAT Page
    Then Welcome Page Should Be Open
   # [Teardown]    Close Browser
    