*** settings ***
Documentation     A test suite with a  test for ReST service automation.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Library  			Collections
Library  			requests
Library				RequestsLibrary
Resource            UI/resource.robot
Resource            UI/NCATHome_Resource.robot
Resource          	suiteSetup/suiteSetup.robot
Resource          	suiteSetup/suiteTeardown.robot
Resource          	testSetup/testSetup.robot
Resource          	testSetup/testTearDown.robot
Test Setup			ReST Test Setup    
Test Teardown       ReST Test Teardown


*** Test Cases ***

Simple ReST Request
	[Tags]    ReST
    ${response} =  requests.get  http://echo.jsontest.com/framework/robot-framework/api/rest
    Should Be Equal  ${response.status_code}  ${200}
    ${json} =  Set Variable  ${response.json()}
    ${framework} =  Get From Dictionary  ${json}  framework
    Should Be Equal  ${framework}  robot-framework
    ${api} =  Get From Dictionary  ${json}  api
    Should Be Equal  ${api}  rest
    
Request JSON 200
	[Tags]    ReST
    ${response} =  requests.get  http://SHIGUPTA-T450:4444/app/api/conversion/toCentigrade/100
    Should Be Equal  ${response.status_code}  ${200}
    ${json} =  Set Variable  ${response.json()}
    ${framework} =  Get From Dictionary  ${json}  fahrenheit
    Should Be Equal  '${framework}'  '100'
    ${api} =  Get From Dictionary  ${json}  centigrade
    Should Be Equal  '${api}'  '37'
    
Request JSON Bad 404  
    [Tags]    ReST
    ${response} =  requests.get  http://SHIGUPTA-T450:4444/app/api/conversion/toCentigrade/shivesh
    log	${response} 
    Should Be Equal  ${response.status_code}  ${404}
    
Request XML Bad 404     
 	[Tags]    ReST
    ${response} =  requests.get  http://SHIGUPTA-T450:4444/app/api/conversion/toFahrenheit/letsCheck
    log	${response} 
    Should Be Equal  ${response.status_code}  ${404}
    
Request XML 200       
	[Tags]    ReST
    ${response} =  requests.get  http://SHIGUPTA-T450:4444/app/api/conversion/toFahrenheit/7
    log	${response} 
    log	${response.text}
    Should Be Equal  ${response.status_code}  ${200}
  
Request XML 200 Failure     
	[Tags]    ReST
    ${response} =  requests.get  http://SHIGUPTA-T450:4444/app/api/conversion/toFahrenheit/7
    log	${response} 
    log	${response.text}
    Should Be Equal  ${response.status_code}  ${404}
      
Post Request Example
    [Tags]    ReST
    RequestsLibrary.Create Session  swagger  http://petstore.swagger.wordnik.com:80/api
    ${data}=  Create Dictionary  id  88  name  gerbil  status  available
    ${headers}=  Create Dictionary  'content-type'  'application/json'
    ${resp}=  RequestsLibrary.Post  swagger  /pet  data=${data}  headers=${headers}
    Dictionary Should Contain Value  ${resp.json()['id']}  88
    Dictionary Should Contain Value  ${resp.json()['name']}  gerbil
    
 Post Request Example Failure
    [Tags]    ReST
    RequestsLibrary.Create Session  swagger  http://petstore.swagger.wordnik.com:80/api
    ${data}=  Create Dictionary  id  88  name  gerbil  status  available
    ${headers}=  Create Dictionary  'content-type'  'application/json'
    ${resp}=  RequestsLibrary.Post  swagger  /pet  data=${data}  headers=${headers}
    Dictionary Should Not Contain Value  ${resp.json()['id']}  88
    Dictionary Should Not Contain Value  ${resp.json()['name']}  gerbil