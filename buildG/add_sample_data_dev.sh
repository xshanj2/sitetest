#!/bin/sh

SCRIPTPATH=`dirname $0`


# insert sample university, school, program, and eventually course data into dev database
mysql -u root baylor < $SCRIPTPATH/../data/generated-sql/sample-data.sql
