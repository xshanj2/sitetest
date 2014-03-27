#!/bin/sh

SCRIPTPATH=`dirname $0`

pdepend --summary-xml=summary.xml --jdepend-chart=jdepend.svg --overview-pyramid=pyramid.svg --ignore=$SCRIPTPATH/../html/rwjmsed/Public/Vendor/PHPExcel,$SCRIPTPATH/../html/rwjmsed/Public/Vendor/fpdf,$SCRIPTPATH/../html/rwjmsed/Public/Vendor/swiftmailer $SCRIPTPATH/../html