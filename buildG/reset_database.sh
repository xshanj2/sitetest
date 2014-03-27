# comment by 24kcer...
#!/bin/sh

SCRIPTPATH=`dirname $0`

# drop and recreate the database
mysql -u root baylor -e 'DROP DATABASE baylor; CREATE DATABASE baylor DEFAULT CHARACTER SET utf8;'

# drop and recreate all database tables
echo "recreating tables"
mysql -u root baylor < $SCRIPTPATH/../data/generated-sql/amp.sql
