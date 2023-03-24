jobid=$(zowe zos-jobs submit data-set "Z26544.JCL(LOGSEL)" --wfo --rff jobid --rft string);
zowe zos-jobs view spool-file-by-id $jobid 102;
zowe zos-files download data-set "Z26544.LOGSEL.PS" -f syslog-selection.txt ;
