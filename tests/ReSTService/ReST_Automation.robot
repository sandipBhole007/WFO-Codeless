*** settings ***
Documentation     A test suite with a  test for ReST service automation.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Library  		Collections
Library  		requests
Library			RequestsLibrary
Resource            UI/resource.robot
Resource            UI/NCATHome_Resource.robot
Resource          	suiteSetup/suiteSetup.robot
Resource          	suiteSetup/suiteTeardown.robot
Resource          	testSetup/testSetup.robot
Resource          	testSetup/testTearDown.robot
Suite Setup			Suite Setup     
Suite Teardown      Suite Teardown
Test Setup			UI Test Setup     
Test Teardown       UI Test Teardown
*** test cases ***
Simple ReST Request
	[ReST API]
    ${response} =  requests.get  http://echo.jsontest.com/framework/robot-framework/api/rest
    Should Be Equal  ${response.status_code}  200
    ${json} =  Set Variable  ${response.json()}
    ${framework} =  Get From Dictionary  ${json}  framework
    Should Be Equal  ${framework}  robot-framework
    ${api} =  Get From Dictionary  ${json}  api
    Should Be Equal  ${api}  rest
    
requestJson200
	[ReST API]
    ${response} =  requests.get  http://localhost:4444/app/api/conversion/toCentigrade/100
    Should Be Equal  ${response.status_code}  ${200}
    ${json} =  Set Variable  ${response.json()}
    ${framework} =  Get From Dictionary  ${json}  fahrenheit
    Should Be Equal  '${framework}'  '100'
    ${api} =  Get From Dictionary  ${json}  centigrade
    Should Be Equal  '${api}'  '37'
    
    
 requestJsonBad404
    [ReST API]
    ${response} =  requests.get  http://localhost:4444/app/api/conversion/toCentigrade/shivesh
    log	${response} 
    Should Be Equal  ${response.status_code}  ${404}
    
    
requestJsonBad404
	[ReST API]
    ${response} =  requests.get  http://localhost:4444/app/api/conversion/toCentigrade/
    log	${response} 
    Should Be Equal  ${response.status_code}  ${404}    

    
 requestXMLBad404
 	[ReST API]
    ${response} =  requests.get  http://localhost:4444/app/api/conversion/toFahrenheit/letsCheck
    log	${response} 
    Should Be Equal  ${response.status_code}  ${404}
    
    
requestXML200
	[ReST API]
    ${response} =  requests.get  http://localhost:4444/app/api/conversion/toFahrenheit/7
    log	${response} 
    log	${response.text}
    Should Be Equal  ${response.status_code}  ${200}
    
Post Requestss
    [ReST API]
    RequestsLibrary.Create Session  swagger  http://petstore.swagger.wordnik.com:80/api
    ${data}=  Create Dictionary  id  88  name  gerbil  status  available
    ${headers}=  Create Dictionary  'content-type'  'application/json'
    ${resp}=  RequestsLibrary.Post  swagger  /pet  data=${data}  headers=${headers}
    Dictionary Should Contain Value  ${resp.json()['id']}  88
    Dictionary Should Contain Value  ${resp.json()['name']}  gerbil