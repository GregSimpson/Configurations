#!/bin/bash

BLACK_DUCK_JAR="./synopsys-detect-6.4.0.jar"
SCRIPT_NAME=`basename "$0"`

display_usage() { 
	#SCRIPT_NAME=`basename "$0"`
	echo -e "\nRun this script AFTER you have run "
	echo -e "\t\tdocker-compose pull && docker-compose build"
	echo -e "\nMake sure that ${BLACK_DUCK_JAR} exists"
	echo -e "\n\tExample Usage:"
	echo -e "\t\t${SCRIPT_NAME}\n"
	exit 1
	} 

if [ ! -f "${BLACK_DUCK_JAR}" ];
then
	echo -e "\n\tthe Black Duck detect jar ${BLACK_DUCK_JAR} was not found"
	display_usage
fi

LOG_DATE_STAMP=`eval date '+%Y%m%d..%H:%M:%S'`
echo "---------- Running $SCRIPT_NAME  $LOG_DATE_STAMP ----------" 


# This is the way to scan the DIRECTORY (write this cmd all in 1 line)
#java -jar C:\IcAppsBuildAutomation\synopsys-detect-6.1.0\synopsys-detect-6.1.0.jar 
#--blackduck.api.token=MDU3MzAwNzItYTQ1Ny00NzA2LTg3ZDEtYzE5Y2JiOWU1N2ZlOjM2ZDgyMmYzLTIxY2MtNDExYi1hNWQxLTdlMjQ2ZmQyMWExZQ== 
#--blackduck.url=https://ttec.app.blackduck.com --logging.level.com.synopsys.integration=TRACE
#--blackduck.trust.cert=true

# This is the way to scan DOCKER images
bash <(curl -s -L https://detect.synopsys.com/detect.sh) \
--blackduck.url=https://ttec.app.blackduck.com \
--blackduck.api.token=MDU3MzAwNzItYTQ1Ny00NzA2LTg3ZDEtYzE5Y2JiOWU1N2ZlOjM2ZDgyMmYzLTIxY2MtNDExYi1hNWQxLTdlMjQ2ZmQyMWExZQ== \
--blackduck.trust.cert=true\
--detect.project.name=proj-fischer_docker\
--detect.project.version.name=imageScanServer\
--detect.project.code.location.name=proj-fischer_docker_imageScan\
--detect.project.version.phase=RELEASED\
--detect.project.version.distribution=EXTERNAL\
--detect.tools.excluded=DETECTOR\
--detect.docker.image=node\
--detect.docker.passthrough.shared.dir.path.local=/tmp/shared\
--detect.docker.passthrough.working.dir.path.local=/Applications/detect\
--detect.docker.passthrough.cleanup.inspector.container=false\
--detect.docker.passthrough.jar.path=${BLACK_DUCK_JAR}\
--detect.docker.passthrough.imageinspector.service.url=localhost

