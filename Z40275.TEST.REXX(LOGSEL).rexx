/* REXX */

rc=isfcalls('ON')
"ALLOC DA('Z40275.LOGSEL.PS') F(OUTDD) OLD REUSE"
"EXECIO 0 DISKW outdd (OPEN FINIS"           /*Empty the outdd file           */
Address SDSF "ISFLOG ALLOC TYPE(SYSLOG)"
eof = 'NO'                                   /* Initialize end-of-file flag   */
select_count = 0                             /* Initialize counter            */
DO WHILE eof = 'NO'                          /* Loop until the EOF of syslog  */
  "EXECIO 1 DISKR" isfddname.1 "(STEM LINE."
                                             /* Read a line                   */
  IF RC = 2 THEN                             /* If end of file is reached,    */
    eof = 'YES'                              /* set the end-of-file flag      */
  ELSE                                       /* Otherwise, a record is read   */
    DO
      IF (SUBSTR(line.1,38,3)='JOB'),
       & ((SUBSTR(line.1,57,8)='$HASP373') |,
          (SUBSTR(line.1,57,8)='$HASP395')) THEN
        DO                                   /* Message found                 */
          "EXECIO 1 DISKW OUTDD (STEM LINE."
                                             /* Write record to file          */
          select_count = select_count + 1
                                             /* Increment "selected counter   */
        END
    END
END
"EXECIO 0 DISKW OUTDD (FINIS"  /* Close OUTDD file if file is cur-
                                  rently open.  If the OUTDD file is
                                  not open, the EXECIO command has
                                  no effect.                         */
"FREE F(OUTDD)"
RC = ISFCALLS("OFF") /* Delete SDSF host command environment */
say '{"Dataset":"Z40275.LOGSEL.PS","Records":"' select_count '"}'
return


     /*************************************/
     /* Subroutine to list error messages */
     /*************************************/
msgrtn: procedure expose isfmsg.

     /************************************************/
     /* The isfmsg variable contains a short message */
     /************************************************/
if isfmsg <> "" then
  Say '{"Message":"isfmsg is:'||isfmsg||'"}'
return
