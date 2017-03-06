*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library		run_on_failure=Selenium2Library.CapturePageScreenshot
Library           Screenshot
Resource          POM/NCAT_Home.txt
Resource          POM/login_POM.txt
*** Variables ***

*** Keywords ***
Open Browser NCAT Page
	Variable Values
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    #Login Page Should Be Open
	Variable Values
	
Variable Values
	Log		 ${NCAT_Lable}
	Log		 ${Username_Lable}
	Log		 ${Password_Lable}
	Log		 ${Username_TextBox}	
	Log		 ${Password_TextBox}
	
	Log		 ${LogIn_HelpLink}
	Log		 ${NCAT_Lable1}
	Log		 ${LogIn_Button}
	Log		 ${Login_Error}
Open Browser NPM Page 
	[Arguments]    ${ServerURL}
    Open Browser    ${ServerURL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open
    
Open NCAT Web HomePage
	Open Browser    ${LOGIN URL}    ${BROWSER}
	 Maximize Browser Window
     Set Selenium Speed    ${DELAY}
     Variable Values
     
Open NCAT Web HomePage and Login By Valid Admin
	Open Browser    ${LOGIN URL}    ${BROWSER}
	 Maximize Browser Window
     Set Selenium Speed    ${DELAY}
	 Element Should Be Visible		 ${Username_TextBox}
     Element Should Be Visible		 ${Password_TextBox}
	
	 Input Text			${Username_TextBox}		ncatadmin1
	 Input Text			${Password_TextBox}		ncat123
	 Selenium2Library.Capture Page Screenshot		${ScreenshotName}
	 Click Element 		${LogIn_Button}
	 Sleep	3s
	 Selenium2Library.Capture Page Screenshot		${ScreenshotName}
	 
Verify All Element on Login Page     
     Element Should Be Visible		 ${NCAT_Lable}
     Element Should Be Visible		 ${Username_Lable}
     Element Should Be Visible		 ${Password_Lable}
     Element Should Be Visible		 ${Username_TextBox}
     Element Should Be Visible		 ${Password_TextBox}
     Element Should Be Visible		 ${LogIn_HelpLink}
     Element Should Be Visible		 ${NCAT_Lable1}    
     Element Should Be Visible		 ${LogIn_Button}
     Run Keyword And Ignore Error	 Element Should Not Be Visible		 ${LogIn_Button}
     Run Keyword And Ignore Error	 Element Should Not Be Visible		 ${Password_TextBox}
     Run Keyword And Ignore Error	 Element Should Not Be Visible		 ${NCAT_Lable}	
     Element Should Not Be Visible	 ${Login_Error}	
     Element Should Be Visible		 ${Login_Error}	
 
Verify Admin Got Logged in Succssfully
    
Login Page Should Be Open
    Title Should Be    NCAT

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    NCAT
