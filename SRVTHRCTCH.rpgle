     H NOMAIN
     H DATFMT(*ISO)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO:*SHOWCPY)
     H CCSID(*CHAR:*JOBRUN)
     H BNDDIR('QC2LE')
      * 
      * --------------------------------------------------------------------------------------------
      * Structures
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      * 
      * Structre to hold 'last caught' message information
     D Caught          DS                  QUALIFIED EXPORT
     D  Severity                     10I 0
     D  ID                            7A
     D  Type                          2A
     D  Key                           4A
     D  File                         10A
     D  Library1                     10A
     D  Library2                     10A
     D  Alert                         9A
     D  CCSIDFlag1                   10I 0
     D  CCSIDFlag2                   10I 0
     D  CCSID1                       10I 0
     D  CCSID2                       10I 0
     D  DataRet                      10I 0
     D  DataAvl                      10I 0
     D  MsgRet                       10I 0
     D  MsgAvl                       10I 0
     D  HlpRet                       10I 0
     D  HlpAvl                       10I 0
     D  SndRet                       10I 0
     D  SndAvl                       10I 0
     D  MsgTxtFmt                  1024A   VARYING
      * 
      * --------------------------------------------------------------------------------------------
      * API: Allocate Automatic Storage API
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D QAllocateAuto...
     D                 PR              *   EXTPROC('_MODASA')
     D  Size                         10U 0 VALUE
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
      * --------------------------------------------------------------------------------------------
      * Constants
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D true            C                   CONST(*ON)
     D false           C                   CONST(*OFF)
     D null            C                   CONST(*NULL)
      * 
      * --------------------------------------------------------------------------------------------
      * Catch unhandled program escape message
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Catch...
     P                 B                   EXPORT
     D                 PI              N
     D  oMsgId                        7A   VALUE VARYING
     D                                     OPTIONS(*NOPASS:*TRIM)
     D  oMsgDta                     256A   VALUE VARYING OPTIONS(*NOPASS)
      * 
     D QooRcvPgmMsg...
     D                 PR                  EXTPGM('QMHRCVPM')
     D  MsgInfo                       1A
     D  MsgInfoLen                   10I 0 CONST
     D  FmtNam                        8A   CONST
     D  Stk                          10A   CONST
     D  StkCnt                       10I 0 CONST
     D  Type                         10A   CONST
     D  MsgKey                        4A   CONST
     D  WaitTime                     10I 0 CONST
     D  Action                       10A   CONST
     D  ErrorCode                     8A
      * 
     D @Info           S               *
     D Info            DS                  QUALIFIED BASED(@Info)
     D  BytesRet                     10I 0
     D  BytesAvl                     10I 0
     D  Severity                     10I 0
     D  ID                            7A
     D  Type                          2A
     D  Key                           4A
     D  File                         10A
     D  Library1                     10A
     D  Library2                     10A
     D  Alert                         9A
     D  CCSIDFlag1                   10I 0
     D  CCSIDFlag2                   10I 0
     D  CCSID1                       10I 0
     D  CCSID2                       10I 0
     D  DataRet                      10I 0
     D  DataAvl                      10I 0
     D  MsgRet                       10I 0
     D  MsgAvl                       10I 0
     D  HlpRet                       10I 0
     D  HlpAvl                       10I 0
     D  SndRet                       10I 0
     D  SndAvl                       10I 0
      * 
     D Size            S             10I 0
      * 
     D QooErrorNull...
     D                 DS                  QUALIFIED
     D  BytesProv                    10I 0 INZ(0)
     D  BytesAvail                   10I 0 INZ(0)
      * 
     D QooRtvMsg...
     D                 PR                  EXTPGM('QMHRTVM')
     D  MsgInfo                       1A
     D  MsgInfoLen                   10I 0 CONST
     D  FmtNam                        8A   CONST
     D  MsgId                         7A   CONST
     D  MsgFilLib                    20A   CONST
     D  RplDta                        1A   CONST
     D  RplDtaLen                    10I 0 CONST
     D  RplOpt                       10A   CONST
     D  RtnFmtCtl                    10A   CONST
     D  ErrorCode                     8A
      * 
     D @RplDta         S               *
     D RplDta          S              1A   BASED(@RplDta)
      * 
     D RtvInfoSize     S             10I 0
     D @RtvInfo        S               *
     D RtvInfo         DS                  QUALIFIED BASED(@RtvInfo)
     D  BytesRet                     10I 0
     D  BytesAvl                     10I 0
     D  MsgLenRet                    10I 0
     D  MsgLenAvl                    10I 0
     D  HlpLenRet                    10I 0
     D  HlpLenAvl                    10I 0
      * 
     D @MessageText    S               *
     D MessageText     S          32767A   BASED(@MessageText)
      * 
      /free

         // Make some space for the info block
            Size= %Size(Info)+8 ;
            @Info= QAllocateAuto(Size) ;

         // Pick up outstanding message, if any
            QooRcvPgmMsg(Info:Size:
              'RCVM0300':'*':1:'*ESCAPE':'    ':0:'*SAME':QooErrorNull) ;

         // Compare message ID against parameters to see if they match
            EXSR CompareMessageId ;

         // Make sure there is enough room for everything we want
            Size= %Size(Info)+Info.BytesAvl+Info.MsgAvl ;
            @Info= QAllocateAuto(Size) ;

         // Fetch all available data
            QooRcvPgmMsg(Info:Size:
              'RCVM0300':'*':1:'*ESCAPE':'    ':0:'*SAME':QooErrorNull) ;

         // Point at replacement data
            @RplDta= @Info+%Size(Info) ;

         // Set up retreval information block
            RtvInfoSize= %Size(RtvInfo) ;
            @RtvInfo= QAllocateAuto(RtvInfoSize) ;

         // Retrieve information about formatted message
            QooRtvMsg(RtvInfo:RtvInfoSize:
              'RTVM0100':Info.Id:Info.File+Info.Library2:
              RplDta:Info.DataAvl:'*YES':'*YES':QooErrorNull) ;

         // Resize info area to make enough room for formatted message
            RtvInfoSize= RtvInfo.BytesAvl ;
            @RtvInfo= QAllocateAuto(RtvInfoSize) ;

         // Retrieve a formatted version of the message text
            QooRtvMsg(RtvInfo:RtvInfoSize:
              'RTVM0100':Info.Id:Info.File+Info.Library2:
              RplDta:Info.DataAvl:'*YES':'*YES':QooErrorNull) ;

         // Point at message text
            @MessageText= @RtvInfo+%Size(RtvInfo) ;

         // Compare message text against parameters to see if they match
            EXSR CompareMessageText ;

         // Receive message and mark it as handled
            QooRcvPgmMsg(Info:Size:
              'RCVM0300':'*':1:'*ESCAPE':'    ':0:
              '*REMOVE':QooErrorNull);

         // Clear out the 'Caught' message data structure
            CLEAR Caught ;

         // Copy info fields
            EVAL-CORR Caught= Info ;
            IF (RtvInfo.MsgLenRet > (%Size(Caught.MsgTxtFmt)-2)) ;
               Caught.MsgTxtFmt= MessageText ;
            ELSE ;
               Caught.MsgTxtFmt= %SubSt(MessageText:1:RtvInfo.MsgLenRet) ;
            ENDIF ;

         // Finished
            RETURN true ;

         // ----------------------------------------------------------------------------------------
         // Compare Message ID to see if it matches
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CompareMessageID ;

         // Match Message Id value
            SELECT ;

         // Accept all if no message parameter supplied
            WHEN (%Parms() = 0) ;

         // Also accept special value *ALL or blanks
            WHEN (oMsgId = '*ALL') OR (oMsgId = '') ;

         // Match against supplied length
            WHEN (%SubSt(Info.Id:1:%Len(oMsgId)) = oMsgId) ;

         // Doesnt match, so do not handle it
            OTHER ;
               RETURN false ;
            ENDSL ;

         // Finished
            ENDSR ;

         // ----------------------------------------------------------------------------------------
         // Compare Message Text to see if it matches
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CompareMessageText ;

            // Match Message Data value
               SELECT ;

            // Accept all if no message data parameter supplied
               WHEN (%Parms() <= 1) ;

            // Also accept blanks
               WHEN (oMsgDta = '') ;

            // Match against supplied length
               WHEN (%SubSt(MessageText:1:%Len(oMsgDta)) = oMsgDta) ;

            // Doesnt match, so do not handle it
               OTHER ;
                  RETURN false ;
               ENDSL ;

         // Finished
            ENDSR ;

      /end-free
      * 
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Throw program escape message
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Throw...
     P                 B                   EXPORT
     D                 PI
     D  oMsgDta                     512A   VARYING CONST OPTIONS(*NOPASS)
     D  oMsgId                        7A   CONST OPTIONS(*NOPASS:*OMIT)
     D  oMsgFil                      10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  oMsgLib                      10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  oStkCnt                      10I 0 CONST OPTIONS(*NOPASS:*OMIT)
      * 
      * Messaging control fields
     D MsgID           S              7A   INZ('CPF9897')
     D MsgFileLib      S             20A   INZ('QCPFMSG   *LIBL')
     D MsgDta          S            512A
     D MsgDtaLen       S             10I 0 INZ(0)
     D MsgType         S             10A   INZ('*ESCAPE')
     D MsgStk          S             10A   INZ('*')
     D MsgStkCnt       S             10I 0 INZ(1)
     D MsgKey          S              4A   INZ(*BLANKS)
      * 
      * Send Program Message API
     D QooSndPgmMsg    PR                  EXTPGM('QMHSNDPM')
     D  MsgID                         7A
     D  MsgFile                      20A
     D  MsgDta                        1A
     D  MsgDtaLen                    10I 0
     D  MsgType                      10A
     D  MsgStk                       10A
     D  MsgStkCnt                    10I 0
     D  MsgKey                        4A
     D  MsgErr                        8A   OPTIONS(*VARSIZE)
      * 
      * Move Program Message API
     D QooMovPgmMsg...
     D                 PR                  EXTPGM('QMHMOVPM')
     D  MsgKey                        4A   CONST
     D  MsgTypes                     10A   DIM(4) OPTIONS(*VARSIZE)
     D                                     CONST
     D  NumMsgTypes                  10I 0 CONST
     D  ToStack                      10A   CONST
     D  ToStackCnt                   10I 0 CONST
     D  ErrorCode                     8A   OPTIONS(*VARSIZE)
      * 
      * Null error structure
     D QooErrorNull...
     D                 DS                  QUALIFIED
     D  BytesProv                    10I 0 INZ(0)
     D  BytesAvail                   10I 0 INZ(0)
      * 
      * Retrieve Call Stack API
     D QooRtvCallStk   PR                  EXTPGM('QWVRCSTK')
     D  Info                        256A   OPTIONS(*VARSIZE)
     D  InfoLen                      10I 0
     D  Format1                       8A
     D  JobInfo                      56A
     D  Format2                       8A
     D  Error                         8A   OPTIONS(*VARSIZE)
      * 
      *  Call Stack Job Information Structure
     D JobIdInf        DS                  QUALIFIED
     D  QName                        26A   INZ('*')
     D  IntID                        16A
     D                                2A   INZ(*LOVAL)
     D  ThreadInd                    10I 0 INZ(1)
     D  Thread                        8A   INZ(*LOVAL)
      * 
      *  Call Stack Data
     D @Info           S               *
     D Info            DS                  QUALIFIED BASED(@Info)
     D  BytRtn                       10I 0
     D  BytAvl                       10I 0
     D  EntriesInThrd                10I 0
     D  EntryOffset                  10I 0
     D  EntryCount                   10I 0
     D  ThreadID                      8A
     D  Status                        1A
      * 
      * Call Stack Entry Structure
     D @Entry          S               *
     D Entry           DS                  QUALIFIED BASED(@Entry)
     D  Length                       10I 0
     D  StmtOffSet                   10I 0
     D  StmtCount                    10I 0
     D  PrcNamOff                    10I 0
     D  PrcNamLen                    10I 0
     D  RqsLvl                       10I 0
     D  PgmNam                       10A
     D  PgmLib                       10A
     D  MIInsNum                     10I 0
     D  ModNam                       10A
     D  ModLib                       10A
     D  CtlBdy                        1A
     D                                3A
     D  ActGrpNum                    10U 0
     D  ActGrp                       10A
     D                                2A
     D  PgmAspNam                    10A
     D  PgmAspLib                    10A
     D  PgmAspNum                    10I 0
     D  PgmAspLibNum                 10I 0
     D  ActGrpNumLng                 20U 0
      * 
      * Call Stack Procedure Name
     D @ProcName       S               *
     D ProcName        S            126A   BASED(@ProcName)
     D PepMarker       S             10A
      * 
     D Size            S             10I 0
      * 
     D j               S             10I 0
     D CountBack       S             10I 0
      * 
     D CSTK0100        S              8A   INZ('CSTK0100')
     D JIDF0100        S              8A   INZ('JIDF0100')
      * 
      * Prototype for call to resend api
     D QooResErrMsg...
     D                 PR                  EXTPGM('QMHRSNEM')
     D  MsgKey                        4A   CONST
     D  ErrorCode                     8A   OPTIONS(*VARSIZE)
     D  ToStk                        38A   OPTIONS(*VARSIZE)
     D  ToStkLen                     10I 0 CONST
     D  ToStkFmt                      8A   CONST
     D  FrmStk                       16A   CONST
     D  FrmStkCnt                    10I 0 CONST
      * 
     D RSNM0100        S              8A   INZ('RSNM0100')
      * 
     D ToCallStk       DS                  QUALIFIED
     D  StkCnt                       10I 0
     D  Qual                         20A   INZ('*NONE     *NONE     ')
     D  IdLen                        10I 0 INZ(10)
     D  Id                           10A   INZ('*')
      * 
      /free

         // Make some space for the info block
            Size= %Size(Info)+8 ;
            @Info= QAllocateAuto(Size) ;

         // Fetch call stack info for correct sizing details
            QooRtvCallStk(Info:Size:
              CSTK0100:JobIdInf:JIDF0100:QooErrorNull) ;

         // Make sure there is enough room for everything we want
            Size= %Size(Info)+Info.BytAvl ;
            @Info= QAllocateAuto(Size) ;

         // Fetch all available call stack information
            QooRtvCallStk(Info:Size:
              CSTK0100:JobIdInf:JIDF0100:QooErrorNull) ;

         // Decide which level to send the message to
            SELECT ;

         // User specified level
            WHEN (%Parms() >= 5) AND (%Addr(oStkCnt) <> null) ;
               CountBack= %Abs(oStkCnt) ;

         // Throw() used, so back two levels
            WHEN (%Parms() = 0) ;
               CountBack= 2 ;

         // Default is back two levels
            OTHER ;
               CountBack= 2 ;
            ENDSL ;

         // Exceeded stack depth
            IF (CountBack > Info.EntryCount) ;
               EXSR BeyondStackDepth ;
            ENDIF ;

         // This is the actual number of call levels to correct for
            MsgStkCnt= 0 ;

         // Point at first entry
            @Entry= @Info+Info.EntryOffset ;

         // Loop back through call levels
            DOW (CountBack > 0) ;

            // Adjust counters
               MsgStkCnt+= 1 ;
               CountBack-= 1 ;

            // Point at procedure name
               @ProcName= @Entry+Entry.PrcNamOff ;
               PepMarker= ProcName ;

            // Decide what to do
               SELECT ;

            // Exceeded stack depth
               WHEN (MsgStkCnt > Info.EntryCount) ;
                  EXSR BeyondStackDepth ;

            // Ignore Program Entry Procedures
               WHEN (PepMarker = '_QRNP_PEP_') ;
                  CountBack+= 1 ;

            // Correct level has been found
               WHEN (CountBack = 0) ;
                  LEAVE ;
               ENDSL ;

            // Point at next entry
               @Entry= @Entry+Entry.Length ;

            ENDDO ;

         // No parameters, so resend any unhandled exception message
            IF (%Parms() = 0)
               OR ((%Parms() = 1) AND (oMsgDta = '')) ;
               EXSR Resend ;
            ENDIF ;

         // Message data
            IF (%Parms() >= 1) AND (%Addr(oMsgDta) <> null) ;
               MsgDta= oMsgDta ;
               MsgDtaLen= %Len(oMsgDta) ;
            ENDIF ;

         // Message Id
            IF (%Parms() >= 2) AND (%Addr(oMsgId) <> null) ;
               MsgId= oMsgId ;
            ENDIF ;

         // Message File
            IF (%Parms() >= 3) AND (%Addr(oMsgFil) <> null) ;
               %SubSt(MsgFileLib:1:10)= oMsgFil ;
            ENDIF ;

         // Message Library
            IF (%Parms() >= 4) AND (%Addr(oMsgLib) <> null) ;
               %SubSt(MsgFileLib:11:10)= oMsgLib ;
            ENDIF ;

         // Call the API to send the message
            QooSndPgmMsg(
              MsgId:MsgFileLib:MsgDta:MsgDtaLen:
              MsgType:MsgStk:MsgStkCnt:MsgKey:QooErrorNull) ;

         // Finished
            RETURN ;

         // ----------------------------------------------------------------------------------------
         // Resend unhandled escape message
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Resend ;

            // Move outstanding diagnostic messages
               QooMovPgmMsg(' ':'*DIAG':1:'*':MsgStkCnt:QooErrorNull) ;

            // Set 'to' call stack count
               ToCallStk.StkCnt= MsgStkCnt ;

            // Detect any errors
               MONITOR ;

               // Resend error messages
                  QooResErrMsg(' ':QooErrorNull:
                     ToCallStk:%Size(ToCallStk):RSNM0100:
                     '*':1) ;

               // Finished
                  RETURN ;

               ON-ERROR ;
               ENDMON ;

         // Signal that Throw() failed
            MsgId= 'DLL0002' ;
            MsgFileLib= 'DLLMSGF   *LIBL' ;

         // Finished
            ENDSR ;

         // ----------------------------------------------------------------------------------------
         // Beyond Stack Depth
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR BeyondStackDepth ;

            // Signal that Throw() failed
               MsgId= 'DLL0003' ;
               MsgFileLib= 'DLLMSGF   *LIBL' ;
               MsgStkCnt= 1 ;

            // Call the API to send the message
               QooSndPgmMsg(
                 MsgId:MsgFileLib:MsgDta:MsgDtaLen:
                 MsgType:MsgStk:MsgStkCnt:MsgKey:QooErrorNull) ;

         // Finished
            ENDSR ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
