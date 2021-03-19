DB_USER='postgres'
DB_PSWD='password'
DB_NAME='postgres'
DB_HOST='127.0.0.1'

export PGUSER=${DB_USER}
export PGPASSWORD=${DB_PSWD}
export PGHOSTADDR=${DB_HOST}
export PGDATABASE=${DB_NAME}


psql -w -h $DB_HOST -U $DB_USER -d $DB_NAME


