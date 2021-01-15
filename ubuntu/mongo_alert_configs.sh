#!/bin/bash

# delete's all work
#curl -X DELETE -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/AHT_PB_AUX_AVGHOLD_VOICE_RISK |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
#curl -X DELETE -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/AHT_VOICE_ERROR |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
#curl -X DELETE -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/CSAT_CHAT_ERROR |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
#curl -X DELETE -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/CSAT_CHAT_RISK |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
#curl -X DELETE -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/CSAT_EMAIL_ERROR |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
#curl -X DELETE -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/CSAT_EMAIL_RISK |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
#curl -X DELETE -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/CSAT_VOICE_ERROR |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
#curl -X DELETE -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/CSAT_VOICE_RISK |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"

# POST a single alert_config
#curl -X POST -H "Content-Type: application/json" --data @ahtVoiceRiskAlertConfig.json http://localhost:1880/v2/hip-ops/alert_config
#curl -X DELETE -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/AHT_VOICE_RISK |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"

# POST big list of alert_configs
#curl -X POST -H "Content-Type: application/json" --data @postSmallAlertConfigList.json http://localhost:1880/v2/hip-ops/alert_configs_list
#curl -X POST -H "Content-Type: application/json" --data @postBigAlertConfigList.json http://localhost:1880/v2/hip-ops/alert_configs_list

#curl -X POST -H "Content-Type: application/json" --data @postBigAlertConfigList.json http://localhost:1880/v2/hip-ops/alert_config
#curl -X POST -H "Content-Type: application/json" --data @postBigAlertConfigList.json https://api.dce1.humanify.com/nodered/v2/hip-ops/alert_config


# check mongo
# mongo suggestions came from
# https://stackoverflow.com/questions/4837673/how-to-execute-mongo-commands-through-shell-scripts
##mongo 10.12.4.127:27017 -u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops <<EOF
## use hip-ops
#mongo localhost:27017  <<EOF
#use gjs
#db.getCollection("alert_configs").find({}).forEach( printjson );
#EOF

# OR use the API
#curl -X GET -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config_list |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
#curl -X GET -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert_config/CSAT_VOICE_RISK |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"


# test-set the postgres table
#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#update public.hipops_alert_time_offset set time_in_seconds= 66 where tenant = 'all';
#EOF


# reset the time scale for the 'all' tenant
#curl -X GET -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alert-time-offset-create-the-all-tenant

# check the postgres table
#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#SELECT * FROM public.hipops_alert_time_offset order by tenant;
#EOF



## TODO GJS - this runs the nodered flow to populate alert_candidates
# release the hounds
#curl -X GET -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/mockme_alertdata/all |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"


#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#SELECT * FROM public.hipops_alert_current_data_values order by time_stamp ;
#SELECT * FROM public.hipops_alert_candidates order by time_stamp desc
#EOF

###------- done


## generate current data values per tenant
###curl -X GET -H "Content-Type: application/json" https://api.dce1.humanify.com/nodered/v1/hip-ops/mockme_alertdata/tenant30d |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
##curl -X GET -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/mockme_alertdata/tenant30d |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
#curl -X GET -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/mockme_alertdata/all |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"

#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#update public.hipops_alert_candidates
#set time_in_seconds = (
#extract ( epoch from (frequency_interval::text || ' ' ||frequency_units::text)::interval )
#)
#where time_in_seconds = (-1)
#EOF

#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#update hipops_alert_candidates
#set
#time_in_seconds = (-1)
#EOF

#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#update public.hipops_alert_candidates as hac
#set
#time_in_seconds = ( extract ( epoch from (hac.frequency_interval::text || ' ' ||hac.frequency_units::text)::interval )),
#alert_type = UPPER(hid.alert_type)
#from
#public.hipops_alert_id as hid
#where
#hac.alert_id = hid.alert_id
#and hac.time_in_seconds = (-1)
#EOF


#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#select
#hac.frequency_interval
#,hac.frequency_units
#--,'select '''|| hac.frequency_interval || ' ' ||hac.frequency_units  || ''' * ' || '''1 second''' || '::interval'
#--,'interval '''|| hac.frequency_interval || ' ' ||hac.frequency_units  || ''''
#,hac.frequency_interval::text || ' ' ||hac.frequency_units::text as aString
#,(hac.frequency_interval::text || ' ' ||hac.frequency_units::text)::interval as interval
#,extract ( epoch from (hac.frequency_interval::text || ' ' ||hac.frequency_units::text)::interval ) as seconds
#from public.hipops_alert_candidates hac
#EOF


