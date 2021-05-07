
# started from profile : rp_server
# gnome-terminal --window-with-profile=rp_server
#  xterm  -e /bin/bash -l -c "/home/gsimpson/bin/rp_run_server.sh; bash"

cd ~/gjs/git_stuff/RealPlay/_docker
docker network create realplay

export CUSTOM_BUILD="parasol"
export REACT_APP_LOCAL_TENANT="parasol"
export REACT_APP_API_URL="http://localhost:5000/"

# RealPlay Server
export AWS_DEFAULT_REGION=us-west-2

export REALPLAY_LOG_LEVEL=DEBUG 
# #Dev - local
# export REALPLAY_DB_URI=postgres://realplayuser:[[password]]@localhost:5432/realplay_local
#Dev - dce1
export REALPLAY_DB_URI=postgres://realplayuser:F35D6492-CC53-4F38-BA0C-DA8500D793C9@ovpc1-pgsql01.clrygru5fh3l.us-west-2.rds.amazonaws.com:5432/realplay_dce1
# CE05
# export REALPLAY_DB_URI=postgres://realplayuser:4A51E8B3-71B7-41A5-8519-6AD4233258A1@app1-pgsql01.c7e4lfnihqtl.us-east-1.rds.amazonaws.com:5432/realplay_ce05

export REALPLAY_LOG_PATH='./gunicorn.log'
export GOOGLE_APPLICATION_CREDENTIALS='./keys/RealPlay-Authorization.json'
#Dev - dce1
export RULE_ENGINE_URL="http://10.12.13.171:30378"
export REDIS_HOST=localhost
export REDIS_PORT=7000
export REDIS_CACHE_EXPIRY_SECS=3600

# RealPlay Server
#----------------
# # CE05
# #export REALPLAY_DB_URI=postgres://realplayuser:4A51E8B3-71B7-41A5-8519-6AD4233258A1@app1-pgsql01.c7e4lfnihqtl.us-east-1.rds.amazonaws.com:5432/realplay_ce05
# export REALPLAY_LOG_PATH='./gunicorn.log'
# export GOOGLE_APPLICATION_CREDENTIALS='./keys/RealPlay-Authorization.json'

# #Dev - dce1
# export RULE_ENGINE_URL="http://10.12.13.171:30378"
# export REDIS_HOST=localhost
# export REDIS_PORT=7000
# export REDIS_CACHE_EXPIRY_SECS=3600
#----------------

env|grep REAL
env|grep RULE
env|grep REDIS
sleep 5

docker-compose up -d --build

# to start the server
cd ~/gjs/git_stuff/RealPlay/realplay_server
sh run_server_localhost.sh

