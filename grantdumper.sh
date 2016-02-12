#!/bin/bash

echo "Type Root User:"
read USER
echo "Please type your password:"
read -s PASSDB
https://copr-be.cloud.fedoraproject.org/results/bpereto/epel7/epel-7-x86_64/00156997-mydumper/mydumper-0.9.1-1.el7.centos.x86_64.rpm
# corremos el dump
mysql -B -N -u$USER -p$PASSDB -e "SELECT DISTINCT CONCAT('SHOW GRANTS FOR ''', user, '''@''', host, ''';') AS query FROM mysql.user" | /usr/bin/mysql -u$USER -p$PASSDB  | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/-- \1 --/;/--/{x;p;x;}' > /tmp/grants.sql
cat /tmp/grants.sql
