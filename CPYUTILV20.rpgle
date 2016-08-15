      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConstants
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
      *ÀStandard Template Signature
     D TemplateSignature...
     D                 C                   CONST(x'-
     D                                     A7569D265BDE4B49-
     D                                     5EB2B2E466CF1B79')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀLoad Utilities
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D DLLUtility      PR                  EXTPGM('DLLUTILV20')
     D  Template                      1A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀUtility
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D @DLLUtility...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ(*BLANKS)
     D                               10I 0 INZ(%Size(@DLLUtility))
     D                              126A   VARYING INZ(
     D                                     'UtilityV20')
     D                                7A
      *À
     D  @BinarySearch...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_BinarySearch')
      *À
     D  @Catch...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_Catch')
      *À
     D  @CombineHash...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_CombineHash')
      *À
     D  @CvtToASCII...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_CvtToASCII')
      *À
     D  @CvtToBase64...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_CvtToBase64')
      *À
     D  @CvtToEBCDIC...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_CvtToEBCDIC')
      *À
     D  @GenSignature...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_GenSignature')
      *À
     D  @MemCpyPad...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_MemCpyPad')
      *À
     D  @Include...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_Include')
      *À
     D  @MD5Hash...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_MD5Hash')
      *À
     D  @NextHigherPowerOfTwo...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_NextHigherPowerOfTwo')
      *À
     D  @ProcedureIndexSignatureCheck...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ProcedureIndexSignatureCheck')
      *À
     D  @ProcedureIndexCrt...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ProcedureIndexCrt')
      *À
     D  @ProcedureIndexDlt...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ProcedureIndexDlt')
      *À
     D  @ProcedureIndexAdd...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ProcedureIndexAdd')
      *À
     D  @ProcedureIndexRtv...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ProcedureIndexRtv')
      *À
     D  @ProcedureIndexLink...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ProcedureIndexLink')
      *À
     D  @SignatureCheck...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_SignatureCheck')
      *À
     D  @TemplateName...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_TemplateName')
      *À
     D  @Throw...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     '_Throw')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Allocate Automatic Storage API
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_AllocateAuto...
     D                 PR              *   EXTPROC('_MODASA')
     D  Size                         10U 0 VALUE
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
      *ÀBinary Search on a Sorted Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_BinarySearch...
     D                 PR              N
     D                                     EXTPROC(@DLLUtility.
     D                                     @BinarySearch)
     D  @Search                        *   CONST
     D  @Data                          *   CONST
     D  ArraySize                    10I 0 CONST
     D  ElementSize                  10I 0 CONST
     D  @Compare                       *   PROCPTR CONST
     D  @Element                       *
     D  FoundIndex                   10I 0
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCatch unhandled program escape message
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Catch...
     D                 PR              N
     D                                     EXTPROC(@DLLUtility.
     D                                     @Catch)
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
     D                                     EXTPROC(@DLLUtility.
     D                                     @CombineHash)
     D  Result                       10I 0
     D  @Data                          *   CONST
     D  Length                       10U 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvert to ASCII
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtToASCII...
     D                 PR
     D                                     EXTPROC(@DLLUtility.
     D                                     @CvtToASCII)
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvert To Base64
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtToBase64...
     D                 PR              N
     D                                     EXTPROC(@DLLUtility.
     D                                     @CvtToBase64)
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D oCodes                         2A   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvert to EBCDIC
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtToEBCDIC...
     D                 PR
     D                                     EXTPROC(@DLLUtility.
     D                                     @CvtToEBCDIC)
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀGenerate Random Signature
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_GenSignature...
     D                 PR            16A
     D                                     EXTPROC(@DLLUtility.
     D                                     @GenSignature)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCopy with pad
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemCpyPad...
     D                 PR
     D                                     EXTPROC(@DLLUtility.
     D                                     @MemCpyPad)
     D  @Target                        *   VALUE
     D  TargetSize                   10I 0 VALUE
     D  @Source                        *   VALUE
     D  SourceSize                   10I 0 VALUE
     D  Pad                           1A   VALUE OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Convert to Hexadecimal x'F7' from Characters "F7"
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtChrToHex...
     D                 PR                  EXTPROC('cvtch')
     D  HexResult                 32767A   OPTIONS(*VARSIZE)
     D  ChrSource                 65534A   OPTIONS(*VARSIZE)
     D  ChrSourceLen                 10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Convert to Characters "F7" from Hexadecimal x'F7'
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_CvtHexToChr...
     D                 PR                  EXTPROC('cvthc')
     D  ChrResult                 65534A   OPTIONS(*VARSIZE)
     D  HexSource                 32767A   OPTIONS(*VARSIZE)
     D  ChrResultLen                 10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInclude
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Include...
     D                 PR
     D                                     EXTPROC(@DLLUtility.
     D                                     @Include)
     D  Template                      1A   OPTIONS(*VARSIZE)
     D  @SubClass                      *   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProduce MD5 Hash
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MD5Hash...
     D                 PR            16A
     D                                     EXTPROC(@DLLUtility.
     D                                     @MD5Hash)
     D  @Source                        *   VALUE
     D  Size                         10U 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀNext Higher Power Of Two
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_NextHigherPowerOfTwo...
     D                 PR            20I 0
     D                                     EXTPROC(@DLLUtility.
     D                                     @NextHigherPowerOfTwo)
     D  Input1                       20I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Search memory block Buffer for character Char
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemChr...
     D                 PR              *   EXTPROC('_MEMCHR')
     D  @Buffer                        *   VALUE
     D  Char                         10I 0 VALUE
     D  Length                       10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Compare memory block
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemCmp...
     D                 PR            10I 0 EXTPROC('__memcmp')
     D  @BufferA                       *   VALUE
     D  @BufferB                       *   VALUE
     D  Length                       10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Copy memory block
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemCpy...
     D                 PR              *   EXTPROC('_MEMMOVE')
     D  @Target                        *   VALUE
     D  @Source                        *   VALUE
     D  Length                       10U 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Compare memory block but ignore case
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemCmpIgnCse...
     D                 PR            10I 0 EXTPROC('__memicmp')
     D  @BufferA                       *   VALUE
     D  @BufferB                       *   VALUE
     D  Length                       10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAPI: Set contents of memory block
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_MemSet...
     D                 PR              *   EXTPROC('__memset')
     D  @Target                        *   VALUE
     D  Char                          3U 0 VALUE
     D  Length                       10U 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexSignatureCheck...
     D                 PR              *
     D                                     EXTPROC(@DLLUtility.
     D                                     @ProcedureIndexSignatureCheck)
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Create
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexCrt...
     D                 PR              *
     D                                     EXTPROC(@DLLUtility.
     D                                     @ProcedureIndexCrt)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexDlt...
     D                 PR              *
     D                                     EXTPROC(@DLLUtility.
     D                                     @ProcedureIndexDlt)
     D  @                              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexAdd...
     D                 PR
     D                                     EXTPROC(@DLLUtility.
     D                                     @ProcedureIndexAdd)
     D  @this                          *   CONST
     D  Name                        126A   VARYING CONST
     D  @Addr                          *   PROCPTR CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Retrieve
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexRtv...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@DLLUtility.
     D                                     @ProcedureIndexRtv)
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedureIndex: Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ProcedureIndexLink...
     D                 PR
     D                                     EXTPROC(@DLLUtility.
     D                                     @ProcedureIndexLink)
     D  @this                          *   CONST
     D  @Template                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀQSort
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_QSort...
     D                 PR
     D                                     EXTPROC('qsort')
     D  @Data                          *   VALUE
     D  ArraySize                    10U 0 VALUE
     D  ElementSize                  10U 0 VALUE
     D  @Comparison                    *   PROCPTR VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSignature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_SignatureCheck...
     D                 PR              *
     D                                     EXTPROC(@DLLUtility.
     D                                     @SignatureCheck)
     D  @Pointer                       *   CONST
     D  Signature                    16A   CONST
     D  Type                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplate Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Utility_TemplateName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@DLLUtility.
     D                                     @TemplateName)
     D  @Template                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀThrow
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Throw...
     D                 PR
     D                                     EXTPROC(@DLLUtility.
     D                                     @Throw)
     D  MsgDta                      512A   VARYING CONST OPTIONS(*NOPASS)
     D  MsgId                         7A   CONST OPTIONS(*NOPASS:*OMIT)
     D  MsgFil                       10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  MsgLib                       10A   CONST OPTIONS(*NOPASS:*OMIT:*TRIM)
     D  StkCnt                       10I 0 CONST OPTIONS(*NOPASS:*OMIT)
      *À
