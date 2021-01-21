#!/bin/bash

version="10"
sed -e 's/peer/trust/g' /etc/postgresql/$version/main/pg_hba.conf > a.txt
cat a.txt > /etc/postgresql/$version/main/pg_hba.conf && rm a.txt
service postgresql restart
# sudo service postgresql start
psql -U postgres -c 'create role bigclonebench;'
psql -U postgres -c 'create role postgresql;'
psql -U postgres -c "CREATE USER cclearner with PASSWORD 'cclearner';"
psql -U postgres -c "ALTER ROLE cclearner Superuser;"
psql -U postgres < /home/cclearner/data/era_bigclonebench.sql

sed -e 's/trust/peer/g' /etc/postgresql/$version/main/pg_hba.conf > a.txt
cat a.txt > /etc/postgresql/$version/main/pg_hba.conf && rm a.txt
service postgresql restart