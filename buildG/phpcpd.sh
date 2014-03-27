#!/bin/sh

SCRIPTPATH=`dirname $0`

phpcpd html/ --exclude PHPExcel $SCRIPTPATH/../html/rwjmsed/Public/Vendor --exclude fpdf $SCRIPTPATH/../html/rwjmsed/Public/Vendor --exclude swiftmailer $SCRIPTPATH/../html/rwjmsed/Public/Vendor
