*** Variables ***

#### Output dirs
${LocalLogFolderPath}  		C:\\NPMGit\\WFO-Codeless\\output\\logs

############logs DIR

${NCATLogFolderPath} 	/NCAT/NCAT/server/apache-tomcat-7.0.57/logs
#########Linux variables
${linux_server1}		172.30.16.131	
${linux_server2}		172.30.16.96
${linux_server3}		172.30.17.15
${USERNAME}			root
${PASSWORD}			Password1!


###### Selenium variables

${SERVER}         172.30.17.15:8280
${BROWSER}        IE
${DELAY}          .1 seconds
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/ncat-ui/
${WELCOME URL}    http://${SERVER}/ncat-ui/
${ERROR URL}      http://${SERVER}/error.html
${ScreenshotOutputDirectory}		C:/NPMGit/WFO-Codeless/output/Screenshot
${ScreenshotName}		${ScreenshotOutputDirectory}${/}selenium-manual-screenshot-{index}.png
${DELAY}		.1