     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO:*SHOWCPY)
     H BNDDIR('QC2LE')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀStructures
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *ÀProcedureIndex Signature
     D ProcedureIndexSignature...
     D                 C                   x'-
     D                                     4460329BE5E0086A-
     D                                     F9BFB56A9071613E'
      *À
      *ÀProcedureIndex Data Structure
     D ProcedureIndex_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  @Prcs                          *
     D  @Cache                         *
      *À
     D PrcIdxEntry_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedures
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *ÀCopy in required prototypes
     D/COPY RAYLIB/QDLLSRCV20,CPYZINDEX1
     D/COPY RAYLIB/QDLLSRCV20,CPYTMPCCH1
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Allocate Automatic Storage API
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_AllocateAuto...
     D                 PR              *   EXTPROC('_MODASA')
     D  Size                         10U 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPerform a Binary Search on a Sorted Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_BinarySearch...
     D                 PR              N
     D  @Search                        *   CONST
     D  @Data                          *   CONST
     D  ArraySize                    10I 0 CONST
     D  ElementSize                  10I 0 CONST
     D  @Compare                       *   PROCPTR CONST
     D  @Element                       *
     D  FoundIndex                   10I 0
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Binary Search on a Sorted Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_BSearch...
     D                 PR              *   EXTPROC('bsearch')
     D  @Search                        *   VALUE
     D  @Data                          *   VALUE
     D  ArraySize                    10U 0 VALUE
     D  ElementSize                  10U 0 VALUE
     D  @Compare                       *   PROCPTR VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCatch unhandled program escape message
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Catch...
     D                 PR              N
     D  MsgId                         7A   VALUE VARYING
     D                                     OPTIONS(*NOPASS:*TRIM)
     D  MsgDta                      256A   VALUE VARYING OPTIONS(*NOPASS)
      *À
      *À------------------------------------------------------------------------
      *ÀAPI: Cipher
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_Cipher...
     D                 PR                  EXTPROC('_CIPHER')
     D  Receiver                       *   VALUE
     D  Controls                       *   VALUE
     D  Source                         *   VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCombine Hash Value
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CombineHash...
     D                 PR            10I 0
     D  Result                       10I 0
     D  @Data                          *   CONST
     D  Length                       10U 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvert To ASCII
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtToASCII...
     D                 PR
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvert To Base64
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtToBase64...
     D                 PR              N
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D oCodes                         2A   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvert To EBCDIC
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtToEBCDIC...
     D                 PR
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀGenerate Random Signature
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_GenSignature...
     D                 PR            16A
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCopy with pad
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemCpyPad...
     D                 PR
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  Pad                           1A   VALUE OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Copy memory block
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemCpy...
     D                 PR              *   EXTPROC('_MEMMOVE')
     D  Target                         *   VALUE
     D  Source                         *   VALUE
     D  Length                       10U 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Set contents of memory block
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemSet...
     D                 PR              *   EXTPROC('__memset')
     D  Target                         *   VALUE
     D  Char                          3U 0 VALUE
     D  Length                       10U 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInclude
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Include...
     D                 PR
     D  Template                      1A   OPTIONS(*VARSIZE)
     D  @SubClass                      *   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProduce MD5 Hash
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MD5Hash...
     D                 PR            16A
     D  @Source                        *   VALUE
     D  Size                         10U 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀNext Higher Power Of Two
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_NextHigherPowerOfTwo...
     D                 PR            20I 0
     D  Input1                       20I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndexEntry: Compare entries
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D PrcIdxEntryCompare...
     D                 PR            10I 0
     D  @PrcIdxEntry                   *   CONST
     D  @PrcIdxEntry                   *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndexEntry: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D PrcIdxEntryDlt...
     D                 PR
     D  @                              *   VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Create
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexCrt...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexDlt...
     D                 PR              *
     D  @                              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexAdd...
     D                 PR
     D  @this                          *   CONST
     D  Name                        126A   VARYING CONST
     D  @Addr                          *   PROCPTR CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Retrieve
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexRtv...
     D                 PR              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexLink...
     D                 PR
     D  @this                          *   CONST
     D  @Template                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSignature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_SignatureCheck...
     D                 PR              *
     D  @Pointer                       *   CONST
     D  Signature                    16A   CONST
     D  Type                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplate Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateName...
     D                 PR           126A   VARYING
     D  @Template                      *   CONST
      *À
     D @TemplateName   S               *   PROCPTR
     D                                     INZ(%pAddr(TemplateName))
      *À
     D Utility_TemplateName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@TemplateName)
     D  @Template                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀThrow program escape message
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Throw...
     D                 PR
     D  oMsgDta                     512A   VARYING CONST OPTIONS(*NOPASS)
     D  oMsgId                        7A   CONST OPTIONS(*NOPASS:*OMIT)
     D  oMsgFil                      10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  oMsgLib                      10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  oStkCnt                      10I 0 CONST OPTIONS(*NOPASS:*OMIT)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConstants and Work Fields
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D false           C                   CONST(*OFF)
     D true            C                   CONST(*ON)
     D null            C                   CONST(*NULL)
      *À
      *ÀPackage Signature
     D PackageSignature...
     D                 C                   CONST(x'-
     D                                     CFDA4FB22C2FD0AE-
     D                                     6DAAD0F46D0F7BBF')
      *À
      *ÀTemplate Signature
     D TemplateSignature...
     D                 C                   CONST(x'-
     D                                     A7569D265BDE4B49-
     D                                     5EB2B2E466CF1B79')
      *À
      *ÀPackage Signature
     D PackageSignatureInz...
     D                 C                   CONST(x'-
     D                                     707A4C59A4D19F49-
     D                                     C97E3B44A052E27E')
      *À
      *ÀTemplate Signature - Initialised
     D TemplateSignatureInz...
     D                 C                   CONST(x'-
     D                                     B1A7644C221D0C01-
     D                                     7CA3517124F00148')
      *À
     D @PrcIdx         S               *
      *À
      *ÀStructre to hold 'last caught' message information
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
      *À
      *À--------------------------------------------------------------------------------------------
      *À*ENTRY PLIST Parameters
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('DLLUTILV20')
     D  Template                      1A   OPTIONS(*VARSIZE)
      *À
     D Main            PI
     D  Template                      1A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀStart of executable
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      /free

         //ÀThis program uses automatic initialisation
         //ÀEXSR *INZSR ;

         //ÀDecide what to do
            SELECT ;

         //ÀUtility
            WHEN (TemplateName(%Addr(Template)) = 'UtilityV20') ;
               ProcedureIndexLink(@PrcIdx:%Addr(Template)) ;

         //ÀUnknown name
            OTHER ;
               Throw('Unrecognised name: '+TemplateName(%Addr(Template))) ;
            ENDSL ;


         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀAutomatic Initialisation
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR *INZSR ;

         //ÀCreate a procedure index
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
                   '_SignatureCheck':
              %pAddr(Utility_SignatureCheck)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_Throw':
              %pAddr(Throw)) ;

            ProcedureIndexAdd(@PrcIdx:
                   '_TemplateName':
              %pAddr(TemplateName)) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
     D/COPY RAYLIB/QDLLSRCV20,CPYZINDEX2
     D/COPY RAYLIB/QDLLSRCV20,CPYTMPCCH2
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPerform a Binary Search on a Sorted Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
      *À
     D iMin            S             20I 0
     D iMid            S             20I 0
     D iMax            S             20I 0
      *À
     D @Search_        S              1A   BASED(@Search)
     D @Element_       S              1A   BASED(@Element)
      *À
     D Compare...
     D                 PR            10I 0 EXTPROC(@Compare)
     D  @Search_                      1A
     D  @Element_                     1A
      *À
     D x               S              3I 0
     D Host            S               *
      *À
      /free

         //ÀSearch whole list
            iMax= ArraySize-1 ;

         //ÀKeep searching until everything has been looked at
            DOW (iMax >= iMin) ;

            //ÀCalculate midpoint and check it
               iMid= iMin+((iMax-iMin)/2) ;
               @Element= @Data+(iMid*ElementSize) ;
               x= Compare(@Search_:@Element_) ;

            //ÀDecide what to do
               SELECT ;

            //ÀSearch is after this entry
               WHEN (x > 0) ;
                  iMin= iMid+1 ;

            //ÀSearch is before this entry
               WHEN (x < 0) ;
                  iMax= iMid-1 ;

            //ÀFound search value
               OTHER ;
                  FoundIndex= iMid ;
                  RETURN true ;
               ENDSL ;

         //ÀLoop
            ENDDO ;

         //ÀFinished
            FoundIndex= iMin ;
            @Element= null ;
            RETURN false ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCatch unhandled program escape message
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Catch...
     P                 B
     D                 PI              N
     D  oMsgId                        7A   VALUE VARYING
     D                                     OPTIONS(*NOPASS:*TRIM)
     D  oMsgDta                     256A   VALUE VARYING OPTIONS(*NOPASS)
      *À
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
      *À
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
      *À
     D Size            S             10I 0
      *À
     D QooErrorNull...
     D                 DS                  QUALIFIED
     D  BytesProv                    10I 0 INZ(0)
     D  BytesAvail                   10I 0 INZ(0)
      *À
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
      *À
     D @RplDta         S               *
     D RplDta          S              1A   BASED(@Info)
      *À
     D RtvInfoSize     S             10I 0
     D @RtvInfo        S               *
     D RtvInfo         DS                  QUALIFIED BASED(@RtvInfo)
     D  BytesRet                     10I 0
     D  BytesAvl                     10I 0
     D  MsgLenRet                    10I 0
     D  MsgLenAvl                    10I 0
     D  HlpLenRet                    10I 0
     D  HlpLenAvl                    10I 0
      *À
     D @MessageText    S               *
     D MessageText     S          32767A   BASED(@MessageText)
      *À
      /free

         //ÀMake some space for the info block
            Size= %Size(Info)+8 ;
            @Info= Utility_AllocateAuto(Size) ;

         //ÀPick up outstanding message, if any
            QooRcvPgmMsg(Info:Size:
              'RCVM0300':'*':1:'*ESCAPE':'    ':0:'*SAME':QooErrorNull)     ;

         //ÀCompare message against parameters to see if they match
            EXSR CompareMessage ;

         //ÀMake sure there is enough room for everything we want
            Size= %Size(Info)+Info.DataAvl+Info.MsgAvl ;
            @Info= Utility_AllocateAuto(Size) ;

         //ÀFetch all available data
            QooRcvPgmMsg(Info:Size:
              'RCVM0300':'*':1:'*ESCAPE':'    ':0:'*SAME':QooErrorNull)     ;

         //ÀPoint at replacement data
            @RplDta= @Info+%Size(Info) ;

         //ÀSet up retreval information block
            RtvInfoSize= %Size(RtvInfo) ;
            @RtvInfo= Utility_AllocateAuto(RtvInfoSize) ;

         //ÀRetrieve information about formatted message
            QooRtvMsg(RtvInfo:RtvInfoSize:
              'RTVM0100':Info.Id:Info.File+Info.Library2:
              RplDta:Info.DataAvl:'*YES':'*YES':QooErrorNull) ;

         //ÀResize info area to make enough room for formatted message
            RtvInfoSize= RtvInfo.BytesAvl ;
            @RtvInfo= Utility_AllocateAuto(RtvInfoSize) ;

         //ÀRetrieve a formatted version of the message text
            QooRtvMsg(RtvInfo:RtvInfoSize:
              'RTVM0100':Info.Id:Info.File+Info.Library2:
              RplDta:Info.DataAvl:'*YES':'*YES':QooErrorNull) ;

         //ÀPoint at message text
            @MessageText= @RtvInfo+%Size(RtvInfo) ;

         //ÀReceive message and mark it as handled
            QooRcvPgmMsg(Info:Size:
              'RCVM0300':'*':1:'*ESCAPE':'    ':0:
              '*REMOVE':QooErrorNull);

         //ÀClear out the 'Caught' message data structure
            CLEAR Caught ;

         //ÀCopy info fields
            EVAL-CORR Caught= Info ;
            IF (RtvInfo.MsgLenRet > (%Size(Caught.MsgTxtFmt)-2)) ;
               Caught.MsgTxtFmt= MessageText ;
            ELSE ;
               Caught.MsgTxtFmt= %SubSt(MessageText:1:RtvInfo.MsgLenRet) ;
            ENDIF ;

         //ÀFinished
            RETURN true ;

         //À----------------------------------------------------------------------------------------
         //ÀCompare Message to see if it matches
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CompareMessage ;

            //ÀMatch Message Id value
               SELECT ;

            //ÀAccept all if no message parameter supplied
               WHEN (%Parms() = 0) ;

            //ÀAlso accept special value *ALL or blanks
               WHEN (oMsgId = '*ALL') OR (oMsgId = '') ;

            //ÀMatch against supplied length
               WHEN (%SubSt(Info.Id:1:%Len(oMsgId)) = oMsgId) ;

            //ÀDoesnt match, so do not handle it
               OTHER ;
                  RETURN false ;
               ENDSL ;

            //ÀMatch Message Data value
               SELECT ;

            //ÀAccept all if no message data parameter supplied
               WHEN (%Parms() <= 1) ;

            //ÀAlso accept blanks
               WHEN (oMsgDta = '') ;

            //ÀMatch against supplied length
               WHEN (%SubSt(Info.Id:1:%Len(oMsgDta)) = oMsgDta) ;

            //ÀDoesnt match, so do not handle it
               OTHER ;
                  RETURN false ;
               ENDSL ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvert To ASCII
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_CvtToASCII...
     P                 B
     D                 PI
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      *À
     D fromCCSID       DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D toCCSID         DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D hConv           DS                  LIKEDS(IConv_T)
     D                                     INZ(*LIKEDS)
      *À
     D IConv_T         DS                  QUALIFIED INZ
     D  rtn_value                    10I 0
     D  cd                           10I 0 DIM(12)
      *À
     D IConv_Open      PR                  EXTPROC('QtqIconvOpen')
     D                                     LIKEDS(iconv_T)
     D  toCCSID                            LIKEDS(QtqCode_T)
     D  fromCCSID                          LIKEDS(QtqCode_T)
      *À
     D IConv           PR            10U 0 EXTPROC('iconv')
     D  hConv                              LIKEDS(iconv_t) VALUE
     D  pInBuff                        *   VALUE
     D  nInLen                         *   VALUE
     D  pOutBuff                       *   VALUE
     D  nOutLen                        *   VALUE
      *À
     D IConv_Close     PR            10I 0 EXTPROC('iconv_close')
     D  hConv                              LIKEDS(iconv_t) VALUE
      *À
     D QtqCode_T       DS                  QUALIFIED
     D  CCSID                        10I 0 INZ(0)
     D  CvtAlt                       10I 0 INZ(0)
     D  SubAlt                       10I 0 INZ(0)
     D  ShiftState                   10I 0 INZ(1)
     D  InLenOpt                     10I 0 INZ(0)
     D  MixDataErrorOpt...
     D                               10I 0 INZ(0)
     D  Reserved                      8A   INZ(*ALLx'00')
      *À
      /free

         //ÀEstablish conversion environment
            fromCCSID.CCSID= 0 ;
            toCCSID.CCSID= 819 ;
            hConv= *ALLx'00' ;
            hConv= IConv_Open(toCCSID:fromCCSID);

         //ÀConvert data
            IConv(hConv:
              %Addr(@Source):%Addr(SourceSize):
              %Addr(@Source):%Addr(SourceSize)) ;

         //ÀClose conversion environment
            IConv_Close(hConv) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvert Source data to Target data using Base64 notation
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_CvtToBase64...
     P                 B
     D                 PI              N
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D oCodes                         2A   CONST OPTIONS(*NOPASS)
      *À
     D CodesData       S             64A   INZ('-
     D                                     ABCDEFGHIJKLMNOPQRSTUVWXYZ-
     D                                     abcdefghijklmnopqrstuvwxyz-
     D                                     0123456789+/')
      *À
     D @Codes          S               *   INZ(%Addr(CodesData))
     D Codes           S              1A   DIM(64) BASED(@Codes)
      *À
     D                 DS
     D Byte                    1      1U 0
     D Char                    1      1A
      *À
     D i               S             10I 0
     D b               S             10I 0
      *À
     D @Src            S               *
     D Src             DS                  BASED(@Src) QUALIFIED
     D  Byte0                  1      1U 0
     D  Byte1                  2      2U 0
     D  Byte2                  3      3U 0
      *À
     D @TgtStr         S               *
     D @Tgt            S               *
     D Tgt             DS                  BASED(@Tgt) QUALIFIED
     D  Char0                  1      1A
     D TgtSize         S             10I 0
      *À
     D x03             C                   CONST(3)
     D x0F             C                   CONST(15)
     D x3F             C                   CONST(63)
     D xC0             C                   CONST(192)
     D xF0             C                   CONST(240)
     D xFC             C                   CONST(252)
      *À
      /free

         //ÀPick up alternative characters, if specified
            IF (%Parms() >= 5) ;
               Codes(63)= %SubSt(oCodes:1:1) ;
               Codes(64)= %SubSt(oCodes:2:1) ;
            ENDIF ;

         //ÀInitialise
            @Src= @Source ;
            TgtSize= (SourceSize*4)/3 ;

         //ÀAllocate temporary storage
            @Tgt= Utility_AllocateAuto(16+TgtSize) ;
            @TgtStr= @Tgt ;

         //ÀStep through the source data
            FOR i= 0 TO SourceSize-1 BY 3 ;

            //ÀPick out first 6 bits
               Byte= (%BitAND(Src.Byte0:xFC))/4 ;

            //ÀAppend corresponding character
               Tgt.Char0= Codes(Byte+1) ;
               @Tgt+= 1 ;

            //ÀPick up two right-most bits and move to high nibble
               Byte= (%BitAND(Src.Byte0:x03))*16 ;

            //ÀDo not overrun buffer
               IF (i+1 < SourceSize) ;

               //ÀMask in bits
                  Byte= %BitOR(Byte:%Int((%BitAND(Src.Byte1:xF0))/16)) ;

               //ÀAppend corresponding character
                  Tgt.Char0= Codes(Byte+1) ;
                  @Tgt+= 1 ;

               //ÀMask in bits
                  Byte= (%BitAND(Src.Byte1:x0F))*4 ;

               //ÀDo not overrun buffer
                  IF (i+2 < SourceSize) ;

                  //ÀMask in bits
                     Byte= %BitOR(Byte:%Int((%BitAND(Src.Byte2:xC0))/64)) ;

                  //ÀAppend corresponding character
                     Tgt.Char0= Codes(Byte+1) ;
                     @Tgt+= 1 ;

                  //ÀMask in bits
                     Byte= %BitAND(Src.Byte2:x3F) ;

                  //ÀAppend corresponding character
                     Tgt.Char0= Codes(Byte+1) ;
                     @Tgt+= 1 ;

                  ELSE ;

                  //ÀAppend corresponding character
                     Tgt.Char0= Codes(Byte+1) ;
                     @Tgt+= 1 ;

                  //ÀAppend dummy trailer character
                     Tgt.Char0= '=' ;
                     @Tgt+= 1 ;

                  ENDIF ;

               ELSE ;

               //ÀAppend corresponding character
                  Tgt.Char0= Codes(Byte+1) ;
                  @Tgt+= 1 ;

               //ÀAppend dummy trailer character
                  Tgt.Char0= '=' ;
                  @Tgt+= 1 ;

               //ÀAppend dummy trailer character
                  Tgt.Char0= '=' ;
                  @Tgt+= 1 ;

               ENDIF ;

            //ÀPoint at next three characters
               @Src+= 3 ;

         //ÀLoop
            ENDFOR ;

         //ÀCalculate final size
            TgtSize= @Tgt-@TgtStr ;

         //ÀCopy to specified target
            Utility_MemCpyPad(@Target:TargetSize:@TgtStr:TgtSize:x'00') ;

         //ÀFinished
            RETURN (TargetSize <= TgtSize) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvert To EBCDIC
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_CvtToEBCDIC...
     P                 B
     D                 PI
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      *À
     D fromCCSID       DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D toCCSID         DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D hConv           DS                  LIKEDS(IConv_T)
     D                                     INZ(*LIKEDS)
      *À
     D IConv_T         DS                  QUALIFIED INZ
     D  rtn_value                    10I 0
     D  cd                           10I 0 DIM(12)
      *À
     D IConv_Open      PR                  EXTPROC('QtqIconvOpen')
     D                                     LIKEDS(iconv_T)
     D  toCCSID                            LIKEDS(QtqCode_T)
     D  fromCCSID                          LIKEDS(QtqCode_T)
      *À
     D IConv           PR            10U 0 EXTPROC('iconv')
     D  hConv                              LIKEDS(iconv_t) VALUE
     D  pInBuff                        *   VALUE
     D  nInLen                         *   VALUE
     D  pOutBuff                       *   VALUE
     D  nOutLen                        *   VALUE
      *À
     D IConv_Close     PR            10I 0 EXTPROC('iconv_close')
     D  hConv                              LIKEDS(iconv_t) VALUE
      *À
     D QtqCode_T       DS                  QUALIFIED
     D  CCSID                        10I 0 INZ(0)
     D  CvtAlt                       10I 0 INZ(0)
     D  SubAlt                       10I 0 INZ(0)
     D  ShiftState                   10I 0 INZ(1)
     D  InLenOpt                     10I 0 INZ(0)
     D  MixDataErrorOpt...
     D                               10I 0 INZ(0)
     D  Reserved                      8A   INZ(*ALLx'00')
      *À
      /free

         //ÀEstablish conversion environment
            fromCCSID.CCSID= 819 ;
            toCCSID.CCSID= 0 ;
            hConv= *ALLx'00' ;
            hConv= IConv_Open(toCCSID:fromCCSID);

         //ÀConvert data
            IConv(hConv:
              %Addr(@Source):%Addr(SourceSize):
              %Addr(@Source):%Addr(SourceSize)) ;

         //ÀClose conversion environment
            IConv_Close(hConv) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀGenerate Random Signature
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_GenSignature...
     P                 B
     D                 PI            16A
      *À
     D Hash            DS
     D  Pointer                        *   INZ(%Addr(Hash))
     D  TimeStamp                      Z
     D  Random                        8F
      *À
      *ÀBuilt-in
     D MathFunction...
     D                 PR                  EXTPROC('CEERAN0')
     D  Seed                         20U 0
     D  Output                        8F
     D  Error                        12A   OPTIONS(*OMIT)
      *À
      *ÀWork fields
     D RndSeed         S             20U 0 STATIC
      *À
      /free

         //ÀProduce a random number
            MathFunction(RndSeed:Random:*OMIT) ;

         //ÀGenerate new signature
            TimeStamp= %TimeStamp() ;

         //ÀFinished
            RETURN Utility_MD5Hash(%Addr(Hash):%Size(Hash)) ;

      /end-free
      *À
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCombine Hash Value
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_CombineHash...
     P                 B
     D                 PI            10I 0
     D  Result                       10I 0
     D  @Data                          *   CONST
     D  Length                       10U 0 CONST
      *À
     D Input           DS                  QUALIFIED
     D  Byte1                  1      1A
     D  Byte2                  2      2A
     D  Byte3                  3      3A
     D  Byte4                  4      4A
     D  Byte5                  5      5A
     D  Byte6                  6      6A
     D  Byte7                  7      7A
     D  Byte8                  8      8A
      *À
     D  Hex                    1     16A
      *À
     D  High                   1      4I 0
     D  c                      5      8I 0
      *À
     D Hash            DS                  QUALIFIED
     D  All                    1      8I 0
     D  Low                    5      8I 0
      *À
      /free

         //ÀInitialise
            Input.hex= *ALLx'00' ;

         //ÀFetch input if required
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
               Input.Hex= Utility_MD5Hash(@Data:Length) ;
            ENDSL ;

         //ÀMultiply up by 37 and truncate result
            Hash.All= 0 ;
            Hash.Low= Result ;
            Hash.All*= 37 ;
            Hash.All+= Input.c ;
            Result= Hash.Low ;

         //ÀFinished
            RETURN Result ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCopy with pad
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_MemCpyPad...
     P                 B
     D                 PI
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  Pad                           1A   VALUE OPTIONS(*NOPASS)
      *À
     D                 DS
     D PadChar                 1      1A
     D PadVal                  1      1U 0
      *À
      /free

         //ÀExit at once with zero size
            IF (TargetSize = 0) ;
               RETURN ;
            ENDIF ;

         //ÀExit at once with invalid size
            IF (TargetSize < 0) ;
               Throw('TargetSize can not be negative') ;
            ENDIF ;

         //ÀError with invalid size
            IF (SourceSize < 0) ;
               Throw('SourceSize can not be negative') ;
            ENDIF ;

         //ÀCopy only as much data as will fit
            IF (TargetSize <= SourceSize) ;
               Utility_MemCpy(@Target:@Source:TargetSize) ;
               RETURN ;
            ENDIF ;

         //ÀCopy all data available
            Utility_MemCpy(@Target:@Source:SourceSize) ;

         //ÀPad if requested
            IF (%Parms() >= 5) ;
               PadChar= Pad ;
               Utility_MemSet(
                 @Target+SourceSize:PadVal:TargetSize-SourceSize) ;
            ENDIF ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInclude
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Include...
     P                 B
     D                 PI
     D  Template                      1A   OPTIONS(*VARSIZE)
     D p@SubClass                      *   CONST OPTIONS(*NOPASS)
      *À
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      *À
     D @Entry          S               *
     D Entry           DS                  QUALIFIED BASED(@Entry)
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      *À
     D LoadClass       PR                  EXTPGM(Header.LibPgm)
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *À
     D @SubClass       S               *
      *À
     D MsgDta          DS                  QUALIFIED
     D  SigRqs                       16A
     D  SigFnd                       16A
     D  Type                        126A   VARYING
      *À
     D Package         DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  Size                         10I 0
     D                               12A
      *À
     D @PkgEntry       S               *
     D PkgEntry        DS                  QUALIFIED BASED(@PkgEntry)
     D  @Addr                          *
      *À
     D p               S             10I 0
      *À
     D PkgEntryTemplate...
     D                 S              1A   BASED(PkgEntry.@Addr)
      *À
      /free

         //ÀPick up template address
            @Header= %Addr(Template) ;

         //ÀPick up optional parameter
            IF (%Parms() >= 2) ;
               @SubClass= p@SubClass ;
            ENDIF ;

         //ÀCheck Template
            SELECT ;

         //ÀStandard Template
            WHEN (Header.Signature = TemplateSignature) ;
               EXSR StandardTemplate ;

         //ÀPackage Template
            WHEN (Header.Signature = PackageSignature) ;
               EXSR PackageTemplate ;

         //ÀStandard Template but already initialised
            WHEN (Header.Signature = TemplateSignatureInz) ;

         //ÀPackage Template but already initialised
            WHEN (Header.Signature = PackageSignatureInz) ;

         //ÀNot recognised
            OTHER ;
               MsgDta.SigRqs= TemplateSignature ;
               MsgDta.SigFnd= Header.Signature ;
               MsgDta.Type= 'Include Template' ;
               Throw(MsgDta:'DLL0006':'DLLMSGF') ;
            ENDSL ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀStandard Template
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR StandardTemplate ;

         //ÀCheck that it has the correct size
            IF (%Rem(Header.Size-%Size(Header):%Size(Entry)) <> 0) ;
               Throw('Include template has an incorrect length') ;
            ENDIF ;

         //ÀLoad class
            LoadClass(@Header:@SubClass) ;

         //ÀMark as initialised
            Header.Signature= TemplateSignatureInz ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀPackage Template
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR PackageTemplate ;

         //ÀCheck that it has the correct size
            IF (%Rem(Package.Size-%Size(Package):%Size(PkgEntry)) <> 0) ;
               Throw('Include Package template has an incorrect length') ;
            ENDIF ;

         //ÀPoint to first entry
            @PkgEntry= %Addr(Package)+%Size(Package) ;

         //ÀLoop through all entries
            FOR p= 1 TO %Int((Package.Size-%Size(Package))/
                          %Size(PkgEntry)) ;

            //ÀInclude the contents of the template
               include(PkgEntryTemplate:@SubClass) ;

            //ÀPoint to next entry
               @PkgEntry+= %Size(PkgEntry) ;

         //ÀLoop
            ENDFOR ;

         //ÀMark as initialised
            Package.Signature= PackageSignatureInz ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProduce MD5 Hash
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_MD5Hash...
     P                 B
     D                 PI            16A
     D  @Source                        *   VALUE
     D  Size                         10U 0 VALUE
      *À
     D Controls        DS            96
     D  Function                      5U 0 INZ(5)
     D  HashAlgorithm                 1A   INZ(x'00')
     D  Sequence                      1A   INZ(x'00')
     D  DataLength                   10U 0
     D  OutputType                    1A   INZ(x'00')
     D  Reserved1                     7A   INZ(*ALLx'00')
     D  @HashContext                   *   INZ(%Addr(HashWorkArea))
     D HashWorkArea    S             96A   INZ(*LOVAL)
      *À
     D @Output         S               *   INZ(%Addr(Output))
     D Output          S             16A
      *À
     D APICipher...
     D                 PR                  EXTPROC('_CIPHER')
     D  Receiver                       *   VALUE
     D  Controls                       *   VALUE
     D  Source                         *   VALUE
      *À
      /free

         //ÀSet data length
            DataLength= Size;

         //ÀGenerate MD5 hash
            APICipher(%Addr(@Output):%Addr(Controls):%Addr(@Source));

         //ÀFinished
            RETURN Output;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀNext Higher Power Of Two
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_NextHigherPowerOfTwo...
     P                 B
     D                 PI            20I 0
     D  x                            20I 0 VALUE
      *À
      /free

            x= x-1 ;
            x= %BitOR(x:%Int(x/2)) ;
            x= %BitOR(x:%Int(x/4)) ;
            x= %BitOR(x:%Int(x/8)) ;
            x= %BitOR(x:%Int(x/16)) ;
            x= %BitOR(x:%Int(x/32)) ;
            x= %BitOR(x:%Int(x/64)) ;
            x+= 1 ;

         //ÀFinished
            RETURN x ;

      /end-free
      *À
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPocedureIndexEntry: Compare entries
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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

         //ÀPick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.Name < B.Name) ;
               RETURN -1 ;
            WHEN (A.Name > B.Name) ;
               RETURN +1 ;
            ENDSL ;

         //ÀFinished
            RETURN 0 ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndexEntry: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P PrcIdxEntryDlt...
     P                 B
     D                 PI
     D  @                              *   VALUE
      *À
      /free

         //ÀTrash the object itself
            Utility_MemSet(@:x'FF':%Size(PrcIdxEntry_)) ;
            DEALLOC @ ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀFinished
            RETURN Utility_SignatureCheck(@:
                     ProcedureIndexSignature:'ProcedureIndex') ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Create a ProcedureIndex
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexCrt...
     P                 B
     D                 PI              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      *À
      /free

         //ÀAllocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= ProcedureIndexSignature ;

         //ÀInitialise
            this.@Prcs= ZIndexCrt(%pAddr(PrcIdxEntryCompare)) ;
            this.@Cache= TemplateCacheCrt() ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= ProcedureIndexSignatureCheck(@) ;

         //ÀTrash internals
            ZIndexClr(this.@Prcs:%pAddr(PrcIdxEntryDlt)) ;
            ZIndexDlt(this.@Prcs) ;

            TemplateCacheDlt(this.@Cache) ;

         //ÀTrash the object itself
            Utility_MemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         //ÀFinished
            RETURN @ ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
     D  @Addr                          *   PROCPTR CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(PrcIdxEntry_)
     D                                     BASED(@Entry)
      *À
      /free

         //ÀPick up object
            @this= ProcedureIndexSignatureCheck(@) ;

         //ÀBuild new entry
            @Entry= %Alloc(%Size(Entry)) ;
            Entry.Name= Name ;
            Entry.@Addr= @Addr ;

         //ÀAdd it to the index
            ZIndexAdd(this.@Prcs:@Entry) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Retrieve procedure address
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexRtv...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(PrcIdxEntry_)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(PrcIdxEntry_)
     D                                     BASED(@Entry)
      *À
      /free

         //ÀPick up object
            @this= ProcedureIndexSignatureCheck(@) ;

         //ÀSet up search
            Search.Name= Name ;

         //ÀFetch entry
            @Entry= ZIndexRtv(this.@Prcs:@Search) ;

         //ÀError if not found
            IF (@Entry = null) ;
               Throw('Procedure '+Name+' not found.') ;
            ENDIF ;

         //ÀFinished
            RETURN Entry.@Addr ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ProcedureIndexLink...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Template                      *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ProcedureIndex_)
     D                                     BASED(@this)
      *À
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      *À
     D @Entry          S               *
     D Entry           DS                  QUALIFIED BASED(@Entry)
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      *À
     D j               S             10I 0
     D EntryCount      S             10I 0
     D Hash            S             16A
      *À
      /free

         //ÀPick up object
            @this= ProcedureIndexSignatureCheck(@) ;

         //ÀPoint at template
            @Header= @Template ;

         //ÀCheck Template
            EXSR CheckTemplate ;

         //ÀRetrieve cached template if possible
            IF (TemplateCacheRtv(this.@Cache:@Header) = true) ;
               RETURN ;
            ENDIF ;

         //ÀCalculate hash
            Hash= Utility_MD5Hash(@Header:Header.Size) ;

         //ÀPoint at first entry
            @Entry= @Header+%Size(Header) ;

         //ÀProcess all entries
            FOR j= 1 TO EntryCount ;

            //ÀFetch address
               Entry.@Addr= ProcedureIndexRtv(@this:Entry.Name) ;

            //ÀPoint at next entry
               @Entry+= %Size(Entry) ;

         //ÀLoop
            ENDFOR ;

         //ÀCache the finished version
            TemplateCacheAdd(this.@Cache:@Header:Hash) ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck template
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CheckTemplate ;

            //ÀIt must have the correct signature
               IF (Header.Signature <> TemplateSignature) ;
                  Utility_SignatureCheck(@Header:TemplateSignature:
                    'Include Template') ;
               ENDIF ;

            //ÀCheck that it has the correct size
               IF (%Rem(Header.Size-%Size(Header):%Size(Entry)) <> 0) ;
                  Throw('Badly formed template length') ;
               ENDIF ;

            //ÀConvert size to an entry count
               EntryCount= (Header.Size-%Size(Header))/%Size(Entry) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSignature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Utility_SignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  Signature                    16A   CONST
     D  Type                        126A   VARYING CONST
      *À
     D Possible        DS                  BASED(@) QUALIFIED
     D  Signature                    16A
      *À
     D MsgDta          DS                  QUALIFIED
     D  SigRqs                       16A
     D  SigFnd                       16A
     D  Type                        126A   VARYING
      *À
      /free

         //ÀDecide what to do
            SELECT ;

         //ÀNo error if all is well
            WHEN (@ <> null) AND (Possible.Signature = Signature) ;

         //ÀNull pointer
            WHEN (@ = null) ;
              MsgDta.SigRqs= Signature ;
              MsgDta.SigFnd= *ALLx'00' ;
              MsgDta.Type= Type ;
              Throw(MsgDta:'DLL0005':'DLLMSGF') ;

         //ÀWrong signature
            OTHER ;
              MsgDta.SigRqs= Signature ;
              MsgDta.SigFnd= Possible.Signature ;
              MsgDta.Type= Type ;
              Throw(MsgDta:'DLL0006':'DLLMSGF') ;
            ENDSL ;

         //ÀFinished
            RETURN @ ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplate Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateName...
     P                 B
     D                 PI           126A   VARYING
     D  @Template                      *   CONST
      *À
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      *À
      /free

         //ÀPoint at template
            @Header= @Template ;

         //ÀIt must have the correct signature
            IF (Header.Signature <> TemplateSignature) ;
               Utility_SignatureCheck(@Header:TemplateSignature:
                 'Include Template') ;
            ENDIF ;

         //ÀFinished
            RETURN Header.Name ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀThrow program escape message
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Throw...
     P                 B
     D                 PI
     D  oMsgDta                     512A   VARYING CONST OPTIONS(*NOPASS)
     D  oMsgId                        7A   CONST OPTIONS(*NOPASS:*OMIT)
     D  oMsgFil                      10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  oMsgLib                      10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  oStkCnt                      10I 0 CONST OPTIONS(*NOPASS:*OMIT)
      *À
      *ÀMessaging control fields
     D MsgID           S              7A   INZ('CPF9897')
     D MsgFileLib      S             20A   INZ('QCPFMSG   *LIBL')
     D MsgDta          S            512A
     D MsgDtaLen       S             10I 0 INZ(0)
     D MsgType         S             10A   INZ('*ESCAPE')
     D MsgStk          S             10A   INZ('*')
     D MsgStkCnt       S             10I 0 INZ(1)
     D MsgKey          S              4A   INZ(*BLANKS)
      *À
      *ÀSend Program Message API
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
      *À
      *ÀMove Program Message API
     D QooMovPgmMsg...
     D                 PR                  EXTPGM('QMHMOVPM')
     D  MsgKey                        4A   CONST
     D  MsgTypes                     10A   DIM(4) OPTIONS(*VARSIZE)
     D                                     CONST
     D  NumMsgTypes                  10I 0 CONST
     D  ToStack                      10A   CONST
     D  ToStackCnt                   10I 0 CONST
     D  ErrorCode                     8A   OPTIONS(*VARSIZE)
      *À
      *ÀNull error structure
     D QooErrorNull...
     D                 DS                  QUALIFIED
     D  BytesProv                    10I 0 INZ(0)
     D  BytesAvail                   10I 0 INZ(0)
      *À
      *ÀRetrieve Call Stack API
     D QooRtvCallStk   PR                  EXTPGM('QWVRCSTK')
     D  Info                        256A   OPTIONS(*VARSIZE)
     D  InfoLen                      10I 0
     D  Format1                       8A
     D  JobInfo                      56A
     D  Format2                       8A
     D  Error                         8A   OPTIONS(*VARSIZE)
      *À
      *À Call Stack Job Information Structure
     D JobIdInf        DS                  QUALIFIED
     D  QName                        26A   INZ('*')
     D  IntID                        16A
     D                                2A   INZ(*LOVAL)
     D  ThreadInd                    10I 0 INZ(1)
     D  Thread                        8A   INZ(*LOVAL)
      *À
      *À Call Stack Data
     D @Info           S               *
     D Info            DS                  QUALIFIED BASED(@Info)
     D  BytRtn                       10I 0
     D  BytAvl                       10I 0
     D  EntriesInThrd                10I 0
     D  EntryOffset                  10I 0
     D  EntryCount                   10I 0
     D  ThreadID                      8A
     D  Status                        1A
      *À
      *ÀCall Stack Entry Structure
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
      *À
      *ÀCall Stack Procedure Name
     D @ProcName       S               *
     D ProcName        S            126A   BASED(@ProcName)
     D PepMarker       S             10A
      *À
     D Size            S             10I 0
      *À
     D j               S             10I 0
     D CountBack       S             10I 0
      *À
     D CSTK0100        S              8A   INZ('CSTK0100')
     D JIDF0100        S              8A   INZ('JIDF0100')
      *À
      *ÀPrototype for call to resend api
     D QooResErrMsg...
     D                 PR                  EXTPGM('QMHRSNEM')
     D  MsgKey                        4A   CONST
     D  ErrorCode                     8A   OPTIONS(*VARSIZE)
     D  ToStk                        38A   OPTIONS(*VARSIZE)
     D  ToStkLen                     10I 0 CONST
     D  ToStkFmt                      8A   CONST
     D  FrmStk                       16A   CONST
     D  FrmStkCnt                    10I 0 CONST
      *À
     D RSNM0100        S              8A   INZ('RSNM0100')
      *À
     D ToCallStk       DS                  QUALIFIED
     D  StkCnt                       10I 0
     D  Qual                         20A   INZ('*NONE     *NONE     ')
     D  IdLen                        10I 0 INZ(10)
     D  Id                           10A   INZ('*')
      *À
      /free

         //ÀMake some space for the info block
            Size= %Size(Info)+8 ;
            @Info= Utility_AllocateAuto(Size) ;

         //ÀFetch call stack info for correct sizing details
            QooRtvCallStk(Info:Size:
              CSTK0100:JobIdInf:JIDF0100:QooErrorNull) ;

         //ÀMake sure there is enough room for everything we want
            Size= %Size(Info)+Info.BytAvl ;
            @Info= Utility_AllocateAuto(Size) ;

         //ÀFetch all available call stack information
            QooRtvCallStk(Info:Size:
              CSTK0100:JobIdInf:JIDF0100:QooErrorNull) ;

         //ÀDecide which level to send the message to
            SELECT ;

         //ÀUser specified level
            WHEN (%Parms() >= 5) AND (%Addr(oStkCnt) <> null) ;
               CountBack= %Abs(oStkCnt) ;

         //ÀThrow() used, so back two levels
            WHEN (%Parms() = 0) ;
               CountBack= 2 ;

         //ÀDefault is back two levels
            OTHER ;
               CountBack= 2 ;
            ENDSL ;

         //ÀExceeded stack depth
            IF (CountBack > Info.EntryCount) ;
               EXSR BeyondStackDepth ;
            ENDIF ;

         //ÀThis is the actual number of call levels to correct for
            MsgStkCnt= 0 ;

         //ÀPoint at first entry
            @Entry= @Info+Info.EntryOffset ;

         //ÀLoop back through call levels
            DOW (CountBack > 0) ;

            //ÀAdjust counters
               MsgStkCnt+= 1 ;
               CountBack-= 1 ;

            //ÀPoint at procedure name
               @ProcName= @Entry+Entry.PrcNamOff ;
               PepMarker= ProcName ;

            //ÀDecide what to do
               SELECT ;

            //ÀExceeded stack depth
               WHEN (MsgStkCnt > Info.EntryCount) ;
                  EXSR BeyondStackDepth ;

            //ÀIgnore Program Entry Procedures
               WHEN (PepMarker = '_QRNP_PEP_') ;
                  CountBack+= 1 ;

            //ÀCorrect level has been found
               WHEN (CountBack = 0) ;
                  LEAVE ;
               ENDSL ;

            //ÀPoint at next entry
               @Entry= @Entry+Entry.Length ;

            ENDDO ;

         //ÀNo parameters, so resend any unhandled exception message
            IF (%Parms() = 0)
               OR ((%Parms() = 1) AND (oMsgDta = '')) ;
               EXSR Resend ;
            ENDIF ;

         //ÀMessage data
            IF (%Parms() >= 1) AND (%Addr(oMsgDta) <> null) ;
               MsgDta= oMsgDta ;
               MsgDtaLen= %Len(oMsgDta) ;
            ENDIF ;

         //ÀMessage Id
            IF (%Parms() >= 2) AND (%Addr(oMsgId) <> null) ;
               MsgId= oMsgId ;
            ENDIF ;

         //ÀMessage File
            IF (%Parms() >= 3) AND (%Addr(oMsgFil) <> null) ;
               %SubSt(MsgFileLib:1:10)= oMsgFil ;
            ENDIF ;

         //ÀMessage Library
            IF (%Parms() >= 4) AND (%Addr(oMsgLib) <> null) ;
               %SubSt(MsgFileLib:11:10)= oMsgLib ;
            ENDIF ;

         //ÀCall the API to send the message
            QooSndPgmMsg(
              MsgId:MsgFileLib:MsgDta:MsgDtaLen:
              MsgType:MsgStk:MsgStkCnt:MsgKey:QooErrorNull) ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀResend unhandled escape message
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Resend ;

            //ÀMove outstanding diagnostic messages
               QooMovPgmMsg(' ':'*DIAG':1:'*':MsgStkCnt:QooErrorNull) ;

            //ÀSet 'to' call stack count
               ToCallStk.StkCnt= MsgStkCnt ;

            //ÀDetect any errors
               MONITOR ;

               //ÀResend error messages
                  QooResErrMsg(' ':QooErrorNull:
                     ToCallStk:%Size(ToCallStk):RSNM0100:
                     '*':1) ;

               //ÀFinished
                  RETURN ;

               ON-ERROR ;
               ENDMON ;

         //ÀSignal that Throw() failed
            MsgId= 'DLL0002' ;
            MsgFileLib= 'DLLMSGF   *LIBL' ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀBeyond Stack Depth
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR BeyondStackDepth ;

            //ÀSignal that Throw() failed
               MsgId= 'DLL0003' ;
               MsgFileLib= 'DLLMSGF   *LIBL' ;
               MsgStkCnt= 1 ;

            //ÀCall the API to send the message
               QooSndPgmMsg(
                 MsgId:MsgFileLib:MsgDta:MsgDtaLen:
                 MsgType:MsgStk:MsgStkCnt:MsgKey:QooErrorNull) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
