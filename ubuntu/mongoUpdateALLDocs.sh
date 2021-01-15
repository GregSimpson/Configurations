#!/bin/bash

# https://docs.mongodb.com/manual/reference/method/db.collection.findAndModify/#db.collection.findAndModify
# By default, both operations modify a single document.
#  However, the update() method with its multi option can modify more than one document.


## mongo suggestions came from
## https://stackoverflow.com/questions/4837673/how-to-execute-mongo-commands-through-shell-scripts
## https://docs.mongodb.com/manual/reference/method/db.collection.update/#db.collection.update
#mongo 10.12.4.127:27017 -u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops <<EOF
#use hip-ops
#db.getCollection("thresholds-and-metrics").update(
#	{
#	\$or:
#		[
#			{  "content.sl.alerts.alert_on.error.enabled" : true}
#			,{ "content.sl.alerts.alert_on.risk.enabled"  : true}
#			,{ "content.csat.alerts.alert_on.error.enabled" : true}
#			,{ "content.csat.alerts.alert_on.risk.enabled"  : true}
#			,{ "content.average_handle_time.alerts.alert_on.error.enabled" : true}
#			,{ "content.average_handle_time.alerts.alert_on.risk.enabled"  : true}
#		]
#	},
#	{ \$set:
#		{
#			  "content.sl.alerts.alert_on.error.enabled" : false
#			, "content.sl.alerts.alert_on.risk.enabled"  : false
#			, "content.csat.alerts.alert_on.error.enabled" : false
#			, "content.csat.alerts.alert_on.risk.enabled"  : false
#			, "content.average_handle_time.alerts.alert_on.error.enabled" : false
#			, "content.average_handle_time.alerts.alert_on.risk.enabled"  : false
#		}
#	},
#	{
#	    upsert: true
#	    ,multi: true
#	}
#);
#EOF

#mongo 10.12.4.127:27017 -u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops <<EOF
#use hip-ops
#db.getCollection("thresholds-and-metrics").update( 
#	{
#		profileid: "P-tog-0-4"
#		,\$or:
#		[
#			{  "content.sl.alerts.alert_on.error.enabled" : true}
#			,{ "content.sl.alerts.alert_on.risk.enabled"  : true}
#			,{ "content.csat.alerts.alert_on.error.enabled" : true}
#			,{ "content.csat.alerts.alert_on.risk.enabled"  : true}
#			,{ "content.average_handle_time.alerts.alert_on.error.enabled" : true}
#			,{ "content.average_handle_time.alerts.alert_on.risk.enabled"  : true}
#		]
#	},
#	{ \$set:
#		{
#			  "content.sl.alerts.alert_on.error.enabled" : false
#			, "content.sl.alerts.alert_on.risk.enabled"  : false
#			, "content.csat.alerts.alert_on.error.enabled" : false
#			, "content.csat.alerts.alert_on.risk.enabled"  : false
#			, "content.average_handle_time.alerts.alert_on.error.enabled" : false
#			, "content.average_handle_time.alerts.alert_on.risk.enabled"  : false
#		}
#	},
#	{ upsert: true}
#);
#EOF

#mongo 10.12.4.127:27017 -u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops <<EOF
#use hip-ops
#db.getCollection("thresholds-and-metrics").find( 
#	{
#	profileid: "P-tog-0-4"
#	,\$or:
#		[
#			{  "content.sl.alerts.alert_on.error.enabled" : true}
#			,{ "content.sl.alerts.alert_on.risk.enabled"  : true}
#			,{ "content.csat.alerts.alert_on.error.enabled" : true}
#			,{ "content.csat.alerts.alert_on.risk.enabled"  : true}
#			,{ "content.average_handle_time.alerts.alert_on.error.enabled" : true}
#			,{ "content.average_handle_time.alerts.alert_on.risk.enabled"  : true}
#		]
#	}
#).forEach( printjson );
#EOF

mongo 10.12.4.127:27017 -u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops <<EOF
use hip-ops
db.getCollection("thresholds-and-metrics").find( 
	{
	\$or:
		[
			{  "content.sl.alerts.alert_on.error.enabled" : true}
			,{ "content.sl.alerts.alert_on.risk.enabled"  : true}
			,{ "content.csat.alerts.alert_on.error.enabled" : true}
			,{ "content.csat.alerts.alert_on.risk.enabled"  : true}
			,{ "content.average_handle_time.alerts.alert_on.error.enabled" : true}
			,{ "content.average_handle_time.alerts.alert_on.risk.enabled"  : true}
		]
	}
).forEach( printjson );
EOF

mongo 10.12.4.127:27017 -u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops <<EOF
use hip-ops
db.getCollection("thresholds-and-metrics").find(
	{
	\$or:
		[
			{  "content.sl.alerts.alert_on.error.enabled" : true}
			,{ "content.sl.alerts.alert_on.risk.enabled"  : true}
			,{ "content.csat.alerts.alert_on.error.enabled" : true}
			,{ "content.csat.alerts.alert_on.risk.enabled"  : true}
			,{ "content.average_handle_time.alerts.alert_on.error.enabled" : true}
			,{ "content.average_handle_time.alerts.alert_on.risk.enabled"  : true}
		]
	}
).project({ _id: 0 , profileid: 1 }).forEach( printjson );
EOF

