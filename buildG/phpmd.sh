#!/bin/sh

SCRIPTPATH=`dirname $0`

phpmd $SCRIPTPATH/../html/ $SCRIPTPATH/../html codesize --exclude $SCRIPTPATH/../html/rwjmsed/Public/Vendor/PHPExcel,$SCRIPTPATH/../html/rwjmsed/Public/Vendor/fpdf,$SCRIPTPATH/../html/rwjmsed/Public/Vendor/swiftmailer --reportfile phpmd.html
