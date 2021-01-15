#!/bin/bash

DB_USER='gsimpson'
DB_PSWD='gsimpson'
#DB_NAME='admin'
DB_NAME='gjs1'
DB_HOST='localhost'
DB_PORT=27017

# mongo suggestions came from
# https://stackoverflow.com/questions/4837673/how-to-execute-mongo-commands-through-shell-scripts
# mongo localhost:27017 -u admin -p password  --authenticationDatabase admin

init_setup() {
mongo $DB_HOST:$DB_PORT -u admin -p password  --authenticationDatabase admin <<EOF
use $DB_NAME
print ("Successfully connected to mongo");

db.createUser({user:"admin", pwd:"admin", roles:[{role:"userAdmin", db:"gjs1"}]});
db.grantRolesToUser(
    "admin",
    [ "readWrite" , { role: "dbAdmin", db: "gjs1" }, "dbOwner" ],
    { w: "majority" , wtimeout: 4000 }
 );


db.createUser({user:"gsimpson", pwd:"password", roles:[{role:"userAdmin", db:"gjs1"}]});
db.grantRolesToUser(
   "gsimpson",
   [ "readWrite" , { role: "dbAdmin", db: "gjs1" }, "dbOwner" ],
   { w: "majority" , wtimeout: 4000 }
);

db.getUser("admin")
db.getUser("gsimpson")

db.adminCommand({listDatabases:1})

EOF
}

simpleTest() {
mongo $DB_HOST:$DB_PORT -u admin -p password  --authenticationDatabase admin <<EOF
use $DB_NAME
print ("Successfully connected to mongo");

db.getUser("admin")
db.getUser("gsimpson")

db.adminCommand({listDatabases:1})

EOF
}


#### run this function
#init_setup
simpleTest


