#!/bin/bash

#DB_USER='gsimpson'
#DB_PSWD='gsimpson'
DB_USER='postgres'
DB_PSWD='pa'
DB_NAME='postgres'
#DB_HOST='localhost'  # this does not work
DB_HOST='127.0.0.1'

export PGUSER=${DB_USER}
export PGPASSWORD=${DB_PSWD}
export PGHOSTADDR=${DB_HOST}
export PGDATABASE=${DB_NAME}


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


