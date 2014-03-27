#!/bin/sh

SCRIPTPATH=`dirname $0`

phpcs --report=checkstyle --report-file=checkstyle.xml $SCRIPTPATH/../html/rwjmsed