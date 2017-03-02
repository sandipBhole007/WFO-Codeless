*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library           Screenshot
Resource          POM/NCAT_Home.txt
Resource          POM/login_POM.txt
Resource          resources/automationProperties.robot
*** Variables ***

*** Keywords ***

Set Properties
	
Open Browser NCAT Page

	
NCAT Home Variable Values
	Log		 ${Btn_NCAT_FileMenu}
	Log		 ${ShowJobs_Lable}
	Log		 ${selectJobScope_DropDown}
	Log		 ${ClearSuccesses_Link}	
	Log		 ${ClearFailures_Link}
	
	Log		 ${ClearAllInactive_Link}
    
Open NCAT Web HomePage
	 Open Browser    ${LOGIN URL}    ${BROWSER}
	 Maximize Browser Window
     Set Selenium Speed    ${DELAY}
     NCAT Home Variable Values
     
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
	 
Verify All Element on NCAT Home Page  
	Log		 ${Btn_NCAT_FileMenu}
	Log		 ${ShowJobs_Lable}
	Log		 ${selectJobScope_DropDown}
	Log		 ${ClearSuccesses_Link}	
	Log		 ${ClearFailures_Link}
	
	Log		 ${ClearAllInactive_Link}   
     Element Should Be Visible		${Btn_NCAT_FileMenu}
     Element Should Be Visible		 ${ShowJobs_Lable}
     Element Should Be Visible		 ${selectJobScope_DropDown}
     Element Should Be Visible		 ${ClearSuccesses_Link}
     Element Should Be Visible		 ${ClearFailures_Link}
     Element Should Be Visible		 ${ClearAllInactive_Link}

     Run Keyword And Ignore Error	 Element Should Not Be Visible		 ${selectJobScope_DropDown}
     Run Keyword And Ignore Error	 Element Should Not Be Visible		 ${ShowJobs_Lable}
     Run Keyword And Ignore Error	 Element Should Not Be Visible		 ${ClearAllInactive_Link}

Verify Admin Got Logged in Succssfully
	Run Keyword 	Verify All Element on NCAT Home Page  	

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