
# https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart

sudo rm /var/lib/dpkg/lock > /dev/null 2>&1
sudo rm /var/lib/dpkg/lock-frontend > /dev/null 2>&1

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt -y --fix-broken install

# sudo apt-get -y install --upgrade pgadmin3
# 3 sucked - I installed 4
# https://www.tecmint.com/install-postgresql-and-pgadmin-in-ubuntu/

# curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
# sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt-get -y install --upgrade pgadmin4
# sudo /usr/pgadmin4/bin/setup-web.sh
sudo apt-get -y install --upgrade postgresql
sudo apt-get -y install --upgrade postgresql-contrib

# https://itsfoss.com/install-postgresql-ubuntu/
apt show postgresql
service postgresql status

# sudo su postgres
# \l
# \du
# q
# ALTER USER postgres WITH PASSWORD 'password';
# CREATE USER gsimpson WITH PASSWORD 'password';
# ALTER USER gsimpson WITH PASSWORD 'password';
# ALTER USER gsimpson WITH SUPERUSER;
# SHOW port;



# gjs postgres config notes here
# sudo -u postgres psql -c "SELECT version();"

# connect thru a bash shell
# sudo -i -u postgres
# psql
#
# To exit out of the PostgreSQL prompt, run the following:
# postgres=# \q
# postgres@server:~$ exit
#
# OR connect directly with
# sudo -u postgres psql
# \q    - to exit
#

# create a new role in postgres
#
# postgres@server:~$ createuser --interactive
# OR the sudo way
# sudo -u postgres createuser --interactive
#  whatever username you create - a default db by that name will be created
#
# this is what worked:
## gsimpson@gsimpson-VBox ~
## $ sudo -u postgres createuser --interactive
## Enter name of role to add: gsimpson
## Shall the new role be a superuser? (y/n) y
# 
## gsimpson@gsimpson-VBox ~
## $ sudo -u postgres createdb gsimpson
# 
## gsimpson@gsimpson-VBox ~
## $ psql
## psql (12.4 (Ubuntu 12.4-0ubuntu0.20.04.1))
## Type "help" for help.
# 
## gsimpson=# \conninfo
## You are connected to database "gsimpson" as user "gsimpson" via socket in 
##  "/var/run/postgresql" at port "5432".
#


####  this stuff did not exactly work
# create a new db
# postgres@server:~$ createdb sammy
# OR the sudo way
# sudo -u postgres createdb sammy
# 

# To log in with ident based authentication, you’ll need a Linux user with the same 
#  name as your Postgres role and database.
# 
# If you don’t have a matching Linux user available, you can create one with the 
#  adduser command. You will have to do this from your non-root account with sudo
#   privileges (meaning, not logged in as the postgres user):
# 
# sudo adduser sammy
# 

# Once this new account is available, you can either switch over and
#  connect to the database by typing:
#
# sudo -i -u sammy
# psql
#
# OR the sudo way
# sudo -u sammy psql
# 

# If you want your user to connect to a different database, you can do so by 
#  specifying the database like this:
# 
# psql -d postgres
#
# Once logged in, you can get check your current connection information by typing:
# 
# sammy=# \conninfo
#

pgadmin3 & #  crashes a lot
psql



sudo apt -y --fix-broken install
sudo apt -y autoremove
#sudo apt list --upgradeable
