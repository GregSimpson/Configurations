#!/bin/bash
(set -o igncr) 2>/dev/null && set -o igncr; # comment is needed

SOURCE_BASE_DIR="C:/gjs/git_stuff/portal"
TARGET_CISCO_DIR="C:/Users/eloy98104/OneDrive - TeleTech Holdings, Inc/PortalProject/externalDeliverables/cisco"
TARGET_ESCROW_DIR="C:/Users/eloy98104/OneDrive - TeleTech Holdings, Inc/PortalProject/externalDeliverables/escrow"


# war files
WAR_FILE_LIST="${SOURCE_BASE_DIR}/BackEnd/icAppsWS/target/icAppsWS.war
${SOURCE_BASE_DIR}/BackEnd/TenantPortalServices/target/TenantPortalServices-1.0-SNAPSHOT.war
${SOURCE_BASE_DIR}/FrontEnd/portal/target/portal.war
${SOURCE_BASE_DIR}/FrontEnd/tmt/target/tmt.war"

# source code dirs
SRC_CODE_LIST="${SOURCE_BASE_DIR}/FrontEnd/portal/src
${SOURCE_BASE_DIR}/BackEnd/icAppsWS/src
${SOURCE_BASE_DIR}/BackEnd/TenantPortalServices/src"

display_usage() { 
	SCRIPT_NAME=`basename "$0"`
	echo -e "\nRun this script AFTER you run a maven build on the source."
	echo -e "\tExample Usage:"
	echo -e "\t\t${SCRIPT_NAME}\n"
	exit 1
	} 


LOG_DATE_STAMP=`eval date '+%Y%m%d..%H:%M:%S'`
echo "---------- $LOG_DATE_STAMP ----------" 

cd ${SOURCE_BASE_DIR}/FrontEnd
GIT_BRANCH=`git rev-parse --abbrev-ref HEAD`
if [ $? -eq 0 ]; then
	echo -e "\nCurrent git branch:: ${GIT_BRANCH}"
else
	echo -e "\nFailed to get current git branch"
	echo FAIL
	display_usage
fi

# verify number of params - if needed
## if less than one argument supplied, display usage 
#if [  $# -lt 1 ] 
#then 
	#display_usage
#fi 

# check that war files exist
for WAR_FILE in ${WAR_FILE_LIST}
do
	if [ ! -f "${WAR_FILE}" ];
	then
		echo -e "\n\tsource file  ${WAR_FILE} does not exist"
		echo -e "\t\tMake sure you have successfully built the project before trying to package it\n"
		display_usage
	fi
done

# check that src dirs exist
for SRC_DIR in ${SRC_CODE_LIST}
do
	if [ ! -d "${SRC_DIR}" ];
	then
		echo -e "\n\tsource dir  ${SRC_DIR} does not exist"
		display_usage
	fi
done

###  TARGET_CISCO_DIR exists, continue ?
TARGET_DIRECTORY=${TARGET_CISCO_DIR}/$GIT_BRANCH
if [ -d "$TARGET_DIRECTORY" ]; then
	echo -e "\nDir already EXISTS : ${TARGET_DIRECTORY}"
	read -r -p "Overwrite it? [y/N] " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		echo -e "\n\toverwriting ${TARGET_DIRECTORY}\n\t\twith ${WAR_FILE}\n"
	else
    		display_usage
	fi
fi

###  TARGET_ESCROW_DIR exists, continue ?
TARGET_DIRECTORY=${TARGET_ESCROW_DIR}/$GIT_BRANCH
if [ -d "$TARGET_DIRECTORY" ]; then
	echo -e "\nDir already EXISTS : ${TARGET_DIRECTORY}"
	read -r -p "Overwrite it? [y/N] " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		echo -e "\n\toverwriting ${TARGET_DIRECTORY}\n\t\twith ${WAR_FILE}\n"
	else
    		display_usage
	fi
fi

###  All good to go
###  create the TARGET dir if needed
mkdir -p "${TARGET_CISCO_DIR}/${GIT_BRANCH}"
mkdir -p "${TARGET_ESCROW_DIR}/${GIT_BRANCH}"

##   copy the .war files
for WAR_FILE in ${WAR_FILE_LIST}
do
	echo -e "\tcopying ${WAR_FILE}\n\t\tto ${TARGET_CISCO_DIR}/${GIT_BRANCH}"
	cp ${WAR_FILE} "${TARGET_CISCO_DIR}/${GIT_BRANCH}" &
done

echo -e "\n"
##  jar the source dirs
for SRC_CODE_DIR in ${SRC_CODE_LIST}
do
	parent=$(echo $SRC_CODE_DIR | sed -e 's;\/[^/]*$;;') # cut away '/src'
	JAR_FILE_NAME=${TARGET_ESCROW_DIR}/${GIT_BRANCH}/`basename $parent`_src.jar # --> you get the relevant dir base name
	#echo ${JAR_FILE_NAME}
	echo -e "\tjarring ${SRC_CODE_DIR}\n\t\tto ${JAR_FILE_NAME}"

	#not sure why I had to do this, but just jarring the SRC_CODE_DIR did not work
	### jar cvf "${JAR_FILE_NAME}" "${SRC_CODE_DIR}"
	cd "${SRC_CODE_DIR}/.."
	jar cvf "${JAR_FILE_NAME}" ./src
done

echo -e "\n"
exit 0

