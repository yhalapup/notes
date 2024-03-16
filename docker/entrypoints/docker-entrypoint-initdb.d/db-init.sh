#!/bin/bash

set -eo pipefail

mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "CREATE DATABASE IF NOT EXISTS $MYSQL_TEST_DATABASE;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "CREATE USER 'notes_test_user' IDENTIFIED BY 'notes_test_password';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "create ROLE developer_user;"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "grant alter,create,delete,drop,index,insert,select,update,trigger,alter routine,create routine, execute, create temporary tables on notes_test_db.* to 'developer_user';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "grant 'developer_user' to 'notes_test_user';"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e  "SET DEFAULT ROLE 'developer_user' to 'notes_test_user';"
