#!/bin/sh

SCRIPTPATH=`dirname $0`

cd $SCRIPTPATH/../data

# run Jason's latest SQL script
mysql -u root baylor < ../sql4update/2014_03_25_full-database-baylor-structure.sql

# generate a propel schema.xml file from that database
propel reverse "mysql:host=localhost;dbname=baylor;user=root;password=" --output-dir=generated-reversed-database

# compare the Pariveda schema.xml with Jason's and manually merge the differences
meld schema.xml generated-reversed-database/schema.xml

#propel sql:build

cd ..

