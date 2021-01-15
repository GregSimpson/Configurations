#!/bin/bash

DB_USER='gsimpson'
DB_PSWD='gsimpson'
#DB_NAME='admin'
DB_NAME='gjs1'
DB_HOST='localhost'
DB_PORT=27017

# mongo localhost:27017 -u admin -p password  --authenticationDatabase admin

#db.products.insert( { item: "card", qty: 15 } )
function testMongoScript {
    mongo $DB_HOST:$DB_PORT -u admin -p password  --authenticationDatabase admin <<EOF
    use $DB_NAME;
    //db.testr.insert( { item: "card", qty: 11, extra: "just another field" } );
    //db.testr.insert( { item: "two", qty: 12 } );
    //db.testr.insert( { item: "three", num: 12, qty :9 } );
    //db.testr.insert( { item: "four",  qty :8 } );
    //db.testr.findOne();
    //db.testr.find().count();
    //db.testr.find().forEach(printjson);
    //db.testr.find({item : "three" }).forEach(printjson);
    ////db.getCollection('testr').find({qty: {$gt:10} }) 
    ////db.testr.find({qty:{$gt:50}}).pretty() 
    db.testr.find({item:"three"}).pretty() 

EOF
}

#### run this function
testMongoScript 


