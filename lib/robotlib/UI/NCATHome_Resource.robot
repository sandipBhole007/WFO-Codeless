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
Resource          resources/automationProperties.robot
*** Variables ***

*** Keywords ***

UI Set Properties
	Screenshot.Set Screenshot Directory		${ScreenshotOutputDirectory}
	Selenium2Library.Set Selenium Speed     ${DELAY}  
	
UI Failed Step 	
	Run Keyword If Test Failed    	Selenium2Library.Capture Page Screenshot		${ScreenshotName}
	Run Keyword And Continue On Failure		Selenium2Library.Close Browser
Open Browser NCAT Page

	
NCAT Home Variable Values
	Log		 ${Btn_NCAT_FileMenu}
	Log		 ${ShowJobs_Lable}
	Log		 ${selectJobScope_DropDown}
	Log		 ${ClearSuccesses_Link}	
	Log		 ${ClearFailures_Link}
	
	Log		 ${ClearAllInactive_Link}
    
Open NCAT Web HomePage
	 Selenium2Library.Open Browser    ${LOGIN URL}    ${BROWSER}
	 Selenium2Library.Maximize Browser Window
     Selenium2Library.Set Selenium Speed    ${DELAY}
     NCAT Home Variable Values
     
Open NCAT Web HomePage and Login By Valid Admin
	 Selenium2Library.Open Browser    ${LOGIN URL}    ${BROWSER}
	 Selenium2Library.Maximize Browser Window
     Selenium2Library.Set Selenium Speed    ${DELAY}
	 Selenium2Library.Element Should Be Visible		 ${Username_TextBox}
     Selenium2Library.Element Should Be Visible		 ${Password_TextBox}
	
	 Selenium2Library.Input Text			${Username_TextBox}		ncatadmin1
	 Selenium2Library.Input Text			${Password_TextBox}		ncat123
	 Selenium2Library.Capture Page Screenshot		${ScreenshotName}
	 Selenium2Library.Click Element 		${LogIn_Button}
	 Sleep	3s
	 Selenium2Library.Capture Page Screenshot		${ScreenshotName}


Invalid user with invalid password should fail
	[Arguments]    ${InputUserName}   ${InputPassword}    
	 NCATHome_Resource.Open NCAT Web HomePage
	 Selenium2Library.Element Should Be Visible		 ${Username_TextBox}
     Selenium2Library.Element Should Be Visible		 ${Password_TextBox}
	 Selenium2Library.Input Text			${Username_TextBox}		${InputUserName}
	 Selenium2Library.Input Text			${Password_TextBox}		${InputPassword}    
	 Selenium2Library.Capture Page Screenshot		${ScreenshotName}
	 Selenium2Library.Click Element 		${LogIn_Button}
	 Sleep	3s
	 Selenium2Library.Element Should Be Visible		 ${Login_Error}
	 Selenium2Library.Capture Page Screenshot		${ScreenshotName}
	 Selenium2Library.Close Browser
Verify All Element on NCAT Home Page  
	Log		 ${Btn_NCAT_FileMenu}
	Log		 ${ShowJobs_Lable}
	Log		 ${selectJobScope_DropDown}
	Log		 ${ClearSuccesses_Link}	
	Log		 ${ClearFailures_Link}
	
	Log		 ${ClearAllInactive_Link}   
     Selenium2Library.Element Should Be Visible		${Btn_NCAT_FileMenu}
     Selenium2Library.Element Should Be Visible		 ${ShowJobs_Lable}
     Selenium2Library.Element Should Be Visible		 ${selectJobScope_DropDown}
     Selenium2Library.Element Should Be Visible		 ${ClearSuccesses_Link}
     Selenium2Library.Element Should Be Visible		 ${ClearFailures_Link}
     Selenium2Library.Element Should Be Visible		 ${ClearAllInactive_Link}

     Run Keyword And Ignore Error	 Selenium2Library.Element Should Not Be Visible		 ${selectJobScope_DropDown}
     Run Keyword And Ignore Error	 Selenium2Library.Element Should Not Be Visible		 ${ShowJobs_Lable}
     Run Keyword And Ignore Error	 Selenium2Library.Element Should Not Be Visible		 ${ClearAllInactive_Link}

Verify Admin Got Logged in Succssfully
	Run Keyword 	Verify All Element on NCAT Home Page  	

Login Page Should Be Open
    Selenium2Library.Title Should Be    NCAT

Go To Login Page
    Selenium2Library.Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Selenium2Library.Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Selenium2Library.Input Text    password_field    ${password}

Submit Credentials
    Selenium2Library.Click Button    login_button

Welcome Page Should Be Open
    Selenium2Library.Location Should Be    ${WELCOME URL}
    Selenium2Library.Title Should Be    NCAT

Verify All Element on Login Page     
     Selenium2Library.Element Should Be Visible		 ${NCAT_Lable}
     Selenium2Library.Element Should Be Visible		 ${Username_Lable}
     Selenium2Library.Element Should Be Visible		 ${Password_Lable}
     Selenium2Library.Element Should Be Visible		 ${Username_TextBox}
     Selenium2Library.Element Should Be Visible		 ${Password_TextBox}
     Selenium2Library.Element Should Be Visible		 ${LogIn_HelpLink}
     Selenium2Library.Element Should Be Visible		 ${NCAT_Lable1}    
     Selenium2Library.Element Should Be Visible		 ${LogIn_Button}
     Run Keyword And Ignore Error	 Selenium2Library.Element Should Not Be Visible		 ${LogIn_Button}
     Run Keyword And Ignore Error	 Selenium2Library.Element Should Not Be Visible		 ${Password_TextBox}
     Run Keyword And Ignore Error	 Selenium2Library.Element Should Not Be Visible		 ${NCAT_Lable}	
     Selenium2Library.Element Should Not Be Visible	 ${Login_Error}	
     Selenium2Library.Element Should Be Visible		 ${Login_Error}	