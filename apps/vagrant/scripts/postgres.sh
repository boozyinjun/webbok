export POSTGRES_VER=12
export POSTGRES_USR=postgres
export POSTGRES_PSW=password
export PGPASSWORD=$POSTGRES_PSW
export APP_DB=db_webbooks
export APP_DB_SCRIPT_LOCATION=/opt/app/src/main/resources/data.sql

curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list

apt update
apt -y install postgresql-$POSTGRES_VER postgresql-client-$POSTGRES_VER

sudo -u postgres psql -c "alter user $POSTGRES_USR with password '$POSTGRES_PSW'"
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '\*'/g" /etc/postgresql/$POSTGRES_VER/main/postgresql.conf
echo -e "host\tall\tall\t0.0.0.0/0\tmd5" >> /etc/postgresql/$POSTGRES_VER/main/pg_hba.conf
systemctl restart postgresql.service

psql -h localhost -U $POSTGRES_USR -c "CREATE DATABASE $APP_DB;"
psql -h localhost -U $POSTGRES_USR $APP_DB < $APP_DB_SCRIPT_LOCATION
