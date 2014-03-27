#!/bin/sh

# Run PHP Composer update to make sure we have the latest libraries installed in vendor/
composer install

SCRIPTPATH=`dirname $0`

cd $SCRIPTPATH/../data
propel sql:build
cd ..

# drop and recreate the database
mysql -u root baylor -e 'DROP DATABASE baylor; CREATE DATABASE baylor DEFAULT CHARACTER SET utf8;'

# drop and recreate all database tables
echo "recreating tables"
mysql -u root baylor < $SCRIPTPATH/../data/generated-sql/amp.sql

# insert the bare minimum data required for the system to run (roles, capabilities, admin user, etc.)
echo "inserting base data"
mysql -u root baylor < $SCRIPTPATH/../data/seed-data/00-admins-roles-capabilities.sql

echo "inserting sample university,school,program data"
mysql -u root baylor < $SCRIPTPATH/../data/seed-data/00-university-school-program.sql

echo "inserting sample activity"
mysql -u root baylor < $SCRIPTPATH/../data/seed-data/01-activity.sql

echo "inserting sample users"
mysql -u root baylor < $SCRIPTPATH/../data/seed-data/01-activity-users.sql

echo "inserting sample calendar"
mysql -u root baylor < $SCRIPTPATH/../data/seed-data/01-calendar.sql

echo "inserting sample activity drive"
mysql -u root baylor < $SCRIPTPATH/../data/seed-data/02-activity_drive.sql

echo "inserting sample faculty listing data"
mysql -u root baylor < $SCRIPTPATH/../data/seed-data/03-faculty_listing.sql

# TODO add more seed data here as we build out more AMP modules