#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#SELECT * FROM public.hipops_alert_candidates order by time_stamp desc
#
#-- insert into hipops_alert_event_states (status) values ('CANDIDATE');
#-- insert into hipops_alert_event_states (status) values ('TO-BE-SENT');
#-- insert into hipops_alert_event_states (status) values ('SUPPRESSED');
#-- insert into hipops_alert_event_states (status) values ('SENT');
#
#EOF


#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#select
#cdate.alert_id
#,(COALESCE( (extract (epoch from events.time_stamp)) ,0 ) + cdate.suppression_seconds) suppress_until_epoch
#,cdate.suppression_seconds
#,COALESCE( (extract (epoch from events.time_stamp)) ,0 ) last_sent
#,(extract (epoch from now() ) ) time_now_extract_epoch
#,cdate.profile_id
#FROM
#public.hipops_alert_candidates cdate
#FULL OUTER JOIN public.hipops_alert_events events
#ON cdate.alert_id = events.alert_id
#AND cdate.profile_id = events.profile_id
#WHERE
#cdate.status = 'CANDIDATE'
#--and cdate.time_stamp not between ( events.time_stamp - '1 second'::interval) and (now() - '1 second'::interval )
#ORDER BY cdate.time_stamp;
#EOF

#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#select
#cdate.alert_id
#,(COALESCE( (extract (epoch from events.time_stamp)) ,0 ) + cdate.suppression_seconds) suppress_until_epoch
#,cdate.suppression_seconds
#,COALESCE( (extract (epoch from events.time_stamp)) ,0 ) last_sent
#,(extract (epoch from now() ) ) time_now_extract_epoch
#,cdate.profile_id
#FROM
#public.hipops_alert_candidates cdate
#,public.hipops_alert_events events
#WHERE
#cdate.status = 'CANDIDATE'
#AND cdate.alert_id = events.alert_id
#AND cdate.tenant = events.tenant
#AND cdate.profile_id = events.profile_id
#--and cdate.time_stamp not between ( events.time_stamp - '1 second'::interval) and (now() - '1 second'::interval )
#ORDER BY cdate.time_stamp;
#EOF

#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#select
#cdate.alert_id
#,(COALESCE( (extract (epoch from events.time_stamp)) ,0 ) + cdate.suppression_seconds) suppress_until_epoch
#,cdate.suppression_seconds
#,COALESCE( (extract (epoch from events.time_stamp)) ,0 ) last_sent
#,(extract (epoch from now() ) ) time_now_extract_epoch
#,cdate.profile_id
#FROM
#public.hipops_alert_candidates cdate
#,public.hipops_alert_events events
#WHERE
#cdate.status = 'CANDIDATE'
#AND cdate.alert_id = events.alert_id
#AND cdate.tenant = events.tenant
#AND cdate.profile_id = events.profile_id
#--GROUP BY cdate.alert_id, cdate.tenant, cdate.profile_id
#ORDER BY cdate.time_stamp;
#EOF

#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#select  c.alert_id,c.tenant,c.profile_id,c.channel,c.module,c.time_stamp candidate_time,e.time_stamp last_alert_time
#FROM (
#SELECT alert_id,tenant,profile_id,channel,module, max(time_stamp) time_stamp
#FROM hipops_alert_events
#WHERE status = 'SENT'
#GROUP BY alert_id,tenant,profile_id,channel,module) e
#inner join
#    ( select alert_id,tenant,profile_id,channel,module, time_stamp
#    from hipops_alert_candidates) c
#on (
#    e.alert_id=c.alert_id
#    and e.tenant=c.tenant
#    and e.profile_id=c.profile_id
#    and e.channel=c.channel
#    )
#EOF

