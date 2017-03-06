*** Variables ***

#### Output dirs
${LocalLogFolderPath}  		C:\\WFO-Codeless\\output\\logs

############logs DIR

${NCATLogFolderPath} 	/NCAT/NCAT/server/apache-tomcat-7.0.57/logs

#########Linux variables
${linux_server1}		172.30.16.131	
${linux_server2}		172.30.16.96
${linux_server3}		172.30.17.15
${LinuxUSERNAME}			root
${LinuxPASSWORD}			Password1!


###### Selenium variables

${SERVER}         172.30.17.15:8280
${BROWSER}        chrome
${DELAY}          .1 seconds
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/ncat-ui/
${WELCOME URL}    http://${SERVER}/ncat-ui/
${ERROR URL}      http://${SERVER}/error.html
${ScreenshotOutputDirectory}		C:/WFO-Codeless/output/Screenshot
${ScreenshotName}		${ScreenshotOutputDirectory}${/}selenium-manual-screenshot-{index}.png
${DELAY}		.1


########AngularJS Variables ################

${AngularJSURL} 	https://dev.wfosaas.com/login/#/
${AngularJS_BROWSER}        chrome	
${AngularJS_DELAY}        1	
${AngularJS_VALID_USER}     sandip.bhole@mailinator.com
${AngularJS_VALID_PASSWORD}    Password1

###### mysql DB variables
${DBName}		phs_edb
${DBUser}		root
${DBPass}		password
${DBHost}		1.224.0.62
${DBPort} 		3306
${EMP_DataSql}		C:\\WFO-Codeless\\testdata\\DB\\my_db_test_insertData.sql
=======
########Mobile Variables ################

${mserverURL}	http://127.0.0.1:4723/wd/hub
${platformName}	Android
${platformVersion}	4.4.4
${deviceName}	emulator-5554
${appPackage}	com.linkedin.android
${appActivity}	com.linkedin.android.growth.login.LoginActivity
${muserName}	ravivani10@gmail.com
${mpassword}	linkedindemo
${mInvalidPassword} 	1234567

