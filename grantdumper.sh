#!/bin/bash

echo "Type Root User:"
read USER
echo "Please type your password:"
read -s PASSDB
# corremos el dump
mysql -B -N -u$USER -p$PASSDB -e "SELECT DISTINCT CONCAT('SHOW GRANTS FOR ''', user, '''@''', host, ''';') AS query FROM mysql.user" | /usr/bin/mysql -u$USER -p$PASSDB  | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/-- \1 --/;/--/{x;p;x;}' > grants_`date +”%Y%m%d%H%M%S”`.sql
cat /tmp/grants.sql
