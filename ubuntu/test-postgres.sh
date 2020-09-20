
DB_USER='gsimpson'
DB_PSWD='gsimpson'
DB_NAME='postgres'
DB_HOST='localhost'
#export PGPASSWORD='gsimpson'

#psql "postgresql://$DB_USER:$DB_PSWD@$DB_HOST/$DB_NAME" -c 'select version();'

#PGPASSWORD=$DB_PSWD psql -h $DB_HOST -U $DB_HOST -d $DB_NAME -c 'select version();'
#PGPASSWORD='gsimpson' psql -h $DB_HOST -U $DB_HOST -d $DB_NAME -c 'select version();'
# psql -h $DB_HOST -U $DB_USER -d $DB_NAME -c 'select version();'
psql -w -h $DB_HOST -U $DB_USER -d $DB_NAME -c 'select current_database();'