#     , content.csat.playbook.auxiliary_metrics.avg_abandon.voice.error._postgres_alert_id: 1
#    , content.csat.playbook.auxiliary_metrics.avg_abandon.voice.error.value: 1


# // db.users.find(
# //    {
# //      status: "A",
# //      \$or: [
# //         { age: { \$lt: 30 } },
# //         { type: 1 }
# //       ]
# //    }
# // )

# //     \$or: [ { status: "A" }, { age: { \$lt: 30 } } ]

## WORKED : db.getCollection("thresholds-and-metrics").find({ profileid : "QATC:Scenario 5" }).forEach( printjson );
##  db.getCollection("thresholds-and-metrics").find({ "content.sl.label" : "Service Level (SL)" }).forEach( printjson );
#####  db.getCollection("thresholds-and-metrics").find({ "content.sl.alerts.alert_on.error.enabled" : true}).forEach( printjson );

# //db.users.find ( { status: "A" } );
#db.getCollection("thresholds-and-metrics").find({ content.sl.alerts.alert_on.error.enabled : true}).forEach( printjson );
#content.sl.alerts.alert_on.error.enabled




# psql postgresql://appdev:EDFD28ED-26AC-417A-B1A1-765EFC214B32@10.12.20.46/hip-ops << EOF
# SELECT * FROM public.hipops_alert_current_data_values order by time_stamp desc, tenant;
# SELECT * FROM public.hipops_alert_time_offset order by time_stamp desc, tenant;
# EOF


# mongo suggestions came from
# https://stackoverflow.com/questions/4837673/how-to-execute-mongo-commands-through-shell-scripts
#mongo 10.12.4.127:27017 -u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops <<EOF
#use hip-ops
#db.getCollection("alert_configs").find({}).forEach( printjson );
#EOF


## - all of the above work - 



#mongo 10.12.4.127:27017 -u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops < m-script1.js
## m-script.js contains these lines (without the '#')
#use hip-ops
#db.getCollection("alert_configs").find({
#  alert_id: { \$exists: true }
#}).forEach( printjson );
#EOF


#mongo 10.12.4.127:27017 -u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops <<EOF
#use hip-ops

#mongo localhost:27017 << EOF #-u hip-ops -p 308D9EA9A255-310B-5C64-251C-18941CC2  --authenticationDatabase hip-ops <<EOF
#use gjs
#db.getCollection("alert_configs").find({
#  alert_id: { \$exists: true }
#}).forEach( printjson );
#EOF


# https://docs.mongodb.com/v3.2/tutorial/query-documents/
# mongo localhost:27017 << EOF
# use gjs
# db.getCollection("users").find({
#   alert_id: { \$exists: true }
# }).forEach( printjson );
# db.users.drop()
# db.users.insertMany(
#   [
#      {
#        _id: 1,
#        name: "sue",
#        age: 19,
#        type: 1,
#        status: "P",
#        favorites: { artist: "Picasso", food: "pizza" },
#        finished: [ 17, 3 ],
#        badges: [ "blue", "black" ],
#        points: [
#           { points: 85, bonus: 20 },
#           { points: 85, bonus: 10 }
#        ]
#      },
#      {
#        _id: 2,
#        name: "bob",
#        age: 42,
#        type: 1,
#        status: "A",
#        favorites: { artist: "Miro", food: "meringue" },
#        finished: [ 11, 25 ],
#        badges: [ "green" ],
#        points: [
#           { points: 85, bonus: 20 },
#           { points: 64, bonus: 12 }
#        ]
#      },
#      {
#        _id: 3,
#        name: "ahn",
#        age: 22,
#        type: 2,
#        status: "A",
#        favorites: { artist: "Cassatt", food: "cake" },
#        finished: [ 6 ],
#        badges: [ "blue", "red" ],
#        points: [
#           { points: 81, bonus: 8 },
#           { points: 55, bonus: 20 }
#        ]
#      },
#      {
#        _id: 4,
#        name: "xi",
#        age: 34,
#        type: 2,
#        status: "D",
#        favorites: { artist: "Chagall", food: "chocolate" },
#        finished: [ 5, 11 ],
#        badges: [ "red", "black" ],
#        points: [
#           { points: 53, bonus: 15 },
#           { points: 51, bonus: 15 }
#        ]
#      },
#      {
#        _id: 5,
#        name: "xyz",
#        age: 23,
#        type: 2,
#        status: "D",
#        favorites: { artist: "Noguchi", food: "nougat" },
#        finished: [ 14, 6 ],
#        badges: [ "orange" ],
#        points: [
#           { points: 71, bonus: 20 }
#        ]
#      },
#      {
#        _id: 6,
#        name: "abc",
#        age: 43,
#        type: 1,
#        status: "A",
#        favorites: { food: "pizza", artist: "Picasso" },
#        finished: [ 18, 12 ],
#        badges: [ "black", "blue" ],
#        points: [
#           { points: 78, bonus: 8 },
#           { points: 57, bonus: 7 }
#        ]
#      }
#   ]
# )
# EOF


