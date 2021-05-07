

# export REACT_APP_API_URL=http://localhost:5000

# # RealPlay Server
# export AWS_DEFAULT_REGION=us-west-2
# export REALPLAY_DB_URI=postgres://realplayuser:F35D6492-CC53-4F38-BA0C-DA8500D793C9@ovpc1-pgsql01.clrygru5fh3l.us-west-2.rds.amazonaws.com:5432/realplay_dce1
# # CE05
# #export REALPLAY_DB_URI=postgres://realplayuser:4A51E8B3-71B7-41A5-8519-6AD4233258A1@app1-pgsql01.c7e4lfnihqtl.us-east-1.rds.amazonaws.com:5432/realplay_ce05
# 

# export REALPLAY_LOG_PATH='./gunicorn.log'
# export GOOGLE_APPLICATION_CREDENTIALS='./keys/RealPlay-Authorization.json'
# #Dev - dce1
# export RULE_ENGINE_URL="http://10.12.13.171:30378"
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
# export REALPLAY_DB_URI=postgres://realplayuse.com:5432/realplay_dce1
# # CE05
# export REALPLAY_LOG_PATH='./gunicorn.log'
# export GOOGLE_APPLICATION_CREDENTIALS='./keys/RealPlay-Authorization.json'
# #Dev - dce1

# export REDIS_HOST=localhost
# export REDIS_PORT=7000
# export REDIS_CACHE_EXPIRY_SECS=3600
# 
# #Request URL: http://localhost:5000/scenarios/tenant/parasol/state/prod?group_by=lob
# # RealPlay
# # RealPlay Client
# export CUSTOM_BUILD="parasol"
# export REACT_APP_LOCAL_TENANT="parasol"
# export REACT_APP_API_URL="http://localhost:5000"

# export RUNTIME_ENV=dce1

#-----------------


echo " launching realplay CLIENT "

# # to start the client
chmod 755 ~/gjs/git_stuff/RealPlay/realplay/app-config/local*-env.sh
. ~/gjs/git_stuff/RealPlay/realplay/app-config/localeverything-env.sh 

env|grep PASS
env|grep RUNTIME
env|grep REAL
env|grep REACT

sleep 5

cd ~/gjs/git_stuff/RealPlay/realplay

##xdg-open http://localhost:3000
npm run build # if followed by npm start
npm start
# ## dos2unix run_docker.sh 
# ## bash run_docker.sh localhost
# ## echo "run this :: xdg-open http://localhost:3000"
# ## docker-compose up -d --build

