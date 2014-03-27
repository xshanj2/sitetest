#!/bin/sh

SCRIPTPATH=`dirname $0`


# drop and recreate all database tables
mysql -u root baylor < $SCRIPTPATH/../data/generated-sql/amp.sql

# insert a full dataset, as provided by BCM and Rutgers IT (contains sample schools, programs, courses, users, etc.)
mysql -u root baylor < $SCRIPTPATH/../data/generated-sql/data-dump-full.sql
