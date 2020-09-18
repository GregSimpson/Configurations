#!/bin/bash
(set -o igncr) 2>/dev/null && set -o igncr; # comment is needed

# escrow : agreement 71245
# escrow upload site : https://www.escrowlive.trust/Account/Registered
# escrow contact : Shay Carter - 415.722.0787
#
# zip the new dir into one big .zip file
# generate a checksum
#  in windows - right click the zip file
#   run CRC SHA -> SHA_256
#    screenshot the results


SOURCE_BASE_DIR="C:/gjs/git_stuff/portal"
TARGET_ESCROW_DIR="C:/Users/eloy98104/OneDrive - TeleTech Holdings, Inc/PortalProject/externalDeliverables/escrow"

# source code dirs
SRC_CODE_LIST="${SOURCE_BASE_DIR}/FrontEnd/portal/src
${SOURCE_BASE_DIR}/BackEnd/callme-svc/src
${SOURCE_BASE_DIR}/BackEnd/callMeWs/src
${SOURCE_BASE_DIR}/BackEnd/icAppsAXLService/src
${SOURCE_BASE_DIR}/BackEnd/icAppsCCEAPIAgent/src
${SOURCE_BASE_DIR}/BackEnd/icAppsConapiService/src
${SOURCE_BASE_DIR}/BackEnd/icAppsCUPIAgent/src
${SOURCE_BASE_DIR}/BackEnd/IcAppsFinesseAPIAgent/src
${SOURCE_BASE_DIR}/BackEnd/icAppsJobScheduler/src
${SOURCE_BASE_DIR}/BackEnd/icAppsLDAPService/src
${SOURCE_BASE_DIR}/BackEnd/icAppsLib/src
${SOURCE_BASE_DIR}/BackEnd/IcAppsRestClientHelper/src
${SOURCE_BASE_DIR}/BackEnd/icAppsWS/src
${SOURCE_BASE_DIR}/BackEnd/icPortalAGService/src
${SOURCE_BASE_DIR}/BackEnd/model/src
${SOURCE_BASE_DIR}/BackEnd/TenantPortalServices/src"

display_usage() { 
	SCRIPT_NAME=`basename "$0"`
	echo -e "\nRun this script AFTER you check things out of GIT."
	echo -e "We assume the FrontEnd and BackEnd are matching versions."
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

# check that src dirs exist
for SRC_DIR in ${SRC_CODE_LIST}
do
	if [ ! -d "${SRC_DIR}" ];
	then
		echo -e "\n\tsource dir  ${SRC_DIR} does not exist"
		display_usage
	fi
done

###  TARGET_ESCROW_DIR exists, continue ?
TARGET_DIRECTORY=${TARGET_ESCROW_DIR}/$GIT_BRANCH
if [ -d "$TARGET_DIRECTORY" ]; then
	echo -e "\nDir already EXISTS : ${TARGET_DIRECTORY}"
	read -r -p "Overwrite it? [y/N] " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		echo -e "\n\toverwriting ${TARGET_DIRECTORY}\n"
	else
    		display_usage
	fi
fi

###  All good to go
###  create the TARGET dir if needed
mkdir -p "${TARGET_ESCROW_DIR}/${GIT_BRANCH}"

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

