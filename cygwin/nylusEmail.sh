
# this works for a single user
curl --data '{ "from": "hm_email_3", "body" : "Hello Ken, Testing Nylas Email Integration!", "subject" : "A friendly Email from Nylas", "name": "Ken", "to": "greg.simpson@ttec.com" }' -H "Authorization:  Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnd2VuQGVtYWlsLmNvbSIsImF1ZCI6Im1rdHdlYmV4dGMuY29tLmlkZW50aXR5RGVsZWdhdGUiLCJhcGlLZXkiOiJmZTUzMTMyZTUyYjQ0M2U1YjE5ZDMxNDJiZjYzMGJjZSIsImlzcyI6Im1rdHdlYmV4dGMuY29tIiwiZXhwIjoxNjE4Njk4OTQ4LCJpYXQiOjE1MjQwOTA5NDgsImNsaWVudF9pZCI6Im1rdHdlYmV4dGMifQ.PcqrZcG1Sc1jk5p844qhgD1xTXQOntDDbVRuLXmm-sA" -H "Content-Type:  application/json" https://api.dce1.humanify.com/utils/v1/nylas

# Nylas access token
Anzys9UOU8XRtKTfwlq870aMEL8guw

# this WORKS - but it uses the nylas access token and URL
#  I am not sure how to find our token
#curl -X POST \
#  https://api.nylas.com/send \
 # using the humanify url fails - need the right token
curl -X POST https://api.dce1.humanify.com/utils/v1/nylas \
  -H 'Authorization: Basic QW56eXM5VU9VOFhSdEtUZndscTg3MGFNRUw4Z3V3Og==' \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
  -d '{
    "body" : "multi-email test body",
    "subject": "Re: Multi-email Test",
    "from":  [{"name": "test", "email": "email.test3@humanify.com"}],
    "to": [{
                "email": "test1@test.com", 
                "name": "test1"
    }, {
        "email": "test2@test.com",
        "name": "test2"
    }]
}'



# same key as above
#curl -X POST https://api.dce1.humanify.com/utils/v1/nylas \
curl -X POST https://api.nylas.com/send \
  -H 'Authorization: Basic QW56eXM5VU9VOFhSdEtUZndscTg3MGFNRUw4Z3V3Og==' \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
  -d '{
    "body" : "multi-email test body",
    "subject": "Re: Multi-email Test",
    "from": "email.test3@humanify.com",
    "to": [{
                "email": "greg.simpson@ttec.com", 
                "name": "greg"
    }, {
        "email": "ken.washington@ttec.com",
        "name": "ken"
    }]
}'

# encoded token
curl -X POST https://api.dce1.humanify.com/utils/v1/nylas \
  -H 'Authorization: Basic ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKemRXSWlPaUpuZDJWdVFHVnRZV2xzTG1OdmJTSXNJbUYxWkNJNkltMXJkSGRsWW1WNGRHTXVZMjl0TG1sa1pXNTBhWFI1UkdWc1pXZGhkR1VpTENKaGNHbExaWGtpT2lKbVpUVXpNVE15WlRVeVlqUTBNMlUxWWpFNVpETXhOREppWmpZek1HSmpaU0lzSW1semN5STZJbTFyZEhkbFltVjRkR011WTI5dElpd2laWGh3SWpveE5qRTROams0T1RRNExDSnBZWFFpT2pFMU1qUXdPVEE1TkRnc0ltTnNhV1Z1ZEY5cFpDSTZJbTFyZEhkbFltVjRkR01pZlEuUGNxclpjRzFTYzFqazVwODQ0cWhnRDF4VFhRT250RERiVlJ1TFhtbS1zQTo=' \
  -H 'Content-Type: application/json' \
  -H 'cache-control: no-cache' \
  -d '{
    "body" : "multi-email test body",
    "subject": "Re: Multi-email Test",
    "from": "hm_email_3",
    "to": [{
                "email": "greg.simpson@ttec.com", 
                "name": "greg"
    }, {
        "email": "ken.washington@ttec.com",
        "name": "ken"
    }]
}'

