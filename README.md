# Syslog-selection

On z/OS:

    - Create dataset (PS) to receive selected messages

             dsname: uid.LOGSEL.PS
             blksz: 27998
             dsorg: PS
             lrecl: 27994
             recfm: VB

On workstation:

    - Create folder to contain bash scripts and download dataset with selection to


3 choices to create selection

1) 'logsel.tso.sh': Starting TSO session & execute rexx to create dataset with selected lines:

On z/OS:

    - Create dataset (PDSE) to contain rexx in member LOGSEL

             dsname: uid.REXX
             blksz: 27998
             dsntp: LIBRARY
             dsorg: PO-E
             lrecl: 255
             recfm: VB

2) 'logsel.job.sh': Submitting job from jcl & rexx on z/OS

On z/OS:

    - Create dataset (PDSE) to contain job in member LOGSEL

             dsname: uid.jcl
             blksz: 27998
             dsntp: LIBRARY
             dsorg: PO-E
             lrecl: 255
             recfm: VB

3) 'logsel.instream.sh': By submitting job from jcl, rexx on workstation (only dataset with selection on z/OS)

On workstation:

    - Create file logsel.instream