#!/bin/sh
#curl --data '{ "from": "hm_email_3", "body" : "Hello Ken, Testing Nylas Email Integration!", "subject" : "A friendly Email from Nylas", "name": "Ken", "to": "greg.simpson@ttec.com" }' -H "Authorization:  Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnd2VuQGVtYWlsLmNvbSIsImF1ZCI6Im1rdHdlYmV4dGMuY29tLmlkZW50aXR5RGVsZWdhdGUiLCJhcGlLZXkiOiJmZTUzMTMyZTUyYjQ0M2U1YjE5ZDMxNDJiZjYzMGJjZSIsImlzcyI6Im1rdHdlYmV4dGMuY29tIiwiZXhwIjoxNjE4Njk4OTQ4LCJpYXQiOjE1MjQwOTA5NDgsImNsaWVudF9pZCI6Im1rdHdlYmV4dGMifQ.PcqrZcG1Sc1jk5p844qhgD1xTXQOntDDbVRuLXmm-sA" -H "Content-Type:  application/json" https://api.dce1.humanify.com/utils/v1/nylas

email_from="hm_email_3"
email_body="Hello.  Testing email. Using this as the message body."
email_subj="A friendly email from Nylas"
email_name="Script1"
email_to="greg.simpson@ttec.com"
email_auth="Authorization:  Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnd2VuQGVtYWlsLmNvbSIsImF1ZCI6Im1rdHdlYmV4dGMuY29tLmlkZW50aXR5RGVsZWdhdGUiLCJhcGlLZXkiOiJmZTUzMTMyZTUyYjQ0M2U1YjE5ZDMxNDJiZjYzMGJjZSIsImlzcyI6Im1rdHdlYmV4dGMuY29tIiwiZXhwIjoxNjE4Njk4OTQ4LCJpYXQiOjE1MjQwOTA5NDgsImNsaWVudF9pZCI6Im1rdHdlYmV4dGMifQ.PcqrZcG1Sc1jk5p844qhgD1xTXQOntDDbVRuLXmm-sA"
email_content_type="Content-Type:  application/json" 
email_url="https://api.dce1.humanify.com/utils/v1/nylas"

#curl --data '{"from": ${email_from}, "body" : ${email_body}, "subject" : ${email_subj}, "name" : ${email_name}, "to" : ${email_to} }' -H ${email_auth} -H ${email_content_type} ${email_url}

start_str=" --data '{"
from_str="\"from\" : \"$email_from\" "
body_str="\"body\" : \"$email_body\" "
subj_str="\"subject\" : \"$email_subj\" "
name_str="\"name\" : \"$email_name\" "
to_str=" \"to\" : \"$email_to\" "
end_str="}'"

auth_str="-H \"$email_auth\""
content_type_str="-H \"$email_content_type\""

param_str="$start_str $from_str , $body_str , $subj_str , $name_str , $to_str $end_str $auth_str $content_type_str $email_url"

echo ${param_str}
#curl $param_str

