# !/bin/bash

env|grep MON; env|grep POST; env|grep RUNTIME; env|grep DEBUG
cd /opt/HIP-Ops
git pull

#-- shutdown docker images
docker-compose stop
docker-compose rm -f

#-- rm all docker images
docker image rm $(docker image ls -a -q)

#-- starting to rebuild
sh Teardown_Localhost.sh

#-- copy config files to the right places
./Setup_Localhost.sh

#To Start the containers use this command:
clear; time ./run_docker.sh

