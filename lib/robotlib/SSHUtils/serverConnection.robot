*** Settings ***
Documentation     This is a Server connection file uses to create a connection with any linux system. 
Library       	OperatingSystem
Library       	DateTime
Library       	BuiltIn
Library      	SSHLibrary
Resource        resources/automationProperties.robot
Resource        SSHUtils/serverConnection.robot
* Variables


 	
*** Keywords ***

Open Server connecions
	Open Connection to LinuxServer1 And Log In
	Open Connection to LinuxServer2 And Log In
	Open Connection to LinuxServer3 And Log In
	Switch and Verify Connection to LinuxServer1
	Switch and Verify Connection to LinuxServer2
	Switch and Verify Connection to LinuxServer3 
	  	
Open SSH Connection to server And Log In
 	[Arguments]    ${HOST}		${USERNAME}		${PASSWORD}		${Alias}
 	[Documentation]   This Keyword open a connection to any linux server by argument
	...					arg1 = ${HOST}  Server IP or Name
	...					arg2 = ${USERNAME} Server username 
	...					arg3 = ${PASSWORD} Server password
	...					arg4 = ${Alias}	connection alisa which can be used for switch connection
	
 	Open Connection   ${HOST}		alias=${Alias}
   	Login   ${USERNAME}    ${PASSWORD}
   	
   	
 
Open Connection to LinuxServer1 And Log In
	[Documentation]   This Keyword open a connection to a LinuxServer1
	
	...
	
	Log 	${linux_server1}	  # 
	Log 	${USERNAME}	  # 
	Log 	${PASSWORD}	  #  
	Open Connection	 ${linux_server1}		alias=LinuxServer1
	Login    ${USERNAME}    ${PASSWORD}
   	

Open Connection to LinuxServer2 And Log In
	[Documentation]   This Keyword open a connection to a LinuxServer2  system 
	Log 	${linux_server2}	  #  
	Open Connection	 ${linux_server2}		alias=LinuxServer2
	Login    ${USERNAME}    ${PASSWORD}
   	

Open Connection to LinuxServer3 And Log In
	[Documentation]   This Keyword open a connection to a LinuxServer2  system 
	Log 	${linux_server3}	  #  
	Open Connection	 ${linux_server3}		alias=LinuxServer3
	Login    ${USERNAME}    ${PASSWORD}

   
Switch and Verify Connection to LinuxServer1  
   	
   	Switch Connection 	LinuxServer1
	${LinuxServer1}=	Get Connection	
	Should Be Equal	${LinuxServer1.alias}	LinuxServer1	.
	${LinuxServer1_hostname}=	SSHLibrary.Execute Command	 hostname
	Log  	${LinuxServer1_hostname}

Switch and Verify Connection to LinuxServer2  
   	Switch Connection 	LinuxServer2
	${LinuxServer2}=	Get Connection	
	Should Be Equal	${LinuxServer2.alias}	LinuxServer2	.
	${LinuxServer2_hostname}=	SSHLibrary.Execute Command	 hostname
	Log  	${LinuxServer2_hostname}


Switch and Verify Connection to LinuxServer3  
   	Switch Connection 	LinuxServer3
	${LinuxServer3}=	Get Connection	
	Should Be Equal	${LinuxServer3.alias}	LinuxServer3	.
	${LinuxServer3_hostname}=	SSHLibrary.Execute Command	 hostname
	Log  	${LinuxServer3_hostname}
	
Switch and Verify Connection to Alias  
   	[Arguments]     ${ServerAlias}
   	Switch Connection 	${ServerAlias}
	${LinuxServer}=	Get Connection	
	Should Be Equal	${LinuxServer.alias}	${ServerAlias}	.
	${LinuxServer_hostname}=	SSHLibrary.Execute Command	 hostname
	Log  	${LinuxServer_hostname}
#####################

Copy File to LinuxServer1
	[Arguments]     ${LocalFilePath}		${RemoteFilePath} 	
	[Documentation]    This Keyword  will copy the  file from local system to remote system
	...					arg1 ${LocalFilePath} = ${LocalFilePath} 	Feed file Path
	...					arg1 ${RemoteFilePath}  = ${RemoteFilePath} 	remote file Path
	...	
	
	Switch and Verify Connection to LinuxServer1
	
	OperatingSystem.File Should Exist	 ${LocalFilePath}		msg= File is not present at local  location before  file.
    
    Run Keyword		SSHLibrary.Put File		${LocalFilePath}	${RemoteFilePath}		mode=0555
    
    ${IsFilePresnetOnRemote}=	Run Keyword And Return Status 	SSHLibrary.File Should Not Exist	${RemoteFilePath}    ##verify if file is Not Present @ remote location
    
    Run Keyword If  '${IsFilePresnetOnRemote}' == 'True'   Log  File is copied to remote Successfully.
    
    Run Keyword If  '${IsFilePresnetOnArke}' == 'False'   Fail  msg= File is not present at remote  location.
 
Delete File from Remote Server
	[Arguments]     ${ServerAlias}		${RemoteFilePath} 
 	[Documentation]    This Keyword  will Delete the  file from  remote system
	...					arg1 ${ServerAlias} = Server alias
	...					arg2 ${RemoteFilePath} =  remote file path
	
	Switch and Verify Connection to Alias 	${ServerAlias}
	${commandToDelete}=	BuiltIn.Catenate  	 rm -rf  ${RemoteFilePath}	
	${Deletefile}=	  Run Keyword		SSHLibrary. Execute Command	 ${commandToDelete} 	return_stderr=True	return_rc=True  return_stdout=False
 
 
 Get NCAT Server Log Folder From Server to Local
 	[Arguments]     ${ServerAlias}		${RemoteLogFolderPath}		${LocalLogFolderPath}
 	[Documentation]    This Keyword  will get NCAT Install log from  remote system to local system
 	...					arg1 ${ServerAlias} = Server alias to connect to server
	...					arg2 ${LogFilePath} =  remote file path to pull to local
	...					REMOTE FOLDER /NCAT/NCAT/server/apache-tomcat-7.0.57/logs
	Switch and Verify Connection to Alias 	${ServerAlias}
	
	 Run Keyword	 SSHLibrary.Get Directory	${RemoteLogFolderPath}/		${LocalLogFolderPath}/.	 

Get NCAT Server Log Health 
	[Arguments]    	${LocalLogFilePath}
	 ################  sample read ###############
		OperatingSystem.File Should Exist		${LocalLogFilePath}
	
		${All_errors} =	Grep File	${LocalLogFilePath}	ERROR
		Log 	${All_errors}
		
		${All_info} =	Grep File	${LocalLogFilePath}	INFO
		Log 	${All_info}
		
		${All_Exceptions} =	Grep File	${LocalLogFilePath}	Exception
		Log 	${All_Exceptions}
		
		${all_Contents}=	OperatingSystem.Get File	${LocalLogFilePath}
	