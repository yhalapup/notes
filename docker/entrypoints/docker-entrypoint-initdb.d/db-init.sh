#!/bin/bash

set -eo pipefail

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "CREATE DATABASE IF NOT EXISTS $MYSQL_TEST_DATABASE;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "CREATE USER '$MYSQL_TEST_USER' IDENTIFIED BY '$MYSQL_TEST_PASSWORD';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "create ROLE developer_user;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "grant alter,create,delete,drop,index,insert,select,update,trigger,alter routine,create routine, execute, create temporary tables on $MYSQL_TEST_DATABASE.* to 'developer_user';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "grant 'developer_user' to '$MYSQL_TEST_USER';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "SET DEFAULT ROLE 'developer_user' to '$MYSQL_TEST_USER';"
