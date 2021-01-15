#!/bin/bash

DB_USER='gsimpson'
DB_PSWD='gsimpson'
DB_NAME='postgres'
DB_HOST='localhost'

init_setup() {

echo"  sudo -u postgres createuser --interactive"
## Enter name of role to add: gsimpson
## Shall the new role be a superuser? (y/n) y
# 
}

simpleTest() {
# psql -w -h localhost -U gsimpson -d postgres
psql -w -h $DB_HOST -U $DB_USER -d $DB_NAME -c 'select current_database();'
}


#### run this function
#init_setup
simpleTest


