#!/usr/bin/env bash

## localhost (VM) instance
base_url="http://localhost:3000"

## the docker instance
#base_url="https://hipops2.dce1.humanify.com/nodered"

echo GET  log timing info for V3 APIs ...

#curl -X GET -H "Content-Type: application/json" ${base_url}:3000


time curl -X GET -H "Accept-Encoding:gzip, deflate, br" ${base_url}/api/v3/coaching/2019-07-01/2019-07-08 > coachingDates.gz
time curl -X GET -H "Accept-Encoding:gzip, deflate, br" ${base_url}/api/v3/coaching > coachingNoDates.gz

time curl -X GET -H "Accept-Encoding:gzip, deflate, br" ${base_url}/api/v3/contact/2019-07-01/2019-07-08 > contactDates.gz
time curl -X GET -H "Accept-Encoding:gzip, deflate, br" ${base_url}/api/v3/contact > contactNoDates.gz

time curl -X GET -H "Accept-Encoding:gzip, deflate, br" ${base_url}/api/v3/survey/2019-07-01/2019-07-08 > surveyDates.gz
time curl -X GET -H "Accept-Encoding:gzip, deflate, br" ${base_url}/api/v3/survey > surveyNoDates.gz

time curl -X GET -H "Accept-Encoding:gzip, deflate, br" ${base_url}/api/v3/teams > teamsNoDates.gz

ls -larth