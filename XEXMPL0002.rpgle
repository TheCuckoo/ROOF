     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*NEW)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO:*SHOWCPY)
     H BNDDIR('QC2LE')
     H BNDDIR('SRVTHRCTCH')
     H COPYRIGHT('(c) 2016 Ray Gillies-Jones. All rights reserved.')
      * 
      * Copyright details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      * 
      * 
      * Examples to show the use of Throw and Catch
      * 
      * 
      * --------------------------------------------------------------------------------------------
      * Procedures
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      * 
      * --------------------------------------------------------------------------------------------
      * Demonstrate Example
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Demonstrate     PR
     D  Example                      10I 0 CONST
      * 
      * --------------------------------------------------------------------------------------------
      * Catch unhandled program escape message
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Catch...
     D                 PR              N
     D  MsgId                         7A   VALUE VARYING
     D                                     OPTIONS(*NOPASS:*TRIM)
     D  MsgDta                      256A   VALUE VARYING OPTIONS(*NOPASS)
      * 
      * --------------------------------------------------------------------------------------------
      * Throw program escape message
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Throw...
     D                 PR
     D  oMsgDta                     512A   VARYING CONST OPTIONS(*NOPASS)
     D  oMsgId                        7A   CONST OPTIONS(*NOPASS:*OMIT)
     D  oMsgFil                      10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  oMsgLib                      10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  oStkCnt                      10I 0 CONST OPTIONS(*NOPASS:*OMIT)
      * 
      * Loop Counter
     D j               S             10I 0
      * 
      * Press Enter to continue after messages
     D PressEnter      S              1A
      * 
      /free

         // Demonstrate 3 different situations
            FOR j= 1 TO 3 ;

            // Watch for errors
               MONITOR ;

                  Demonstrate(j) ;

            // Bring all errors here
               ON-ERROR ;

               // Decide if the error should be handled
                  SELECT ;

               // Specifically Catch MCH1211 - Divide by zero
                  WHEN Catch('MCH1211') ;
                     DSPLY 'Divide by zero' '*EXT' PressEnter ;

               // Specifically Catch CPF9897 "Failed!"
                  WHEN Catch('CPF9897':'Failed!') ;
                     DSPLY '"Failed!"' '*EXT' PressEnter ;

               // All other messages are passed back to the caller
                  OTHER ;
                     DSPLY 'About to Throw() to caller' '*EXT' PressEnter ;
                     Throw() ;
                  ENDSL ;

               ENDMON ;

         // Next example
            ENDFOR ;

         // Finished
            *INLR= *ON ;
            RETURN ;

      /end-free
      * 
      * --------------------------------------------------------------------------------------------
      * Demonstrate Example
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Demonstrate...
     P                 B
     D                 PI
     D  Example                      10I 0 CONST
      * 
     D x               S             10I 0
      * 
      /free

            SELECT ;

         // Divide by zero
            WHEN (Example = 1) ;
               x= 42/%Int('0') ;

         // Custom error
            WHEN (Example = 2) ;
               Throw('Failed!') ;

         // Some other error
            WHEN (Example = 3) ;
               Throw('Some other error') ;

            ENDSL ;

      /end-free
     P                 E
      * 