# mongo localhost:27017 << EOF
# use gjs
# // these 2 are the same
# // db.users.find( );
# // db.users.find( {} );

# // where the status = "A":
# //db.users.find ( { status: "A" } );

# // where status = either "P" or "D"
# //db.users.find( { status: { \$in: [ "P", "D" ] } } );

# //where the status equals "A" and age is less than (\$lt) 30
# //db.users.find( { status: "A", age: { \$lt: 30 } } );

# // status equals "A" or age is less than ($lt) 30:
# //db.users.find(
# //   {
# //     \$or: [ { status: "A" }, { age: { \$lt: 30 } } ]
# //   }
# //)

# // where the``status`` equals "A" and either age is less than than (\$lt) 30 or type equals 1:
# // db.users.find(
# //    {
# //      status: "A",
# //      \$or: [
# //         { age: { \$lt: 30 } },
# //         { type: 1 }
# //       ]
# //    }
# // )


# // matches all documents where the favorites field is an embedded document that contains
# //  only the fields artist equal to "Picasso" and food equal to "pizza", in that order:
# // db.users.find( { favorites: { artist: "Picasso", food: "pizza" } } ).forEach( printjson )

# // match all documents where the favorites field is an embedded document that includes
# //  the field artist equal to "Picasso" and may contain other fields:
# // db.users.find( { "favorites.artist": "Picasso" } )


# // queries for all documents where the field badges is an array that holds exactly two elements,
# // "blue", and "black", in this order:
# // db.users.find( { badges: [ "blue", "black" ] } )

# // queries for all documents where badges is an array that contains "black" as one of its elements:
# //db.users.find( { badges: "black" } )


# // query uses the dot notation to match all documents where the badges is an array that contains
# // "black" as the first element:
# //db.users.find( { "badges.0": "black" } )
# //db.users.find( { "badges.1": "black" } )


# // queries for documents where the finished array contains at least one element
# // that is greater than (\$gt) 15 and less than (\$lt) 20:
# //db.users.find( { finished: { \$elemMatch: { \$gt: 15, \$lt: 20 } } } )

# //e.g., one element can satisfy the greater than 15 condition and another element
# // can satisfy the less than 20 condition, or a single element can satisfy both:
# // db.users.find( { finished: { \$gt: 15, \$lt: 20 } } )

# //selects all documents where the points contains an array whose first element
# // (i.e. index is 0) is a document that contains the field points whose value
# //  is less than or equal to 55:
# //db.users.find( { 'points.0.points': { \$lte: 55 } } )

# //selects all documents where the points is an array with at least one embedded document
# // that contains the field points whose value is less than or equal to 55:
# //db.users.find( { 'points.points': { \$lte: 55 } } )


# //queries for documents where the points array has at least one embedded document that
# // contains both the field points less than or equal to 70 and the field bonus equal to 20:
# //db.users.find( { points: { \$elemMatch: { points: { \$lte: 70 }, bonus: 20 } } } )


# // queries for documents where the points array contains elements that in some combination
# // satisfy the query conditions; e.g. one element satisfies the points less than or equal
# //  to 70 condition and another element satisfies the bonus equal to 20 condition,
# //   or a single element satisfies both criteria:
# db.users.find( { "points.points": { \$lte: 70 }, "points.bonus": 20 } )


# EOF

#//db.users.find( {} )
#//db.users.find( ).forEach( printjson );
#//db.users.find( {} ).forEach( printjson );



echo call API to send messages ...

## localhost (VM) instance
base_url="http://localhost:1880/nodered"

## the dev env - dce1
#base_url="https://api.dce1.humanify.com/nodered"

## the docker instance
#base_url="https://hipops2.dce1.humanify.com/nodered"

# localhost (VM) instance
#curl -X GET -H "Content-Type: application/json" http://localhost:1880/v2/hip-ops/alerting/send_notices |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
# the dev env - dce1
#curl -X GET -H "Content-Type: application/json" https://api.dce1.humanify.com/nodered/v2/hip-ops/alerting/send_notices |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"
# the docker instance
#curl -X GET -H "Content-Type: application/json" https://hipops2.dce1.humanify.com/nodered/v2/hip-ops/alerting/send_notices |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"


#TODO
#echo GET  mock csat V2- run the entire ALERT system using the ALL tenant ...
#curl -X GET -H "Content-Type: application/json" ${base_url}/v2/hip-ops/mockme_alertdata/all |node <<< "var o = $(cat); console.log(JSON.stringify(o, null, 4));"


