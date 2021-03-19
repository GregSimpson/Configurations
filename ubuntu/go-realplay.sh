# shellcheck disable=SC1128
#!/bin/bash
# (set -o igncr) 2>/dev/null && set -o igncr; # comment is needed

LOG_DATE_STAMP=`eval date '+%Y%m%d..%H:%M:%S'`
SCRIPT_NAME=`basename "$0"`
LOG_FILE="${SCRIPT_NAME%.*}".log
echo -e "----------- $LOG_DATE_STAMP ----------"
echo -e "running script\t\t$SCRIPT_NAME"
echo -e "logFile is \t\t$LOG_FILE\n\n"

display_usage() { 
	#SCRIPT_NAME=`basename "$0"`
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
  log_both "logFile is \t\t$LOG_FILE\n\n"
  #echo -e "running script\t\t$SCRIPT_NAME"
  #echo -e "logFile is \t\t$LOG_FILE\n\n"
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

	#SCRIPT_NAME=`basename "$0"`
	#LOG_FILE="${SCRIPT_NAME%.*}".log
	#echo "${LOG_FILE}"
	}


# https://github.com/TTEC-Dig-PE/project-fischer#initial-install
fischer-initial-install () {
	log_both `docker network create realplay`
	log_both `docker network ls`

	export REDIS_CLUSTER_IP=0.0.0.0
	cd ./_docker
	docker-compose pull && docker-compose up --build -d
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

db_clean () {
	pushd ${LOCAL_REPO_ROOT}
	log_both `docker run --rm --network realplay -v "$(pwd)/database/postgres/Migrations/sql":/flyway/sql -v "$(pwd)/database/postgres/Migrations/gjs_env":/flyway/conf flyway/flyway clean`
	popd 
}

db_fresh () {
	pushd ${LOCAL_REPO_ROOT}
	#log_both `eval pwd`
	log_both `docker run --rm --network realplay -v "$(pwd)/database/postgres/Migrations/sql":/flyway/gjs_env -v "$(pwd)/database/postgres/Migrations/gjs_env":/flyway/conf flyway/flyway baseline`
	popd 
	#log_both `eval pwd`
}

db_status () {
	pushd ${LOCAL_REPO_ROOT}
	log_both `docker run --rm --network realplay -v "$(pwd)/database/postgres/Migrations/sql":/flyway/sql -v "$(pwd)/database/postgres/Migrations/gjs_env":/flyway/conf flyway/flyway info`
	popd 
}

db_update () {
	pushd ${LOCAL_REPO_ROOT}
	log_both `docker run --rm --network realplay -v "$(pwd)/database/postgres/Migrations/sql":/flyway/sql -v "$(pwd)/database/postgres/Migrations/gjs_env":/flyway/conf flyway/flyway migrate`
	popd 
}

db_target () {
	pushd ${LOCAL_REPO_ROOT}
	log_both `docker run --rm --network realplay -v "$(pwd)/database/postgres/Migrations/sql":/flyway/sql -v "$(pwd)/database/postgres/Migrations/gjs_env":/flyway/conf flyway/flyway migrate -target=1.0.1`
	popd 
}


# MAIN SCRIPT STARTS HERE
#log_date

# https://github.com/TTEC-Dig-PE/project-fischer/wiki/Flyway-DWF#running-on-windows
LOCAL_REPO_ROOT="/home/gsimpson/gjs/git_stuff/RealPlay"
# house keeping
clear
setup_logging
log_date
#test_logging
#display_usage
#filename_parts


#docker-cleanup
#fischer-initial-install
#----------

# steps to setup postgres containers from scratch
#  ( saved in ~/bin/dwf for convenience )

# cd ./_docker/
# export REDIS_CLUSTER_IP=0.0.0.0
# docker network create realplay
# gvim docker-compose.yml     ### change the network name line 88
# clear; docker-compose up --build -d
# >>>> end of dwf script <<<<

# cd database/
# gvim flyway.sh               ### change network name
# ./flyway.sh gjs migrate
# ./flyway.sh gjs info
# ./flyway.sh gjs migrate -target=1.0.1

# dwf project-fischer docker postgres setup
#   cd ~/gjs/git_stuff/project-fischer/_docker/
# sign onto postgres
#   export PGPASSWORD="password"
#   psql -w -h localhost -U postgres -d fischer
#
# run these scripts
#   fischer=# \i dwf_create_db.sql
#   fischer=# \i ./dwf_permissions.sql




#----------
db_clean
#db_fresh
#db_update
#db_target

#db_status # comes out ugly
# the stand alone line looks better in the log
docker run --rm --network realplay -v "$(pwd)/database/postgres/Migrations/sql":/flyway/sql -v "$(pwd)/database/postgres/Migrations/gjs_env":/flyway/conf flyway/flyway info;

## the end time
log_date
