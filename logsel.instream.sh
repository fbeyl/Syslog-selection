jobid=$(zowe zos-jobs submit local-file "logsel.instream" --wfo --rff jobid --rft string);
zowe zos-jobs view spool-file-by-id $jobid 103;
zowe zos-files download data-set "Z26544.LOGSEL.PS" -f syslog-selection.txt ;
