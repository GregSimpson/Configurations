

# export REACT_APP_API_URL=http://localhost:5000

# # RealPlay Server
# export AWS_DEFAULT_REGION=us-west-2
# export REALPLAY_DB_URI=p
# # CE05
# #export REALPLAY_DB_URI=p
# 

# export REALPLAY_LOG_PATH='./gunicorn.log'
# export GOOGLE_APPLICATION_CREDENTIALS='./keys/RealPlay-Authorization.json'
# #Dev - dce1
# export RULE_ENGINE_URL="http://xxx"
# export REDIS_HOST=localhost
# export REDIS_PORT=7000
# export REDIS_CACHE_EXPIRY_SECS=3600
# 

# Request URL: http://localhost:5000/scenarios/tenant/parasol/state/prod?group_by=lob
# RealPlay

# RealPlay Client
### export CUSTOM_BUILD="parasol"
### export POSTGRES_PASS="XXXXXXX"
# export REACT_APP_LOCAL_TENANT="parasol"
#export REACT_APP_API_URL="http://localhost:5000"
# export REACT_APP_API_URL=http://localhost:5000
#export REACT_APP_API_URL="https://(dce1)"
# export RUNTIME_ENV=dce1

#############################################################

# started from profile : rp_client
# gnome-terminal --window-with-profile=rp_client

#------------------

# REACT_APP_API_URL=http://localhost:5000
# # RealPlay Server
# export AWS_DEFAULT_REGION=us-west-2
# export REALPLAY_DB_URI=postgres://XXXYYYZZZ.com:5432/XXXYYY_dce1
# # CE05
# export REALPLAY_LOG_PATH='./gunicorn.log'
# export GOOGLE_APPLICATION_CREDENTIALS='./keys/RealPlay-Authorization.json'
# #Dev - dce1

# export REDIS_HOST=localhost
# export REDIS_PORT=7000
# export REDIS_CACHE_EXPIRY_SECS=3600
# 
# #Request URL: http://localh
# # RealPlay
# # RealPlay Client
# export CUSTOM_BUILD="parasol"
# export REACT_APP_LOCAL_TENANT="parasol"
# export REACT_APP_API_URL="http://localhost:5000"

# export RUNTIME_ENV=dce1

#-----------------


echo -s " run localRP-client instead"



# echo " launching realplay CLIENT "

# # to start the client
chmod 755 ~/gjs/git_stuff/RealPlay/realplay/app-config/local*-env.sh
. ~/gjs/git_stuff/RealPlay/realplay/app-config/localeverything-env.sh 

env|grep PASS
env|grep RUNTIME
env|grep REAL
env|grep REACT

#sleep 5

cd ~/gjs/git_stuff/RealPlay/realplay

##xdg-open http://localhost:3000
# npm run build # if followed by npm start
# npm start
# ## dos2unix run_docker.sh 
# ## bash run_docker.sh localhost
# ## echo "run this :: xdg-open http://localhost:3000"
# ## docker-compose up -d --build

