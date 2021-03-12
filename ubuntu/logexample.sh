# shellcheck disable=SC1128
#!/bin/bash
# (set -o igncr) 2>/dev/null && set -o igncr; # comment is needed

LOG_DATE_STAMP=`eval date '+%Y%m%d..%H:%M:%S'`
SCRIPT_NAME=`basename "$0"`
LOG_FILE="${SCRIPT_NAME%.*}".log
echo -e "----------- $LOG_DATE_STAMP ----------"

display_usage() {
	echo -e "\nRunning script\n\t\t${SCRIPT_NAME}\n"
	#exit 1
	} 

setup_logging() {
	exec 3>&1 1>${LOG_FILE} 2>&1
	#echo "This is stdout"
	#echo "This is stderr" 1>&2
	#echo "This is the console (fd 3)" 1>&3
	#echo "This is both the log and the console" | tee /dev/fd/3
	} 

log_console() {
	echo "$@" 1>&3
}

log_date() {
  LOG_DATE_STAMP=`eval date '+%Y%m%d..%H:%M:%S'`
  log_both "----------- $LOG_DATE_STAMP ----------"
  log_both "running script\t\t$SCRIPT_NAME"
  log_both "logFile is\t\t\t$LOG_FILE\n\n"
}

log_stderr() {
	echo "$@" 1>&2
}

log_stdout() {
	echo "$@"
}

log_both() {
	echo -e "$@" | tee /dev/fd/3
}

test_logging(){
	TEST_LOG_STR="to the console"
	log_console ${TEST_LOG_STR}

	TEST_LOG_STR="to stdout"
	log_stdout ${TEST_LOG_STR}

	TEST_LOG_STR="to stderr"
	log_stderr ${TEST_LOG_STR}

	TEST_LOG_STR="to stdout & console"
	log_both ${TEST_LOG_STR}

}

filename_parts() {
	FILE="example.tar.gz"
	log_both "${FILE}" 		# full variable
	log_both "${FILE%.*}" 	# example.tar
	log_both "${FILE%%.*}" 	# example
	log_both "${FILE#*.}" 	# tar.gz 
	log_both "${FILE##*.}" 	# gz

	FILE="example/tar/gz"
	log_both "${FILE}" 		# full variable
	log_both "${FILE%/*}" 	# example.tar
	log_both "${FILE%%/*}" 	# example
	log_both "${FILE#*/}" 	# tar.gz 
	log_both "${FILE##*/}" 	# gz

	}

docker-cleanup () {
	#-- shutdown docker images
	docker-compose stop
	docker-compose rm -f
	docker image prune -a -f
	docker network prune -f
	docker system prune -a -f
	
	#-- rm all docker images
	docker image rm $(docker image ls -a -q)
	docker image ls -a #-q
	
	#docker-compose pull &&
	#docker-compose build --no-cache &&
	#docker-compose up -d
}


# MAIN SCRIPT STARTS HERE
log_date
# house keeping
clear
setup_logging
log_date

log_both "\n\tThis bash example logger does not do much\n"

## the end time
log_date
