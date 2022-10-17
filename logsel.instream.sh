jobid=$(zowe zos-jobs submit local-file "logsel.instream" --wfo --rff jobid --rft string);
zowe zos-jobs view spool-file-by-id $jobid 103;
zowe zos-files download data-set "Z40275.LOGSEL.PS" -f syslog-selection.txt ;
