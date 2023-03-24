#!/bin/bash
echo "Starting TSO";date +"%T";
sko=$(zowe zos-tso start address-space --sko);
echo "Starting rexx";date +"%T";
zowe zos-tso send address-space $sko --data "ex 'Z26544.TEST.REXX(LOGSEL)'";
echo "Stopping TSO";date +"%T";
zowe zos-tso stop address-space $sko;
echo "Starting download selection";date +"%T";
zowe zos-files download data-set "Z26544.LOGSEL.PS" -f syslog-selection.txt ;
echo "All done";