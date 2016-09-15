     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO:*SHOWCPY)
     H BNDDIR('QC2LE')
     H COPYRIGHT('(c) 2016 Ray Gillies-Jones. All rights reserved.')
      * 
      * Copyright details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      * 
      * Bit Twiddling: https://graphics.stanford.edu/~seander/bithacks.html
      *                Henry Gordon Dietz, University of Kentucky
      *                http://aggregate.org/MAGIC/
      * 
      * --------------------------------------------------------------------------------------------
      * Structures
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      * 
      * ProcedureIndex Signature
     D ProcedureIndexSignature...
     D                 C                   x'-
     D                                     4460329BE5E0086A-
     D                                     F9BFB56A9071613E'
      * 
      * ProcedureIndex Data Structure
     D ProcedureIndex_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  @Prcs                          *
     D  @Cache                         *
      * 
     D PrcIdxEntry_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      * 
      * --------------------------------------------------------------------------------------------
      * Procedures
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      * 
      * Copy in required prototypes
     D/COPY RAYLIB/QDLLSRCV20,CPYZINDEX1
     D/COPY RAYLIB/QDLLSRCV20,CPYTMPCCH1
      * 
      * --------------------------------------------------------------------------------------------
      * API: Allocate Automatic Storage API
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_AllocateAuto...
     D                 PR              *   EXTPROC('_MODASA')
     D  Size                         10U 0 VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * Perform a Binary Search on a Sorted Array
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_BinarySearch...
     D                 PR              N
     D  @Search                        *   CONST
     D  @Data                          *   CONST
     D  ArraySize                    10I 0 CONST
     D  ElementSize                  10I 0 CONST
     D  @Compare                       *   PROCPTR CONST
     D  @Element                       *
     D  FoundIndex                   10I 0
      * 
      * --------------------------------------------------------------------------------------------
      * API: Binary Search on a Sorted Array
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_BSearch...
     D                 PR              *   EXTPROC('bsearch')
     D  @Search                        *   VALUE
     D  @Data                          *   VALUE
     D  ArraySize                    10U 0 VALUE
     D  ElementSize                  10U 0 VALUE
     D  @Compare                       *   PROCPTR VALUE
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
      * API: Cipher
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_Cipher...
     D                 PR                  EXTPROC('_CIPHER')
     D  Receiver                       *   VALUE
     D  Controls                       *   VALUE
     D  Source                         *   VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * Combine Hash Value
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CombineHash...
     D                 PR            10I 0
     D  Result                       10I 0
     D  @Data                          *   CONST
     D  Length                       10U 0 CONST
      * 
      * --------------------------------------------------------------------------------------------
      * Convert To ASCII
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtToASCII...
     D                 PR
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * Convert To Base64
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtToBase64...
     D                 PR              N
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D oCodes                         2A   CONST OPTIONS(*NOPASS)
      * 
      * --------------------------------------------------------------------------------------------
      * Convert To EBCDIC
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtToEBCDIC...
     D                 PR
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * Generate Random Signature
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_GenSignature...
     D                 PR            16A
      * 
      * --------------------------------------------------------------------------------------------
      * Copy with pad
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemCpyPad...
     D                 PR
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  Pad                           1A   VALUE OPTIONS(*NOPASS)
      * 
      * --------------------------------------------------------------------------------------------
      * API: Copy memory block
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemCpy...
     D                 PR              *   EXTPROC('_MEMMOVE')
     D  Target                         *   VALUE
     D  Source                         *   VALUE
     D  Length                       10U 0 VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * API: Set contents of memory block
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemSet...
     D                 PR              *   EXTPROC('__memset')
     D  Target                         *   VALUE
     D  Char                          3U 0 VALUE
     D  Length                       10U 0 VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * Include
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Include...
     D                 PR
     D  Template                      1A   OPTIONS(*VARSIZE)
     D  @SubClass                      *   CONST OPTIONS(*NOPASS)
      * 
      * --------------------------------------------------------------------------------------------
      * Produce MD5 Hash
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MD5Hash...
     D                 PR            16A
     D  @Source                        *   VALUE
     D  Size                         10U 0 VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * Next Higher Power Of Two
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_NextHigherPowerOfTwo...
     D                 PR            20I 0
     D  Input1                       20I 0 VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndexEntry: Compare entries
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D PrcIdxEntryCompare...
     D                 PR            10I 0
     D  @PrcIdxEntry                   *   CONST
     D  @PrcIdxEntry                   *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndexEntry: Delete
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D PrcIdxEntryDlt...
     D                 PR
     D  @                              *   VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Create
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexCrt...
     D                 PR              *
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Delete
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexDlt...
     D                 PR              *
     D  @                              *
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Add
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexAdd...
     D                 PR
     D  @this                          *   CONST
     D  Name                        126A   VARYING CONST
     D  @Addr                          *   PROCPTR CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Retrieve
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexRtv...
     D                 PR              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Link
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexLink...
     D                 PR
     D  @this                          *   CONST
     D  @Template                      *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * Random Bit Stream
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_RandomBitStream...
     D                 PR
     D  @Buffer                        *   CONST
     D  Size                         10I 0 CONST
      * 
      * --------------------------------------------------------------------------------------------
      * Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_SignatureCheck...
     D                 PR              *
     D  @Pointer                       *   CONST
     D  Signature                    16A   CONST
     D  Type                        126A   VARYING CONST
      * 
      * --------------------------------------------------------------------------------------------
      * Template Name
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateName...
     D                 PR           126A   VARYING
     D  @Template                      *   CONST
      * 
     D @TemplateName   S               *   PROCPTR
     D                                     INZ(%pAddr(TemplateName))
      * 
     D Utility_TemplateName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@TemplateName)
     D  @Template                      *   CONST
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
      * Constants and Work Fields
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D false           C                   CONST(*OFF)
     D true            C                   CONST(*ON)
     D null            C                   CONST(*NULL)
      * 
      * Package Signature
     D PackageSignature...
     D                 C                   CONST(x'-
     D                                     CFDA4FB22C2FD0AE-
     D                                     6DAAD0F46D0F7BBF')
      * 
      * Template Signature
     D TemplateSignature...
     D                 C                   CONST(x'-
     D                                     A7569D265BDE4B49-
     D                                     5EB2B2E466CF1B79')
      * 
      * Package Signature
     D PackageSignatureInz...
     D                 C                   CONST(x'-
     D                                     707A4C59A4D19F49-
     D                                     C97E3B44A052E27E')
      * 
      * Template Signature - Initialised
     D TemplateSignatureInz...
     D                 C                   CONST(x'-
     D                                     B1A7644C221D0C01-
     D                                     7CA3517124F00148')
      * 
     D @PrcIdx         S               *
      * 
      * Structre to hold 'last caught' message information
     D Caught          DS                  QUALIFIED
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
      * *ENTRY PLIST Parameters
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('DLLUTILV20')
     D  Template                      1A   OPTIONS(*VARSIZE)
      * 
     D Main            PI
     D  Template                      1A   OPTIONS(*VARSIZE)
      * 
      * --------------------------------------------------------------------------------------------
      * Start of executable
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      /free

         // This program uses automatic initialisation
         // EXSR *INZSR ;

         // Decide what to do
            SELECT ;

         // Utility
            WHEN (TemplateName(%Addr(Template)) = 'UtilityV20') ;
               ProcedureIndexLink(@PrcIdx:%Addr(Template)) ;

         // Unknown name
            OTHER ;
               Throw('Unrecognised name: '+TemplateName(%Addr(Template))) ;
            ENDSL ;


         // Finished
            RETURN ;

         // ----------------------------------------------------------------------------------------
         // Automatic Initialisation
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR *INZSR ;

         // Create a procedure index
            @PrcIdx= ProcedureIndexCrt() ;

            ProcedureIndexAdd(@PrcIdx:
                   '_BinarySearch':
              %pAddr(Utility_BinarySearch)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_Catch':
              %pAddr(Catch)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_CombineHash':
              %pAddr(Utility_CombineHash)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_CvtToASCII':
              %pAddr(Utility_CvtToASCII)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_CvtToBase64':
              %pAddr(Utility_CvtToBase64)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_CvtToEBCDIC':
              %pAddr(Utility_CvtToEBCDIC)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_GenSignature':
              %pAddr(Utility_GenSignature)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_MemCpyPad':
              %pAddr(Utility_MemCpyPad)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_MD5Hash':
              %pAddr(Utility_MD5Hash)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_NextHigherPowerOfTwo':
              %pAddr(Utility_NextHigherPowerOfTwo)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_Include':
              %pAddr(Include)) ;

            ProcedureIndexAdd(@PrcIdx:
                    'ProcedureIndexSignatureCheck':
              %pAddr(ProcedureIndexSignatureCheck)) ;

            ProcedureIndexAdd(@PrcIdx:
                    'ProcedureIndexCrt':
              %pAddr(ProcedureIndexCrt)) ;

            ProcedureIndexAdd(@PrcIdx:
                    'ProcedureIndexDlt':
              %pAddr(ProcedureIndexDlt)) ;

            ProcedureIndexAdd(@PrcIdx:
                    'ProcedureIndexAdd':
              %pAddr(ProcedureIndexAdd)) ;

            ProcedureIndexAdd(@PrcIdx:
                    'ProcedureIndexRtv':
              %pAddr(ProcedureIndexRtv)) ;

            ProcedureIndexAdd(@PrcIdx:
                    'ProcedureIndexLink':
              %pAddr(ProcedureIndexLink)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_RandomBitStream':
              %pAddr(Utility_RandomBitStream)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_SignatureCheck':
              %pAddr(Utility_SignatureCheck)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_Throw':
              %pAddr(Throw)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_TemplateName':
              %pAddr(TemplateName)) ;

         // Finished
            ENDSR ;

      /end-free
      * 
     D/COPY RAYLIB/QDLLSRCV20,CPYZINDEX2
     D/COPY RAYLIB/QDLLSRCV20,CPYTMPCCH2
      * 
      * --------------------------------------------------------------------------------------------
      * Perform a Binary Search on a Sorted Array
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_BinarySearch...
     P                 B
     D                 PI              N
     D  @Search                        *   CONST
     D  @Data                          *   CONST
     D  ArraySize                    10I 0 CONST
     D  ElementSize                  10I 0 CONST
     D  @Compare                       *   PROCPTR CONST
     D  @Element                       *
     D  FoundIndex                   10I 0
      * 
     D iMin            S             20I 0
     D iMid            S             20I 0
     D iMax            S             20I 0
      * 
     D @Search_        S              1A   BASED(@Search)
     D @Element_       S              1A   BASED(@Element)
      * 
     D Compare...
     D                 PR            10I 0 EXTPROC(@Compare)
     D  @Search_                      1A
     D  @Element_                     1A
      * 
     D x               S              3I 0
      * 
      /free

         // Search whole list
            iMax= ArraySize-1 ;

         // Keep searching until everything has been looked at
            DOW (iMax >= iMin) ;

            // Calculate midpoint and check it
               iMid= iMin+((iMax-iMin)/2) ;
               @Element= @Data+(iMid*ElementSize) ;
               x= Compare(@Search_:@Element_) ;

            // Decide what to do
               SELECT ;

            // Search is after this entry
               WHEN (x > 0) ;
                  iMin= iMid+1 ;

            // Search is before this entry
               WHEN (x < 0) ;
                  iMax= iMid-1 ;

            // Found search value
               OTHER ;
                  FoundIndex= iMid ;
                  RETURN true ;
               ENDSL ;

         // Loop
            ENDDO ;

         // Finished
            FoundIndex= iMin ;
            @Element= null ;
            RETURN false ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Catch unhandled program escape message
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Catch...
     P                 B
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
            @Info= Utility_AllocateAuto(Size) ;

         // Pick up outstanding message, if any
            QooRcvPgmMsg(Info:Size:
              'RCVM0300':'*':1:'*ESCAPE':'    ':0:'*SAME':QooErrorNull) ;

         // Compare message ID against parameters to see if they match
            EXSR CompareMessageId ;

         // Make sure there is enough room for everything we want
            Size= %Size(Info)+Info.BytesAvl+Info.MsgAvl ;
            @Info= Utility_AllocateAuto(Size) ;

         // Fetch all available data
            QooRcvPgmMsg(Info:Size:
              'RCVM0300':'*':1:'*ESCAPE':'    ':0:'*SAME':QooErrorNull) ;

         // Point at replacement data
            @RplDta= @Info+%Size(Info) ;

         // Set up retreval information block
            RtvInfoSize= %Size(RtvInfo) ;
            @RtvInfo= Utility_AllocateAuto(RtvInfoSize) ;

         // Retrieve information about formatted message
            QooRtvMsg(RtvInfo:RtvInfoSize:
              'RTVM0100':Info.Id:Info.File+Info.Library2:
              RplDta:Info.DataAvl:'*YES':'*YES':QooErrorNull) ;

         // Resize info area to make enough room for formatted message
            RtvInfoSize= RtvInfo.BytesAvl ;
            @RtvInfo= Utility_AllocateAuto(RtvInfoSize) ;

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
      *                                Copyright Notice
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      * 
      * Note: The following conversion routines are modified
      *       versions of code published by Scott C. Klement.
      *       Any bugs are my own.
      * 
      *       Convert To ASCII
      *       Convert To Base64
      *       Convert To EBCDIC
      * 
      * Copyright (c) 2005-2007 Scott C. Klement
      * All rights reserved.
      * 
      * Redistribution and use in source and binary forms, with or without
      * modification, are permitted provided that the following conditions
      * are met:
      * 1. Redistributions of source code must retain the above copyright
      *    notice, this list of conditions and the following disclaimer.
      * 2. Redistributions in binary form must reproduce the above copyright
      *    notice, this list of conditions and the following disclaimer in the
      *    documentation and/or other materials provided with the distribution.
      * 
      * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND
      * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
      * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
      * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
      * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
      * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
      * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
      * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
      * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
      * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
      * SUCH DAMAGE.
      * 
      * --------------------------------------------------------------------------------------------
      * Convert To ASCII
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_CvtToASCII...
     P                 B
     D                 PI
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      * 
     D fromCCSID       DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D toCCSID         DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D hConv           DS                  LIKEDS(IConv_T)
     D                                     INZ(*LIKEDS)
      * 
     D IConv_T         DS                  QUALIFIED INZ
     D  rtn_value                    10I 0
     D  cd                           10I 0 DIM(12)
      * 
     D IConv_Open      PR                  EXTPROC('QtqIconvOpen')
     D                                     LIKEDS(iconv_T)
     D  toCCSID                            LIKEDS(QtqCode_T)
     D  fromCCSID                          LIKEDS(QtqCode_T)
      * 
     D IConv           PR            10U 0 EXTPROC('iconv')
     D  hConv                              LIKEDS(iconv_t) VALUE
     D  pInBuff                        *   VALUE
     D  nInLen                         *   VALUE
     D  pOutBuff                       *   VALUE
     D  nOutLen                        *   VALUE
      * 
     D IConv_Close     PR            10I 0 EXTPROC('iconv_close')
     D  hConv                              LIKEDS(iconv_t) VALUE
      * 
     D QtqCode_T       DS                  QUALIFIED
     D  CCSID                        10I 0 INZ(0)
     D  CvtAlt                       10I 0 INZ(0)
     D  SubAlt                       10I 0 INZ(0)
     D  ShiftState                   10I 0 INZ(1)
     D  InLenOpt                     10I 0 INZ(0)
     D  MixDataErrorOpt...
     D                               10I 0 INZ(0)
     D  Reserved                      8A   INZ(*ALLx'00')
      * 
      /free

         // Establish conversion environment
            fromCCSID.CCSID= 0 ;
            toCCSID.CCSID= 819 ;
            hConv= *ALLx'00' ;
            hConv= IConv_Open(toCCSID:fromCCSID);

         // Convert data
            IConv(hConv:
              %Addr(@Source):%Addr(SourceSize):
              %Addr(@Source):%Addr(SourceSize)) ;

         // Close conversion environment
            IConv_Close(hConv) ;

         // Finished
            RETURN ;

      /end-free
      * 
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Convert Source data to Target data using Base64 notation
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_CvtToBase64...
     P                 B
     D                 PI              N
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D oCodes                         2A   CONST OPTIONS(*NOPASS)
      * 
     D CodesData       S             64A   INZ('-
     D                                     ABCDEFGHIJKLMNOPQRSTUVWXYZ-
     D                                     abcdefghijklmnopqrstuvwxyz-
     D                                     0123456789+/')
      * 
     D @Codes          S               *   INZ(%Addr(CodesData))
     D Codes           S              1A   DIM(64) BASED(@Codes)
      * 
     D                 DS
     D Byte                    1      1U 0
     D Char                    1      1A
      * 
     D i               S             10I 0
     D b               S             10I 0
      * 
     D @Src            S               *
     D Src             DS                  BASED(@Src) QUALIFIED
     D  Byte0                  1      1U 0
     D  Byte1                  2      2U 0
     D  Byte2                  3      3U 0
      * 
     D @TgtStr         S               *
     D @Tgt            S               *
     D Tgt             DS                  BASED(@Tgt) QUALIFIED
     D  Char0                  1      1A
     D TgtSize         S             10I 0
      * 
     D x03             C                   CONST(3)
     D x0F             C                   CONST(15)
     D x3F             C                   CONST(63)
     D xC0             C                   CONST(192)
     D xF0             C                   CONST(240)
     D xFC             C                   CONST(252)
      * 
      /free

         // Pick up alternative characters, if specified
            IF (%Parms() >= 5) ;
               Codes(63)= %SubSt(oCodes:1:1) ;
               Codes(64)= %SubSt(oCodes:2:1) ;
            ENDIF ;

         // Initialise
            @Src= @Source ;
            TgtSize= (SourceSize*4)/3 ;

         // Allocate temporary storage
            @Tgt= Utility_AllocateAuto(16+TgtSize) ;
            @TgtStr= @Tgt ;

         // Step through the source data
            FOR i= 0 TO SourceSize-1 BY 3 ;

            // Pick out first 6 bits
               Byte= (%BitAND(Src.Byte0:xFC))/4 ;

            // Append corresponding character
               Tgt.Char0= Codes(Byte+1) ;
               @Tgt+= 1 ;

            // Pick up two right-most bits and move to high nibble
               Byte= (%BitAND(Src.Byte0:x03))*16 ;

            // Do not overrun buffer
               IF (i+1 < SourceSize) ;

               // Mask in bits
                  Byte= %BitOR(Byte:%Int((%BitAND(Src.Byte1:xF0))/16)) ;

               // Append corresponding character
                  Tgt.Char0= Codes(Byte+1) ;
                  @Tgt+= 1 ;

               // Mask in bits
                  Byte= (%BitAND(Src.Byte1:x0F))*4 ;

               // Do not overrun buffer
                  IF (i+2 < SourceSize) ;

                  // Mask in bits
                     Byte= %BitOR(Byte:%Int((%BitAND(Src.Byte2:xC0))/64)) ;

                  // Append corresponding character
                     Tgt.Char0= Codes(Byte+1) ;
                     @Tgt+= 1 ;

                  // Mask in bits
                     Byte= %BitAND(Src.Byte2:x3F) ;

                  // Append corresponding character
                     Tgt.Char0= Codes(Byte+1) ;
                     @Tgt+= 1 ;

                  ELSE ;

                  // Append corresponding character
                     Tgt.Char0= Codes(Byte+1) ;
                     @Tgt+= 1 ;

                  // Append dummy trailer character
                     Tgt.Char0= '=' ;
                     @Tgt+= 1 ;

                  ENDIF ;

               ELSE ;

               // Append corresponding character
                  Tgt.Char0= Codes(Byte+1) ;
                  @Tgt+= 1 ;

               // Append dummy trailer character
                  Tgt.Char0= '=' ;
                  @Tgt+= 1 ;

               // Append dummy trailer character
                  Tgt.Char0= '=' ;
                  @Tgt+= 1 ;

               ENDIF ;

            // Point at next three characters
               @Src+= 3 ;

         // Loop
            ENDFOR ;

         // Calculate final size
            TgtSize= @Tgt-@TgtStr ;

         // Copy to specified target
            Utility_MemCpyPad(@Target:TargetSize:@TgtStr:TgtSize:x'00') ;

         // Finished
            RETURN (TargetSize <= TgtSize) ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Convert To EBCDIC
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_CvtToEBCDIC...
     P                 B
     D                 PI
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      * 
     D fromCCSID       DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D toCCSID         DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D hConv           DS                  LIKEDS(IConv_T)
     D                                     INZ(*LIKEDS)
      * 
     D IConv_T         DS                  QUALIFIED INZ
     D  rtn_value                    10I 0
     D  cd                           10I 0 DIM(12)
      * 
     D IConv_Open      PR                  EXTPROC('QtqIconvOpen')
     D                                     LIKEDS(iconv_T)
     D  toCCSID                            LIKEDS(QtqCode_T)
     D  fromCCSID                          LIKEDS(QtqCode_T)
      * 
     D IConv           PR            10U 0 EXTPROC('iconv')
     D  hConv                              LIKEDS(iconv_t) VALUE
     D  pInBuff                        *   VALUE
     D  nInLen                         *   VALUE
     D  pOutBuff                       *   VALUE
     D  nOutLen                        *   VALUE
      * 
     D IConv_Close     PR            10I 0 EXTPROC('iconv_close')
     D  hConv                              LIKEDS(iconv_t) VALUE
      * 
     D QtqCode_T       DS                  QUALIFIED
     D  CCSID                        10I 0 INZ(0)
     D  CvtAlt                       10I 0 INZ(0)
     D  SubAlt                       10I 0 INZ(0)
     D  ShiftState                   10I 0 INZ(1)
     D  InLenOpt                     10I 0 INZ(0)
     D  MixDataErrorOpt...
     D                               10I 0 INZ(0)
     D  Reserved                      8A   INZ(*ALLx'00')
      * 
      /free

         // Establish conversion environment
            fromCCSID.CCSID= 819 ;
            toCCSID.CCSID= 0 ;
            hConv= *ALLx'00' ;
            hConv= IConv_Open(toCCSID:fromCCSID);

         // Convert data
            IConv(hConv:
              %Addr(@Source):%Addr(SourceSize):
              %Addr(@Source):%Addr(SourceSize)) ;

         // Close conversion environment
            IConv_Close(hConv) ;

         // Finished
            RETURN ;

      /end-free
      * 
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Generate Random Signature
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_GenSignature...
     P                 B
     D                 PI            16A
      * 
     D Signature       S             16A
      * 
      /free

         // Generate random bit stream
            Utility_RandomBitStream(
              %Addr(Signature):%Size(Signature)) ;

         // Finished
            RETURN Signature ;

      /end-free
      * 
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Combine Hash Value
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_CombineHash...
     P                 B
     D                 PI            10I 0
     D  Result                       10I 0
     D  @Data                          *   CONST
     D  Length                       10U 0 CONST
      * 
     D Input           DS                  QUALIFIED
     D  Byte1                  1      1A
     D  Byte2                  2      2A
     D  Byte3                  3      3A
     D  Byte4                  4      4A
     D  Byte5                  5      5A
     D  Byte6                  6      6A
     D  Byte7                  7      7A
     D  Byte8                  8      8A
      * 
     D  Hex                    5      8A
      * 
     D  High                   1      4I 0
     D  c                      5      8I 0
      * 
     D Hash            DS                  QUALIFIED
     D  All                    1      8I 0
     D  Low                    5      8I 0
      * 
      /free

         // Initialise
            Input.hex= *ALLx'00' ;

         // Fetch input if required
            SELECT ;
            WHEN (Length = 0) ;
            WHEN (Length = 1) ;
               Utility_MemCpy(%Addr(Input.Byte8):@Data:Length) ;
            WHEN (Length = 2) ;
               Utility_MemCpy(%Addr(Input.Byte7):@Data:Length) ;
            WHEN (Length = 3) ;
               Utility_MemCpy(%Addr(Input.Byte6):@Data:Length) ;
            WHEN (Length = 4) ;
               Utility_MemCpy(%Addr(Input.Byte5):@Data:Length) ;
            WHEN (Length = 5) ;
               Utility_MemCpy(%Addr(Input.Byte4):@Data:Length) ;
               Utility_CombineHash(Result:%Addr(Input.High):4) ;
            WHEN (Length = 6) ;
               Utility_MemCpy(%Addr(Input.Byte3):@Data:Length) ;
               Utility_CombineHash(Result:%Addr(Input.High):4) ;
            WHEN (Length = 7) ;
               Utility_MemCpy(%Addr(Input.Byte2):@Data:Length) ;
               Utility_CombineHash(Result:%Addr(Input.High):4) ;
            WHEN (Length = 8) ;
               Utility_MemCpy(%Addr(Input.Byte1):@Data:Length) ;
               Utility_CombineHash(Result:%Addr(Input.High):4) ;
            OTHER ;
               EVALR Input.Hex= Utility_MD5Hash(@Data:Length) ;
            ENDSL ;

         // Multiply up by 37 and truncate result
            Hash.All= 0 ;
            Hash.Low= Result ;
            Hash.All*= 37 ;
            Hash.All+= Input.c ;
            Result= Hash.Low ;

         // Finished
            RETURN Result ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Copy with pad
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_MemCpyPad...
     P                 B
     D                 PI
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  Pad                           1A   VALUE OPTIONS(*NOPASS)
      * 
     D                 DS
     D PadChar                 1      1A
     D PadVal                  1      1U 0
      * 
      /free

         // Exit at once with zero size
            IF (TargetSize = 0) ;
               RETURN ;
            ENDIF ;

         // Exit at once with invalid size
            IF (TargetSize < 0) ;
               Throw('TargetSize can not be negative') ;
            ENDIF ;

         // Error with invalid size
            IF (SourceSize < 0) ;
               Throw('SourceSize can not be negative') ;
            ENDIF ;

         // Copy only as much data as will fit
            IF (TargetSize <= SourceSize) ;
               Utility_MemCpy(@Target:@Source:TargetSize) ;
               RETURN ;
            ENDIF ;

         // Copy all data available
            Utility_MemCpy(@Target:@Source:SourceSize) ;

         // Pad if requested
            IF (%Parms() >= 5) ;
               PadChar= Pad ;
               Utility_MemSet(
                 @Target+SourceSize:PadVal:TargetSize-SourceSize) ;
            ENDIF ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Include
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Include...
     P                 B
     D                 PI
     D  Template                      1A   OPTIONS(*VARSIZE)
     D p@SubClass                      *   CONST OPTIONS(*NOPASS)
      * 
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      * 
     D @Entry          S               *
     D Entry           DS                  QUALIFIED BASED(@Entry)
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      * 
     D LoadClass       PR                  EXTPGM(Header.LibPgm)
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      * 
     D @SubClass       S               *
      * 
     D MsgDta          DS                  QUALIFIED
     D  SigRqs                       16A
     D  SigFnd                       16A
     D  Type                        126A   VARYING
      * 
     D Package         DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  Size                         10I 0
     D                               12A
      * 
     D @PkgEntry       S               *
     D PkgEntry        DS                  QUALIFIED BASED(@PkgEntry)
     D  @Addr                          *
      * 
     D p               S             10I 0
      * 
     D PkgEntryTemplate...
     D                 S              1A   BASED(PkgEntry.@Addr)
      * 
      /free

         // Pick up template address
            @Header= %Addr(Template) ;

         // Pick up optional parameter
            IF (%Parms() >= 2) ;
               @SubClass= p@SubClass ;
            ENDIF ;

         // Check Template
            SELECT ;

         // Standard Template
            WHEN (Header.Signature = TemplateSignature) ;
               EXSR StandardTemplate ;

         // Package Template
            WHEN (Header.Signature = PackageSignature) ;
               EXSR PackageTemplate ;

         // Standard Template but already initialised
            WHEN (Header.Signature = TemplateSignatureInz) ;

         // Package Template but already initialised
            WHEN (Header.Signature = PackageSignatureInz) ;

         // Not recognised
            OTHER ;
               MsgDta.SigRqs= TemplateSignature ;
               MsgDta.SigFnd= Header.Signature ;
               MsgDta.Type= 'Include Template' ;
               Throw(MsgDta:'DLL0006':'DLLMSGF') ;
            ENDSL ;

         // Finished
            RETURN ;

         // ----------------------------------------------------------------------------------------
         // Standard Template
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR StandardTemplate ;

         // Check that it has the correct size
            IF (%Rem(Header.Size-%Size(Header):%Size(Entry)) <> 0) ;
               Throw('Include template has an incorrect length') ;
            ENDIF ;

         // Load class
            LoadClass(@Header:@SubClass) ;

         // Mark as initialised
            Header.Signature= TemplateSignatureInz ;

         // Finished
            ENDSR ;

         // ----------------------------------------------------------------------------------------
         // Package Template
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR PackageTemplate ;

         // Check that it has the correct size
            IF (%Rem(Package.Size-%Size(Package):%Size(PkgEntry)) <> 0) ;
               Throw('Include Package template has an incorrect length') ;
            ENDIF ;

         // Point to first entry
            @PkgEntry= %Addr(Package)+%Size(Package) ;

         // Loop through all entries
            FOR p= 1 TO %Int((Package.Size-%Size(Package))/
                          %Size(PkgEntry)) ;

            // Include the contents of the template
               include(PkgEntryTemplate:@SubClass) ;

            // Point to next entry
               @PkgEntry+= %Size(PkgEntry) ;

         // Loop
            ENDFOR ;

         // Mark as initialised
            Package.Signature= PackageSignatureInz ;

         // Finished
            ENDSR ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Produce MD5 Hash
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_MD5Hash...
     P                 B
     D                 PI            16A
     D  @Source                        *   VALUE
     D  Size                         10U 0 VALUE
      * 
     D Controls        DS            96
     D  Function                      5U 0 INZ(5)
     D  HashAlgorithm                 1A   INZ(x'00')
     D  Sequence                      1A   INZ(x'00')
     D  DataLength                   10U 0
     D  OutputType                    1A   INZ(x'00')
     D  Reserved1                     7A   INZ(*ALLx'00')
     D  @HashContext                   *   INZ(%Addr(HashWorkArea))
     D HashWorkArea    S             96A   INZ(*LOVAL)
      * 
     D @Output         S               *   INZ(%Addr(Output))
     D Output          S             16A
      * 
     D APICipher...
     D                 PR                  EXTPROC('_CIPHER')
     D  Receiver                       *   VALUE
     D  Controls                       *   VALUE
     D  Source                         *   VALUE
      * 
      /free

         // Set data length
            DataLength= Size;

         // Generate MD5 hash
            APICipher(%Addr(@Output):%Addr(Controls):%Addr(@Source));

         // Finished
            RETURN Output;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Next Higher Power Of Two
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_NextHigherPowerOfTwo...
     P                 B
     D                 PI            20I 0
     D  x                            20I 0 VALUE
      * 
      /free

            x= x-1 ;
            x= %BitOR(x:%Int(x/2)) ;
            x= %BitOR(x:%Int(x/4)) ;
            x= %BitOR(x:%Int(x/16)) ;
            x= %BitOR(x:%Int(x/256)) ;
            x= %BitOR(x:%Int(x/65535)) ;
            x= %BitOR(x:%Int(x/42949672962)) ;
            x+= 1 ;

         // Finished
            RETURN x ;

      /end-free
      * 
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * PocedureIndexEntry: Compare entries
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P PrcIdxEntryCompare...
     P                 B
     D                 PI            10I 0
     D  p@A                            *   CONST
     D  p@B                            *   CONST
      *
     D @A              S               *
     D A               DS                  LIKEDS(PrcIdxEntry_) BASED(@A)
      *
     D @B              S               *
     D B               DS                  LIKEDS(PrcIdxEntry_) BASED(@B)
      *
      /free

         // Pick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.Name < B.Name) ;
               RETURN -1 ;
            WHEN (A.Name > B.Name) ;
               RETURN +1 ;
            ENDSL ;

         // Finished
            RETURN 0 ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndexEntry: Delete
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P PrcIdxEntryDlt...
     P                 B
     D                 PI
     D  @                              *   VALUE
      * 
      /free

         // Trash the object itself
            Utility_MemSet(@:x'FF':%Size(PrcIdxEntry_)) ;
            DEALLOC @ ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      * 
      /free

         // Finished
            RETURN Utility_SignatureCheck(@:
                     ProcedureIndexSignature:'ProcedureIndex') ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Create a ProcedureIndex
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexCrt...
     P                 B
     D                 PI              *
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      * 
      /free

         // Allocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= ProcedureIndexSignature ;

         // Initialise
            this.@Prcs= ZIndexCrt(%pAddr(PrcIdxEntryCompare)) ;
            this.@Cache= TemplateCacheCrt() ;

         // Finished
            RETURN @this ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Delete
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexDlt...
     P                 B
     D                 PI              *
     D  @                              *
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      * 
      /free

         // Pick up object
            @this= ProcedureIndexSignatureCheck(@) ;

         // Trash internals
            ZIndexClr(this.@Prcs:%pAddr(PrcIdxEntryDlt)) ;
            ZIndexDlt(this.@Prcs) ;

            TemplateCacheDlt(this.@Cache) ;

         // Trash the object itself
            Utility_MemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         // Finished
            RETURN @ ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Add
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
     D  @Addr                          *   PROCPTR CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(PrcIdxEntry_)
     D                                     BASED(@Entry)
      * 
      /free

         // Pick up object
            @this= ProcedureIndexSignatureCheck(@) ;

         // Build new entry
            @Entry= %Alloc(%Size(Entry)) ;
            Entry.Name= Name ;
            Entry.@Addr= @Addr ;

         // Add it to the index
            ZIndexAdd(this.@Prcs:@Entry) ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Retrieve procedure address
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexRtv...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      * 
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(PrcIdxEntry_)
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(PrcIdxEntry_)
     D                                     BASED(@Entry)
      * 
      /free

         // Pick up object
            @this= ProcedureIndexSignatureCheck(@) ;

         // Set up search
            Search.Name= Name ;

         // Fetch entry
            @Entry= ZIndexRtv(this.@Prcs:@Search) ;

         // Error if not found
            IF (@Entry = null) ;
               Throw('Procedure '+Name+' not found.') ;
            ENDIF ;

         // Finished
            RETURN Entry.@Addr ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ProcedureIndex: Link
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexLink...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Template                      *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      * 
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      * 
     D @Entry          S               *
     D Entry           DS                  QUALIFIED BASED(@Entry)
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      * 
     D j               S             10I 0
     D EntryCount      S             10I 0
     D Hash            S             16A
      * 
      /free

         // Pick up object
            @this= ProcedureIndexSignatureCheck(@) ;

         // Point at template
            @Header= @Template ;

         // Check Template
            EXSR CheckTemplate ;

         // Retrieve cached template if possible
            IF (TemplateCacheRtv(this.@Cache:@Header) = true) ;
               RETURN ;
            ENDIF ;

         // Calculate hash
            Hash= Utility_MD5Hash(@Header:Header.Size) ;

         // Point at first entry
            @Entry= @Header+%Size(Header) ;

         // Process all entries
            FOR j= 1 TO EntryCount ;

            // Fetch address
               Entry.@Addr= ProcedureIndexRtv(@this:Entry.Name) ;

            // Point at next entry
               @Entry+= %Size(Entry) ;

         // Loop
            ENDFOR ;

         // Cache the finished version
            TemplateCacheAdd(this.@Cache:@Header:Hash) ;

         // Finished
            RETURN ;

         // ----------------------------------------------------------------------------------------
         // Check template
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CheckTemplate ;

            // It must have the correct signature
               IF (Header.Signature <> TemplateSignature) ;
                  Utility_SignatureCheck(@Header:TemplateSignature:
                    'Include Template') ;
               ENDIF ;

            // Check that it has the correct size
               IF (%Rem(Header.Size-%Size(Header):%Size(Entry)) <> 0) ;
                  Throw('Badly formed template length') ;
               ENDIF ;

            // Convert size to an entry count
               EntryCount= (Header.Size-%Size(Header))/%Size(Entry) ;

         // Finished
            ENDSR ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Random Bit Stream
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_RandomBitStream...
     P                 B
     D                 PI
     D  @Buffer                        *   CONST
     D  Size                         10I 0 CONST
      * 
     D GenPRN...
     D                 PR                  EXTPROC('Qc3GenPRNs')
     D  @Data                          *   VALUE
     D  DataLen                      10I 0 CONST
     D  Type                          1A   CONST
     D  Parity                        1A   CONST
     D  ErrorCode                     8A   OPTIONS(*VARSIZE)
      * 
     D ErrorCode       DS
     D  BytesProv                    10I 0 INZ(0)
     D  BytesAvail                   10I 0 INZ(0)
      * 
     D Signature       S             16A
      * 
      /free

         // Generate random bit stream
            GenPRN(@Buffer:Size:'0':'0':ErrorCode) ;

         // Finished
            RETURN ;

      /end-free
      * 
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_SignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  Signature                    16A   CONST
     D  Type                        126A   VARYING CONST
      * 
     D Possible        DS                  BASED(@) QUALIFIED
     D  Signature                    16A
      * 
     D MsgDta          DS                  QUALIFIED
     D  SigRqs                       16A
     D  SigFnd                       16A
     D  Type                        126A   VARYING
      * 
      /free

         // Decide what to do
            SELECT ;

         // No error if all is well
            WHEN (@ <> null) AND (Possible.Signature = Signature) ;

         // Null pointer
            WHEN (@ = null) ;
              MsgDta.SigRqs= Signature ;
              MsgDta.SigFnd= *ALLx'00' ;
              MsgDta.Type= Type ;
              Throw(MsgDta:'DLL0005':'DLLMSGF') ;

         // Wrong signature
            OTHER ;
              MsgDta.SigRqs= Signature ;
              MsgDta.SigFnd= Possible.Signature ;
              MsgDta.Type= Type ;
              Throw(MsgDta:'DLL0006':'DLLMSGF') ;
            ENDSL ;

         // Finished
            RETURN @ ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Template Name
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateName...
     P                 B
     D                 PI           126A   VARYING
     D  @Template                      *   CONST
      * 
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      * 
      /free

         // Point at template
            @Header= @Template ;

         // It must have the correct signature
            IF (Header.Signature <> TemplateSignature) ;
               Utility_SignatureCheck(@Header:TemplateSignature:
                 'Include Template') ;
            ENDIF ;

         // Finished
            RETURN Header.Name ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * Throw program escape message
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Throw...
     P                 B
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
            @Info= Utility_AllocateAuto(Size) ;

         // Fetch call stack info for correct sizing details
            QooRtvCallStk(Info:Size:
              CSTK0100:JobIdInf:JIDF0100:QooErrorNull) ;

         // Make sure there is enough room for everything we want
            Size= %Size(Info)+Info.BytAvl ;
            @Info= Utility_AllocateAuto(Size) ;

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
