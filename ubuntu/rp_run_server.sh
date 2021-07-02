
# started from profile : rp_server
# gnome-terminal --window-with-profile=rp_server
#  xterm  -e /bin/bash -l -c "/home/gsimpson/bin/rp_run_server.sh; bash"


echo -s " run localRP-server instead"


# cd ~/gjs/git_stuff/RealPlay/_docker
# docker network create realplay

export CUSTOM_BUILD="parasol"
export REACT_APP_LOCAL_TENANT="parasol"
export REACT_APP_API_URL="http://localhost:5000/"

# RealPlay Server
export AWS_DEFAULT_REGION=

export REALPLAY_LOG_LEVEL=DEBUG 
# #Dev - local
# export REALPLAY_DB_URI=postgres://realplayus
#Dev - dce1
export REALPLAY_DB_URI=post
# CE05
# export REALPLAY_DB_URI=po

export REALPLAY_LOG_PATH='./gunicorn.log'
export GOOGLE_APPLICATION_CREDENTIALS='./keys/RealPlay-Authorization.json'
#Dev - dce1
export RULE_ENGINE_URL="http://XXXYYYAAA:30378"
export REDIS_HOST=localhost
export REDIS_PORT=7000
export REDIS_CACHE_EXPIRY_SECS=3600

# RealPlay Server
#----------------
# # CE05
# #export REALPLAY_DB_URI=postgres://realpla
# export REALPLAY_LOG_PATH='./gunicorn.log'
# export GOOGLE_APPLICATION_CREDENTIALS='./keys/RealPlay-Authorization.json'

# #Dev - dce1
# export RULE_ENGINE_URL="http://XXXYYYZZZ:30378"
# export REDIS_HOST=localhost
# export REDIS_PORT=7000
# export REDIS_CACHE_EXPIRY_SECS=3600
#----------------

env|grep REAL
env|grep RULE
env|grep REDIS
# sleep 5

# docker-compose up -d --build

# to start the server
# cd ~/gjs/git_stuff/RealPlay/realplay_server
# sh run_server_localhost.sh