#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#delete from hipops_alert_events;
#insert into hipops_alert_events (alert_id, tenant, profile_id, status, channel, time_stamp)
#  values ('CSAT_VOICE_RISK', 'all', '11-10110', 'SENT', 'email', (current_date - interval '1' day) );
#insert into hipops_alert_events (alert_id, tenant, profile_id, status, channel, time_stamp)
#  values ('CSAT_VOICE_RISK', 'all', '11-10110', 'SENT', 'sms', (current_date - interval '10' day));
#insert into hipops_alert_events (alert_id, tenant, profile_id, status, channel, time_stamp)
#  values ('CSAT_VOICE_RISK', 'all', '11-10110', 'SENT', 'sms', (current_date - interval '180' day));
#----update hipops_alert_events set "time_stamp" = (current_date - interval '1' day) where channel = 'email';
#----update hipops_alert_events set "time_stamp" = (current_date - interval '10' day) where channel = 'sms';
#EOF

#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#SELECT alert_id, tenant, profile_id, status, channel, time_stamp from hipops_alert_candidates order by time_stamp desc;
#SELECT alert_id, tenant, profile_id, status, channel, time_stamp from hipops_alert_events order by time_stamp desc;
#
#--SELECT alert_id, tenant, profile_id, max(time_stamp)
#--FROM hipops_alert_events
#--WHERE status = 'SENT'
#--GROUP BY alert_id, tenant, profile_id
#EOF



#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#SELECT alert_id, tenant, profile_id, status, channel, time_stamp from hipops_alert_events order by time_stamp desc;
#SELECT alert_id, tenant, profile_id, max(time_stamp)
#FROM hipops_alert_events
#WHERE status = 'SENT'
#GROUP BY alert_id, tenant, profile_id
#EOF


#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#select
#--c.time_stamp candidate
#COALESCE( (extract (epoch from c.time_stamp)) ,0 ) candidate
#--, e.time_stamp last_sent
#, COALESCE( (extract (epoch from e.time_stamp)) ,0 ) last_sent
#, suppression_seconds
#, c.alert_id
#, c.tenant
#, c.profile_id
#, status
#, module
#, current_value
#, profile_setting
#, frequency_interval
#, frequency_units
#, alert_on_error
#, alert_on_risk
#, channel
#, channel_value
#from
#hipops_alert_candidates c
#left join
#(
#SELECT alert_id,tenant,profile_id, max(time_stamp) time_stamp
#FROM hipops_alert_events e
#WHERE status = 'SENT'
#GROUP BY alert_id,tenant,profile_id
#) e
#on
#    e.alert_id=c.alert_id
#    and e.tenant=c.tenant
#    and e.profile_id=c.profile_id
#
#WHERE
#---- less than - should be SUPPRESSED
#--COALESCE( (extract (epoch from c.time_stamp)) ,0 ) < ( COALESCE( (extract (epoch from e.time_stamp)) ,0 ) +  suppression_seconds )
#---- greater than - should be TO-BE-SENT
#COALESCE( (extract (epoch from c.time_stamp)) ,0 ) > ( COALESCE( (extract (epoch from e.time_stamp)) ,0 ) +  suppression_seconds )
#
#EOF


#psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
#update hipops_alert_candidates
#set STATUS = "TO-BE-SENT"
#where
#(
#select
# status
#from
#hipops_alert_candidates c
#left join
#(
#SELECT alert_id,tenant,profile_id, max(time_stamp) time_stamp
#FROM hipops_alert_events e
#WHERE status = 'SENT'
#GROUP BY alert_id,tenant,profile_id
#) e
#on
#    e.alert_id=c.alert_id
#    and e.tenant=c.tenant
#    and e.profile_id=c.profile_id
#
#WHERE
#---- less than - should be SUPPRESSED
#--COALESCE( (extract (epoch from c.time_stamp)) ,0 ) < ( COALESCE( (extract (epoch from e.time_stamp)) ,0 ) +  suppression_seconds )
#---- greater than - should be TO-BE-SENT
#COALESCE( (extract (epoch from c.time_stamp)) ,0 ) > ( COALESCE( (extract (epoch from e.time_stamp)) ,0 ) +  suppression_seconds )
#)
#
#EOF



#select n1.name, n1.author_id, count_1, total_count
#from (select id, name, author_id, count(1) as count_1
#from names
#group by id, name, author_id) n1
#inner join (select id, author_id, count(1) as total_count
#from names
#group by id, author_id) n2
#on (n2.id = n1.id and n2.author_id = n1.author_id)
