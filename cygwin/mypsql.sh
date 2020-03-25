!#/bin/sh

/cygdrive/c/Program\ Files/PostgreSQL/11/bin/psql

./psql \
	-h ovpc1-pgsql01.clrygru5fh3l.us-west-2.rds.amazonaws.com \
	-p 5432 \
"dbname=fischer user=testuser sslrootcert=C:/Users/eloy98104/AppData/postgresql/rds-combined-ca-bundle.pem sslmode=verify-full"


