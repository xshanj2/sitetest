#!/bin/sh

# Run PHP Composer update to make sure we have the latest libraries installed in vendor/
/usr/local/bin/composer install

AMP_ENVIRONMENT=dev
SCRIPTPATH=`dirname $0`

cd $SCRIPTPATH/..

# environment-specific config files
cp ./conf/$AMP_ENVIRONMENT/db_host.php ./config/
cp ./conf/$AMP_ENVIRONMENT/website_url.php ./config/
cp ./conf/$AMP_ENVIRONMENT/debug.php ./config/
cp ./conf/$AMP_ENVIRONMENT/real_server_name.php ./config/

# uploaded files folder
mkdir -p html/rwjmsed/upfiles
chmod 777 html/rwjmsed/upfiles

# cache folder
mkdir -p html/rwjmsed/Public/Cache
chmod 777 html/rwjmsed/Public/Cache

# temp folder
mkdir -p html/rwjmsed/temp
chmod 777 html/rwjmsed/temp

# environment config files - apache, php, mysql, etc.
cp ./conf/$AMP_ENVIRONMENT/php.ini /etc/php.ini
cp ./conf/$AMP_ENVIRONMENT/my.cnf /etc/my.cnf
cp ./conf/$AMP_ENVIRONMENT/hosts /etc/hosts
cp ./conf/$AMP_ENVIRONMENT/httpd.conf /etc/httpd/conf/

# restart services - having trouble getting jenkins to do this properly
service httpd restart
service mysqld restart
