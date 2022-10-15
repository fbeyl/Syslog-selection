# Syslog-selection

On z/OS: - Create dataset (PDSE) to contain rexx in member LOGSEL
             dsname: ... uid ....TEST.REXX
             blksz: 27998
             dsntp: LIBRARY
             dsorg: PO-E
             lrecl: 255
             recfm: VB
         - Create dataset (PS) to receive selected messages
             dsname: ... uid ....LOGSEL.PS
             blksz: 27998
             dsorg: PS
             lrecl: 27994
             recfm: VB
On workstation: - Create folder to contain bash script logsel.sh and to download selection to
