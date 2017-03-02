*** Settings ***
Documentation     A test suite with a single test for SSH connection.
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
Library      		DatabaseLibrary
Suite Setup			Suite Setup     
Suite Teardown      Suite Teardown
Test Setup			SSH Test Setup     
Test Teardown       SSH Test Teardown
*** Test Cases ***


Connect To Servers and Get A Hostname
	[Tags]    SSH
	[Setup]		testSetup.SSH Test Setup   
	serverConnection.Switch and Verify Connection to LinuxServer1
	${LinuxServer1_hostname}=	SSHLibrary.Execute Command	 hostname
	Log  	${LinuxServer1_hostname}
	
	serverConnection.Switch and Verify Connection to LinuxServer2
	${LinuxServer2_hostname}=	SSHLibrary.Execute Command	 hostname
	Log  	${LinuxServer2_hostname}
	[Teardown] 	 testTearDown.SSH Test Teardown


Connect To NCAT Servers and Get Log Files to Local systems and Search for failures
	[Tags]    SSH
	[Setup]		testSetup.SSH Test Setup  
	 serverConnection.Get NCAT Server Log Folder From Server to Local	LinuxServer3	${NCATLogFolderPath}	${LocalLogFolderPath} 
	 ${LogFileName}=	BuiltIn.Catenate	catalina.out	
	 
	 ${NATLocalLogFilePath}= 	BuiltIn.Catenate 	${LocalLogFolderPath}//${LogFileName}
	 serverConnection.Get NCAT Server Log Health	${NATLocalLogFilePath}
	 [Teardown] 	 testTearDown.SSH Test Teardown
Connect To NCAT Servers and delete the file from server
	[Tags]    SSH
	[Setup]		testSetup.SSH Test Setup
	serverConnection.Switch and Verify Connection to Alias 	LinuxServer1
	${RemoteFIleFilePath}= 	BuiltIn.Catenate 	//automationtemp//globalSetting.txt
	SSHLibrary.List Directory		//automationtemp
	SSHLibrary.File Should Exist	${RemoteFIleFilePath}
	serverConnection.Delete File from Remote Server		LinuxServer1	${RemoteFIleFilePath}
	SSHLibrary.File Should Not Exist	${RemoteFIleFilePath}
	[Teardown] 	 testTearDown.SSH Test Teardown
	