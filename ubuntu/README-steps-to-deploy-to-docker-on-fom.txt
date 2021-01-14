
#Steps to deploy to docker

# ovpc1-fom01
ssh -i ~/.ssh/id_rsa appdev@10.12.13.104

#  this one is used sometimes as a backup
# ssh -i ~/.ssh/id_rsa appdev@10.12.13.187
sudo -i

env|grep MON; env|grep POST; env|grep RUNTIME; env|grep DEBUG
    #-- should see something like this:
    #MONGO_PORT=27017
    #MONGO_URL=10.12.4.127
    #MONGO_DB=magicbutton
    #POSTGRES_PORT=5432
    #POSTGRES_URL=ovpc1-pgsql01.clrygru5fh3l.us-west-2.rds.amazonaws.com
    #POSTGRES_USER=appdev
    #POSTGRES_PASS=EDFD28ED-26AC-417A-B1A1-765EFC214B32
    #POSTGRES_DB=magicbutton
    #RUNTIME_ENV=dce1


cd /opt/Fail-Over-Manager
git pull
#  you might want to reset to the current develop branch
# git reset --hard origin/develop

#-- see what is running
docker ps

#-- shutdown docker images
#To Stop the containers use these 2 commands:
docker-compose stop
docker-compose rm -f

#-- rm all docker images
docker image rm $(docker image ls -a -q)
#-- now you have a clean env; no images stored

#-- should be nothing running now
docker ps ; docker ps -a ; docker images

#-- starting to rebuild
sh Teardown_Localhost.sh

#-- copy config files to the right places
./Setup_Localhost.sh



#-- build and load image into runtime; takes a while
##docker-compose up -d
#To Start the containers use this command:

clear; time ./run_docker.sh
#  it takes about 15 minutes
#    real    17m11.523s
#    user    1m45.851s
#    sys     0m47.177s

# check to see what is running
docker ps ; docker ps -a ; docker images

# to get a bash shell on the docker container (nodejs)
docker exec -it nodejs /bin/bash

## to test Postman/Newman on the VM
#    gvim /opt/Fail-Over-Manager/postman/FOM-scripted-env-variables.postman_environment.json
## change the URL value from:
#    "value": "https://fom.dce1.humanify.com/nodered",
## TO
#    "value": "http://localhost:1880/nodered",
## You probably SHOULD NOT CHECK IN THE modified postman_environment file
#

# run newman tests to verify working APIs
clear; cd postman; time ./FOM-scripted-RUNALL.sh; cd ..
#  it takes about 35 seconds
#    real    0m35.771s
#    user    0m1.397s
#    sys     0m5.555s

## Make whatever changes you are developing/testing
##   the URL for node-red admin on docker image
# https://fom.dce1.humanify.com/nradmin/

# This script copies things back to localhost
./CopyAndCommit_noderedFiles.sh

# This script replaces mongo and postgres references with TOKENS to be replaced
./Prepare_Flows_File.sh

#  If your changes are good - check in the flows file
nodered/ttec_flows_magic.json

#####   End of the normal process steps #####




########### NOTES ################

## to copy files from the nodered docker container to the local server
# docker cp nodered:/data/ttec_flows_magic_cred.json.json ./junk_cred.json


#---------  Kens steps
    run Copy And Commit script
	run Prepare Flow File script
	check in changes
	rebuild fom to verify the changes
	figure out how to run Greg's test suite


#===========
#== Greg deploying local flow
#  COPY the entire flows file from your SOURCE .node-red dir
#  copy that to a place where you can check it in without breaking anything
#   ex: ./nodered-docker-api-scripts/flows_gsimpson-VirtualBox.json
#
# save current flows file
# cp nodered/ttec_flows_magic.json nodered/ttec_flows_magic.json.orig

#-- copy candidate flows file, overwrite ttec_flows_magic.json
# cp nodered-docker-api-scripts/flows_gsimpson-VirtualBox.json nodered/ttec_flows_magic.json
# cp nodered-docker-api-scripts/ttec_flows_magic.json nodered/ttec_flows_magic.json

# ./Prepare_Flows_File.sh
# diff ./nodered/ttec_flows_magic.json ./nodered-docker-api-scripts/flows_gsimpson-VirtualBox.json
# diff ./nodered/ttec_flows_magic.json ./nodered-docker-api-scripts/ttec_flows_magic.json
#==============

#===========
### IF you are replacing ttec_flows_magic.json with a
#   totally different version - as opposed to modifying the one
#   that is currently deployed on docker, the credentials need to refer to the
#   db node
#
#   the id of the node with type = "mongodb2" or "postgresdb"
#     (where the db connections are defined)
#   is the definition of the db connection node.
#
#   the credentials file ttec_flows_magic_cred.json.json
#   (or ttec_flows_magic_cred.json*.json - depending on which env you are targeting)
#   needs to refer to that id value.
#
##  so, take these steps
#   copy the id value from the flows file that you want to deploy
##     ex:  "a811fad8.ae9f08"
#   edit the target credentials file  : ttec_flows_magic_cred.json?.json
#   replace the existing id value FOR THE RIGHT CREDENTIALS (mongo or postgres)
#


# ##########
# EXAMPLE
# starting point
# from flows_gsimpson_VirtualBox.json
# postgres : 6b7d86bc.fa23a8
# mongo-id : 9519d493.8405a8

# from ttec_flows_magic_cred.json_dce1.json
# postgres : c6d950d4.1d39a
# mongo-id : a811fad8.ae9f08
##   Change to :
# postgres : 6b7d86bc.fa23a8
# mongo-id : 9519d493.8405a8
##### save the file
#===========



# # to revert to Ken's flows file
# git checkout fdedd2ca268d5b09c5f2c9a6cc296666ace3ce31 -- ttec_flows_magic.json
#===========
# # to revert to Greg's flows file
# git checkout 2e51de65fe1fece2069356265340024adbfa9b63 -- ttec_flows_magic.json
#===========
