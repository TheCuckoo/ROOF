     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO)
     H BNDDIR('QC2LE')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedures
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *ÀCopy in required prototypes
     D/COPY RAYLIB/QDLLSRCV20,CPYUTILV20
     D/COPY RAYLIB/QDLLSRCV20,CPYOBJECT
     D/COPY RAYLIB/QDLLSRCV20,PKGCOLLECT
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀDefinitions
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *ÀString Instance Structure
     D String_...
     D                 DS                  QUALIFIED ALIGN BASED(@NULL)
     D   #Object                           LIKE(Object_)
     D  @Data                          *
     D  Size                         10I 0
     D  Capacity                     10I 0
     D                                8A
      *
     D StringParm_...
     D                 DS                  QUALIFIED ALIGN BASED(@NULL)
     D  @Data                          *
     D  Size                         10I 0
     D  Capacity                     10I 0
     D  Text                        510A   VARYING
      *
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Provide a Comparator for case insensitive sorting
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D String_CASE_INSENSITIVE_ORDER...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Decode parameter as a String if possible
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringParm...
     D                 PR
     D  @Parm                          *   CONST
     D  StringParm                         LIKEDS(StringParm_)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Class definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringClass...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castString...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfString...
     D                 PR              N
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newString...
     D                 PR              *
     D  @String                        *   CONST OPTIONS(*STRING:*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Initialise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringInitialise...
     D                 PR
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Finalise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringFinalise...
     D                 PR
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀDelete an instance
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringDlt...
     D                 PR              *
     D  @String                        *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Append
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringAppend...
     D                 PR
     D  @this                          *   CONST
     D  @String                        *   CONST OPTIONS(*STRING)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Append Bytes
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringAppendBytes...
     D                 PR
     D  @this                          *   CONST
     D  @Source                        *   CONST
     D  Size                         10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Retrieve Capacity
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringCapacity...
     D                 PR            10I 0
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Character At specified Index
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringCharAt...
     D                 PR             1A
     D  @this                          *   CONST
     D  Index                        10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Change Capacity
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringChgCapacity...
     D                 PR
     D  @this                          *   CONST
     D  Capacity                     10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringClear...
     D                 PR
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Clone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringClone...
     D                 PR              *
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: CompareTo
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringCompareTo...
     D                 PR            10I 0
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: CompareTo Ignore Case
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringCompareToIgnoreCase...
     D                 PR            10I 0
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Ends With
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringEndsWith...
     D                 PR              N
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringEquals...
     D                 PR              N
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Equals Ignore Case
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringEqualsIgnoreCase...
     D                 PR              N
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringHashCode...
     D                 PR            10I 0
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Insert
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringInsert...
     D                 PR
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Test if empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringIsEmpty...
     D                 PR              N
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Convert to lower case
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringLower...
     D                 PR
     D  @this                          *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
     D  Length                       10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Region Matches
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringRegionMatches...
     D                 PR              N
     D  @this                          *   CONST
     D  StartThis                    10I 0 CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  StartThat                    10I 0 CONST
     D  Length                       10I 0 CONST
     D  IgnoreCase                     N   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringRemove...
     D                 PR
     D  @this                          *   CONST
     D  Index                        10I 0 CONST
     D  Length                       10I 0 VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Replace
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringReplace...
     D                 PR
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
     D  Length                       10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Retrieve Bytes
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringRtvBytes...
     D                 PR
     D  @this                          *   CONST
     D  @Target                        *   CONST
     D  TargetSize                   10I 0 CONST
     D  PadChar                       1A   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Scan
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringScan...
     D                 PR            10I 0
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  Start                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D #Scan           PR            10I 0
     D   Haystack                          LIKEDS(StringParm_)
     D   Needle                            LIKEDS(StringParm_)
     D   Start                       10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Retrieve Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringSize...
     D                 PR            10I 0
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Starts with
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringStartsWith...
     D                 PR              N
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D oIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Substring
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringSubSt...
     D                 PR
     D  @this                          *   CONST
     D  Start                        10I 0 CONST
     D oLength                       10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Convert To ASCII
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringToASCII...
     D                 PR              *
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Convert To EBCDIC
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringToEBCDIC...
     D                 PR              *
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: ToString
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringToString...
     D                 PR              *
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: ToVarying
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringToVarying...
     D                 PR           510A   VARYING
     D  @this                          *   CONST
     D oIndex                        10I 0 CONST OPTIONS(*NOPASS)
     D oLength                       10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Trim
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringTrim...
     D                 PR
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: TrimL
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringTrimL...
     D                 PR
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: TrimR
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringTrimR...
     D                 PR
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Convert to upper case
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringUpper...
     D                 PR
     D  @this                          *   CONST
     D oIndex                        10I 0 CONST OPTIONS(*NOPASS)
     D oLength                       10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *À*ENTRY PLIST Parameters
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('CLSSTRING')
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *À
     D Main            PI
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀStart of executable
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *
      /free

         //ÀThis program uses automatic initialisation
         //ÀEXSR *INZSR ;

         //ÀDecide what to do
            SELECT ;

         //ÀClass: String
            WHEN (ClassLinkName(@Template) = 'String') ;
               ClassLink(StringClass():@Template:@SubClass) ;

         //ÀUnknown name
            OTHER ;
               Throw('Unrecognised class name: '+ClassLinkName(@Template)) ;
            ENDSL ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀAutomatic Initialisation
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR *INZSR ;

            //ÀLoad Utilities
               DLLUtility(@DLLUtility) ;

            //ÀIncludes
               include(@ClsObject) ;
               include(@ClsClass) ;
               include(@ClsInterface) ;
               include(@IfcComparable) ;
               include(@ClsIterate) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *
      *À--------------------------------------------------------------------------------------------
      *ÀString: Provide Comparator for case insensitive sorting
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P String_CASE_INSENSITIVE_ORDER...
     P                 B
     D                 PI              *
      *À
     D @this           S               *   STATIC
      *À
      /free

         //ÀExit if already built
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //ÀUse Generic Comparator function
            Assign(@this:
               newSimpleComparator(%pAddr(StringCompareToIgnoreCase))) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of Procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Decode parameter as a String if possible
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringParm...
     P                 B
     D                 PI
     D  @Parm                          *   CONST
     D  StringParm                         LIKEDS(StringParm_)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Type            S             10I 0
      *À
      /free

         //ÀInitialise
            StringParm.@Data= %Addr(StringParm.Text)+2 ;
            StringParm.Size= 0 ;
            StringParm.Capacity= 128 ;
            StringParm.Text= '' ;

         //ÀTest the parameter
            Type= ClassInstanceOf(StringClass:@Parm) ;

         //ÀNull parameters are converted to empty strings
            IF (Type = CLASS_INSTANCE_NULL) ;
               RETURN ;
            ENDIF ;

         //ÀNot an object, so assume immediate data instead
            IF (Type = CLASS_INSTANCE_NOT_AN_OBJECT) ;
               StringParm.Text= %Str(@Parm:512) ;
               StringParm.Size= %Len(StringParm.Text) ;
               StringParm.Capacity=
                 Utility_NextHigherPowerOfTwo(StringParm.Size) ;
               RETURN ;
            ENDIF ;

         //ÀWatch for errors
            MONITOR ;

            //ÀAttempt to cast the parameter as a String object
               @this= castString(@Parm) ;

         //ÀPass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //ÀPick up information from String object
            StringParm.@Data= this.@Data ;
            StringParm.Size= this.Size ;
            StringParm.Capacity=
              Utility_NextHigherPowerOfTwo(this.Size) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Class Definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringClass...
     P                 B
     D                 PI              *
      *À
      *ÀClass Pointer
     D @this           S               *   STATIC INZ(null)
      *
      *ÀClass Definition Template
     D Template        DS                  QUALIFIED
     D                               16A   INZ('*CLASS*TEMPLATE*')
     D                              126A   VARYING INZ(
     D                                     'String')
     D                               10I 0 INZ(ACCESS_PUB_FIN)
     D                               10I 0 INZ(%Size(Template))
     D                               10I 0 INZ(%Size(String_))
     D                                4A
      *À
     D                              126A   VARYING INZ(
     D                                     'String_CASE_INSENSITIVE_ORDER')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     String_CASE_INSENSITIVE_ORDER))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'castThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     castString))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'instanceOfThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     instanceOfString))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'newThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     newString))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisInitialise')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringInitialise))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisFinalise')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringFinalise))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringDlt))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisAppend')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringAppend))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisAppendBytes')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringAppendBytes))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisCapacity')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringCapacity))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisCharAt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringCharAt))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisChgCapacity')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringChgCapacity))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisClear')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringClear))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisClone')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringClone))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisCompareTo')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringCompareTo))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisCompareToIgnoreCase')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringCompareToIgnoreCase))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisEndsWith')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringEndsWith))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringEquals))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisEqualsIgnoreCase')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringEqualsIgnoreCase))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringHashCode))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisInsert')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringInsert))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisIsEmpty')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringIsEmpty))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisLower')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringLower))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisRegionMatches')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringRegionMatches))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringRemove))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisReplace')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringReplace))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisRtvBytes')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringRtvBytes))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisScan')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringScan))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisSize')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringSize))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisStartsWith')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringStartsWith))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisSubSt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringSubSt))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisToASCII')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringToASCII))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisToEBCDIC')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringToEBCDIC))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisToString')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringToString))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisToVarying')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringToVarying))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisTrim')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringTrim))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisTrimL')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringTrimL))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisTrimR')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringTrimR))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
     D                              126A   VARYING INZ(
     D                                     'thisUpper')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringUpper))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
      /free

         //ÀReturn pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //ÀBuild class definition
            @this= extendsObject(Template) ;

         //ÀInterfaces
            implementsComparable(@this) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castString...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀCast as an instance of this class
            RETURN ClassCast(StringClass():@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfString...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *À
      /free

         //ÀFinished
            RETURN (
              ClassInstanceOf(
                StringClass():
                @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newString...
     P                 B
     D                 PI              *
     D  @Parm                          *   CONST OPTIONS(*STRING:*NOPASS)
      *À
     D s               DS                  LIKEDS(StringParm_)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
      /free

         //ÀForm a new instance of this class
            @this= ClassNewInstance(StringClass()) ;

         //ÀResolve parameter data if applicable
            IF (%Parms() = 0) ;
               StringParm(null:s) ;
            ELSE ;
               StringParm(@Parm:s) ;
            ENDIF ;

         //ÀPick up size
            IF (s.Capacity > this.Capacity) ;
               this.Capacity= s.Capacity ;
               this.@Data= %ReAlloc(this.@Data:this.Capacity) ;
            ENDIF ;

         //ÀInitialise
            this.Size= s.Size ;

         //ÀCopy in initial value if applicable
            IF (this.Size > 0) ;
               Utility_MemCpy(this.@Data:s.@Data:s.Size) ;
            ENDIF ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Initialise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringInitialise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
      /free

         //ÀInvoke superclass method
            @this= superInitialise(StringClass:@) ;

         //ÀInitialise fields
            this.Size= 0 ;
            this.Capacity= 128 ;
            this.@Data= %Alloc(this.Capacity) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Finalise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringFinalise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
      /free

         //ÀCast to this class
            @this= ClassCast(StringClass:@) ;

         //ÀTrash internals
            Utility_MemSet(this.@Data:x'FF':this.Capacity) ;
            DEALLOC(N) this.@Data ;

         //ÀInvoke superclass method
            superFinalise(StringClass():@this) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀDelete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
      /free

         //ÀInstance must be a member of the current class
            ClassInstanceCheck(StringClass():@) ;

         //ÀFinished
            RETURN ObjectDlt(@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Append
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringAppend...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Parm                          *   CONST OPTIONS(*STRING)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Parm            DS                  LIKEDS(StringParm_)
      *À
     D Capacity        S             10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀDecode the parameter
            StringParm(@Parm:Parm) ;

         //ÀQuit if there is nothing to copy
            IF (Parm.Size = 0) ;
               RETURN ;
            ENDIF ;

         //ÀCalculate new capacity
            Capacity=
              Utility_NextHigherPowerOfTwo(this.Size+Parm.Size) ;

         //ÀReallocate storage if required
            IF (Capacity > this.Capacity) ;
               this.Capacity= Capacity ;
               this.@Data= %ReAlloc(this.@Data:this.Capacity) ;
            ENDIF ;

         //ÀAdd the elements
            Utility_MemCpy(this.@Data+this.Size:Parm.@Data:Parm.Size) ;

         //ÀIncrement the size value
            this.Size+= Parm.Size ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Append Bytes
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringAppendBytes...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Source                        *   CONST
     D  Size                         10I 0 CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Parm            DS                  LIKEDS(StringParm_)
      *À
     D Capacity        S             10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀIncrease capacity if required
            StringChgCapacity(@this:this.Size+Size) ;

         //ÀCopy in the supplied data
            Utility_MemCpy(this.@Data+this.Size:@Source:Size) ;

         //ÀAdjust the size
            this.Size+= Size ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Capacity
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringCapacity...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀFinished
            RETURN this.Capacity ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Character At specified Index
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringCharAt...
     P                 B
     D                 PI             1A
     D  @                              *   CONST
     D  Index                        10I 0 CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D @a              S               *
     D a               S              1A   BASED(@a)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀError if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀPoint at character
            @a= this.@Data+Index ;

         //ÀFinished
            RETURN a ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Change Capacity
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringChgCapacity...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Capacity                     10I 0 VALUE
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Required        S             10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀRound up the requested amount
            Capacity= Utility_NextHigherPowerOfTwo(Capacity) ;

         //ÀFind how much capacity is actually required
            Required= Utility_NextHigherPowerOfTwo(this.Size) ;

         //ÀDo not allow the capacity to be set too small
            IF (Capacity < this.Size) ;
               Capacity= Required ;
            ENDIF ;

         //ÀNever go below 128 bytes
            IF (Capacity < 128) ;
               Capacity= 128 ;
            ENDIF ;

         //ÀSet the new capacity value
            this.Capacity= Capacity ;

         //ÀReallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringClear...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀReset the size
            this.Size= 0 ;

         //ÀReset capacity
            this.Capacity= 128 ;

         //ÀReallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity);

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Clone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀFinished
            RETURN newString(@this) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: CompareTo
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringCompareTo...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D that            DS                  LIKEDS(StringParm_)
      *À
     D StrTest         S             10I 0
     D Len             S             10U 0
     D Flag            S              3I 0
      *À
      /free

         //ÀCast to this class
            @this= ClassCast(StringClass:@) ;

         //ÀNull is not allowed here, so fail deliberately via cast
            IF (@that = null) ;
               castString(@that) ;
            ENDIF ;

         //ÀPick up comparison parameter
            StringParm(@that:that) ;

         //ÀDecide what to do
            SELECT ;

         //ÀAvoid detailed checking if the pointers are identical
            WHEN (@this = @that) ;
               RETURN 0 ;

         //ÀEqual Size zero matches regardless of pointers
            WHEN (this.Size = 0) AND (that.Size = 0) ;
               RETURN 0 ;

         //ÀZero size in this String counts as less than
            WHEN (this.Size = 0) ;
               RETURN -1 ;

         //ÀZero size in that String counts as greater than
            WHEN (that.Size = 0) ;
               RETURN +1 ;

         //Àthis is longer than that
            WHEN (this.Size > that.Size) ;
               Flag= +1 ;
               Len= that.Size ;

         //Àthis is shorter than that
            WHEN (this.Size < that.Size) ;
               Flag= -1 ;
               Len= this.Size ;

         //ÀBoth are the same length
            OTHER ;
               Flag= 0 ;
               Len= this.Size ;
            ENDSL ;

         //ÀTest the strings
            StrTest= Utility_MemCmp(this.@Data:that.@Data:Len) ;

         //ÀDecide on the result
            SELECT ;

         //ÀLess than
            WHEN (StrTest < 0) ;
               RETURN -1 ;

         //ÀGreater than
            WHEN (StrTest > 0) ;
               RETURN +1 ;

            ENDSL ;

         //ÀFinished
            RETURN Flag ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Compare To Ignore Case
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringCompareToIgnoreCase...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D that            DS                  LIKEDS(StringParm_)
      *À
     D StrTest         S             10I 0
     D Len             S             10U 0
     D Flag            S              3I 0
      *À
      /free

         //ÀCast to this class
            @this= ClassCast(StringClass:@) ;

         //ÀNull is not allowed here, so fail deliberately via cast
            IF (@that = null) ;
               castString(@that) ;
            ENDIF ;

         //ÀPick up comparison parameter
            StringParm(@that:that) ;

         //ÀDecide what to do
            SELECT ;

         //ÀAvoid detailed checking if the pointers are identical
            WHEN (@this = @that) ;
               RETURN 0 ;

         //ÀEqual Size zero matches regardless of pointers
            WHEN (this.Size = 0) AND (that.Size = 0) ;
               RETURN 0 ;

         //ÀZero size in this String counts as less than
            WHEN (this.Size = 0) ;
               RETURN -1 ;

         //ÀZero size in that String counts as greater than
            WHEN (that.Size = 0) ;
               RETURN +1 ;

         //Àthis is longer than that
            WHEN (this.Size > that.Size) ;
               Flag= +1 ;
               Len= that.Size ;

         //Àthis is shorter than that
            WHEN (this.Size < that.Size) ;
               Flag= -1 ;
               Len= this.Size ;

         //ÀBoth are the same length
            OTHER ;
               Flag= 0 ;
               Len= this.Size ;
            ENDSL ;

         //ÀTest the strings
            StrTest= Utility_MemCmpIgnCse(this.@Data:that.@Data:Len) ;

         //ÀDecide on the result
            SELECT ;

         //ÀLess than
            WHEN (StrTest < 0) ;
               RETURN -1 ;

         //ÀGreater than
            WHEN (StrTest > 0) ;
               RETURN +1 ;

            ENDSL ;

         //ÀFinished
            RETURN Flag ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Ends with
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringEndsWith...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D that            DS                  LIKEDS(StringParm_)
      *À
     D Start           S             10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀDecode the parameter
            StringParm(@that:that) ;

         //ÀCalculate start position
            Start= this.Size-that.Size ;

         //ÀFinished
            RETURN StringStartsWith(@this:@that:Start) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringEquals...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @@                             *   CONST OPTIONS(*STRING)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Type            S             10I 0
      *À
      /free

         //ÀCast to this class
            @this= ClassCast(StringClass:@) ;

         //ÀFetch type
            Type= ClassInstanceOf(StringClass:@@) ;

         //ÀMust be same class
            IF (@@ = null) OR (Type = CLASS_INSTANCE_UNRELATED) ;
               RETURN false ;
            ENDIF ;

         //ÀAvoid detailed checking if the pointers are identical
            IF (@ = @@) ;
               RETURN true ;
            ENDIF ;

         //ÀFinished
            RETURN (StringCompareTo(@:@@) = 0) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Equals Ignore Case
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringEqualsIgnoreCase...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @@                             *   CONST OPTIONS(*STRING)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Type            S             10I 0
      *À
      /free

         //ÀCast to this class
            @this= ClassCast(StringClass:@) ;

         //ÀFetch type
            Type= ClassInstanceOf(StringClass:@@) ;

         //ÀMust be same class
            IF (@@ = null) OR (Type = CLASS_INSTANCE_UNRELATED) ;
               RETURN false ;
            ENDIF ;

         //ÀFinished
            RETURN (StringCompareToIgnoreCase(@:@@) = 0) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringHashCode...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D hash            S             10I 0 INZ(17)
      *À
      /free

         //ÀCast to this class
            @this= ClassCast(StringClass:@) ;

         //ÀCalculate hash value
            Utility_CombineHash(hash:this.@Data:this.Size) ;

         //ÀFinished
            RETURN hash ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Insert
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringInsert...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D that            DS                  LIKEDS(StringParm_)
      *À
     D Index           S             10I 0 INZ(0)
     D Capacity        S             10I 0
     D @Data           S               *
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀPick up optional start parameter
            IF (%Parms() >= 3) ;
               Index= pIndex ;
            ENDIF ;

         //ÀError if the index is out of range (index < 0 or index > size)
            IF ((Index < 0) OR (Index > this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀDecode the parameter
            StringParm(@that:that) ;

         //ÀNothing needs to be done with an empty string
            IF (that.Size = 0) ;
               RETURN ;
            ENDIF ;

         //ÀDecide what to do
            SELECT ;

         //ÀTarget is empty
            WHEN (this.Size = 0) ;
               EXSR DoEmpty ;

         //ÀInsert at start
            WHEN (Index = 0) ;
               EXSR DoStart ;

         //ÀInsert at end
            WHEN (Index = this.Size) ;
               EXSR DoEnd ;

         //ÀInsert in middle
            OTHER ;
               EXSR DoMiddle ;
            ENDSL ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀInsert into empty target string
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoEmpty ;

            //ÀUse append
               StringAppend(@:@that) ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀInsert at start of target string
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoStart ;

            //ÀCalculate new capacity
               Capacity=
                 Utility_NextHigherPowerOfTwo(this.Size+that.Size) ;
               IF (Capacity < this.Capacity) ;
                  Capacity= this.Capacity ;
               ENDIF ;

            //ÀAllocate a work area
               @Data= %Alloc(Capacity) ;

            //ÀCopy in data to be inserted
               Utility_MemCpy(@Data:that.@Data:that.Size) ;

            //ÀCopy in original data
               Utility_MemCpy(@Data+that.Size:this.@Data:this.Size) ;

            //ÀDestroy original data
               DEALLOC(N) this.@Data ;

            //ÀPoint at new data
               this.@Data= @Data ;

            //ÀNew size
               this.Size+= that.Size ;

            //ÀNew capacity
               this.Capacity= Capacity ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀInsert at end of target string
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoEnd ;

            //ÀUse append
               StringAppend(@:@that) ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀInsert in middle of target string
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoMiddle ;

            //ÀCalculate new capacity
               Capacity=
                 Utility_NextHigherPowerOfTwo(this.Size+that.Size) ;
               IF (Capacity < this.Capacity) ;
                  Capacity= this.Capacity ;
               ENDIF ;

            //ÀAllocate a work area
               @Data= %Alloc(Capacity) ;

            //ÀCopy in 'before' data
               Utility_MemCpy(@Data:this.@Data:Index) ;

            //ÀCopy in data to be inserted
               Utility_MemCpy(@Data+Index:that.@Data:that.Size) ;

            //ÀCopy in 'after' data
               Utility_MemCpy(@Data+Index+that.Size:
                      this.@Data+Index:
                      this.Size-Index) ;

            //ÀDestroy original data
               DEALLOC(N) this.@Data ;

            //ÀPoint at new data
               this.@Data= @Data ;

            //ÀNew size
               this.Size+= that.Size ;

            //ÀNew capacity
               this.Capacity= Capacity ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Test if empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringIsEmpty...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀFinished
            RETURN (this.Size = 0) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Convert to lower case
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringLower...
     P                 B
     D                 PI
     D  @                              *   CONST
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D QlgConvertCase  PR                  ExtProc('QlgConvertCase')
     D  ControlBlock                       LIKE(dsControlBlock)
     D  In                            1A
     D  Out                           1A
     D  DataLen                      10I 0
     D  ErrorStr                    200A
      *À
     D dsControlBlock  DS                  QUALIFIED
     D  ReqType                      10I 0 INZ(1)
     D  CCSID                        10I 0 INZ(0)
     D  CaseReq                      10I 0 INZ(1)
     D  Reserved                     10A   INZ(*LOVAL)
      *À
     D dsErrorStr      DS                  QUALIFIED
     D  BtPro                        10I 0 INZ(%Len(dsErrorStr))
     D  BtAvl                        10I 0
     D  EcexpID                       7A
     D  Reserved                      1A   INZ(*LOVAL)
     D  Data                        200A
      *À
     D @From           S               *
     D @To             S               *
     D @Data           S               *
      *À
     D From            S              1A   BASED(@From)
     D To              S              1A   BASED(@To)
      *À
     D Start           S             10I 0
     D Length          S             10I 0
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀDeal with optional start
            IF (%Parms() >= 2) ;
               Start= pStart ;
            ENDIF ;

         //ÀDeal with optional start
            IF (%Parms() >= 3) ;
               Length= pLength ;
            ELSE ;
               Length= this.Size-Start ;
            ENDIF ;

         //ÀError if the start is out of range (start < 0 or start >= size)
            IF ((Start < 0) OR (Start >= this.Size)) ;
               DLL0008.Index= Start ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀRestrict length
            IF (Length > (this.Size-Start)) ;
               Length= this.Size-Start ;
            ENDIF ;

         //ÀQuit now if empty
            IF (this.Size = 0) OR (Length <= 0) ;
               RETURN ;
            ENDIF ;

         //ÀAllocate a work space
            @Data= %Alloc(this.Capacity) ;

         //ÀCopy the data
            Utility_MemCpy(@Data:this.@Data:this.Size) ;

         //ÀPoint to the starting characters
            @From= this.@Data+Start ;
            @To= @Data+Start ;

         //ÀDo case conversion
            QlgConvertCase(dsControlBlock:
              From:
              To:
              Length:
              dsErrorStr) ;

         //ÀTrash old data
            DEALLOC(N) this.@Data ;

         //ÀPoint to new data
            this.@Data= @Data ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Region Matches
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringRegionMatches...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  tOffset                      10I 0 CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  oOffset                      10I 0 CONST
     D  Length                       10I 0 CONST
     D  IgnoreCase                     N   CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D that            DS                  LIKEDS(StringParm_)
      *À
     D StrTest         S             10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀPick up string parameter
            StringParm(@that:that) ;

            SELECT ;

         //ÀNegative offset in this string
            WHEN (tOffset < 0) ;
               RETURN false ;

         //ÀNegative offset in other string
            WHEN (oOffset < 0) ;
               RETURN false ;

         //ÀImpossible to match
            WHEN (tOffset+Length > this.Size) ;
               RETURN false ;

         //ÀImpossible to match
            WHEN (oOffset+Length > that.Size) ;
               RETURN false ;

            ENDSL ;

         //ÀIgnore case if requested
            IF (%Parms() >= 6) AND (IgnoreCase = true) ;
               StrTest= Utility_MemCmpIgnCse(
                   this.@Data+tOffset:that.@Data+oOffset:Length);
            ELSE ;
               StrTest= Utility_MemCmp(
                   this.@Data+tOffset:that.@Data+oOffset:Length);
            ENDIF ;

         //ÀFinished
            RETURN (StrTest = 0) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringRemove...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Index                        10I 0 CONST
     D  Length                       10I 0 VALUE
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D @Data           S               *
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀError if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀQuit with negative or zero lengths
            IF (Length <= 0) ;
               RETURN ;
            ENDIF ;

         //ÀLimit the length
            IF (Index+Length > this.Size) ;
               Length= this.Size-Index ;
            ENDIF ;

         //ÀRemove from middle of target string
            EXSR DoMiddle ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀRemove from middle of target string
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoMiddle ;

            //ÀAllocate a work area
               @Data= %Alloc(this.Capacity) ;

            //ÀCopy in 'before' data
               Utility_MemCpy(@Data:this.@Data:Index) ;

            //ÀCopy in 'after' data
               Utility_MemCpy(@Data+Index:
                      this.@Data+Index+Length:
                      this.Size-Length) ;

            //ÀDestroy original data
               DEALLOC(N) this.@Data ;

            //ÀPoint at new data
               this.@Data= @Data ;

            //ÀNew size
               this.Size-= Length ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Replace
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringReplace...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Index           S             10I 0
     D Length          S             10I 0
      *À
     D that            DS                  LIKEDS(StringParm_)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀDecode the parameter
            StringParm(@that:that) ;

         //ÀPick up optional index parameter
            IF (%Parms() >= 3) ;
               Index= pIndex ;
            ELSE ;
               Index= 0 ;
            ENDIF ;

         //ÀPick up optional length parameter
            IF (%Parms() >= 4) ;
               Length= pLength ;
            ELSE ;
               Length= that.Size ;
            ENDIF ;

         //ÀError if the index is out of range (index < 0 or index > size)
            IF ((Index < 0) OR (Index > this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀRemove existing text if required
            IF (Index < this.Size) AND (Length > 0) ;
               StringRemove(@this:Index:Length) ;
            ENDIF ;

         //ÀInsert replacement text
            IF (that.Size > 0) ;
               StringInsert(@this:@that:Index) ;
            ENDIF ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Retrieve Bytes
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringRtvBytes...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Target                        *   CONST
     D  TargetSize                   10I 0 CONST
     D pPadChar                       1A   CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D PadChar         S              1A   INZ(x'00')
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀPick up optional parameter
            IF (%Parms() >= 4) ;
               PadChar= pPadChar ;
            ENDIF ;

         //ÀCopy out the data
            Utility_MemCpyPad(
              @Target:TargetSize:
              this.@Data:this.Size:
              PadChar) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Scan
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringScan...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Needle          DS                  LIKEDS(StringParm_)
     D Haystack        DS                  LIKEDS(StringParm_)
      *À
     D Start           S             10I 0 INZ(0)
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀPick up optional start parameter
            IF (%Parms() >= 3) ;
               Start= pStart ;
            ENDIF ;

         //ÀDecode the parameter
            StringParm(@that:Needle) ;

         //ÀSet up the search
            Haystack.@Data= this.@Data ;
            Haystack.Size= this.Size ;

         //ÀFinished
            RETURN #Scan(Haystack:Needle:Start) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *ÀInternal scan function
     P #Scan...
     P                 B
     D                 PI            10I 0
     D  this                               LIKEDS(StringParm_)
     D  that                               LIKEDS(StringParm_)
     D  Start                        10I 0 CONST
      *À
     D Byte            S              3U 0 BASED(that.@Data)
      *À
     D @Data           S               *
     D @Found          S               *
     D Char            S             10I 0
     D x               S             10I 0
     D y               S             10I 0
     D Limit           S             10I 0
     D Found           S             10I 0 INZ(-1)
      *À
      /free

         //ÀThe empty string is always considered to be found
            IF (that.Size = 0) ;
               RETURN 0 ;
            ENDIF ;

         //ÀCalculate the limit of the scan
            Limit= this.Size-that.Size-Start+1 ;

         //ÀNo possibility of success
            IF (Limit <= 0) ;
               RETURN -1 ;
            ENDIF ;

         //ÀLoad search values
            Char= Byte ;
            @Data= this.@Data+Start ;

         //ÀStart the scan
            @Found= Utility_MemChr(@Data:Char:Limit) ;
            DOW (@Found <> null) ;

            //ÀQuit if found complete string
               IF (Utility_MemCmp(@Found:that.@Data:that.Size) = 0) ;
                  LEAVE ;
               ENDIF ;

            //ÀNext attempt will be from here
               @Data= @Found+1 ;

            //ÀCalculate new limit
               Limit= this.Size-that.Size+1 ;
               Limit-= (@Data-this.@Data) ;

            //ÀQuit if search can not continue
               IF (Limit <= 0) ;
                  @Found= null ;
                  LEAVE ;
               ENDIF ;

            //ÀScan again
               @Found= Utility_MemChr(@Data:Char:Limit) ;

         //ÀLoop
            ENDDO ;

         //ÀCalculate found index
            IF (@Found <> null) ;
               Found= (@Found-this.@Data) ;
            ENDIF ;

         //ÀFinished
            RETURN Found ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Retrieve Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringSize...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀFinished
            RETURN this.Size ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Starts with
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringStartsWith...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D that            DS                  LIKEDS(StringParm_)
      *À
     D Start           S             10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀDecode the parameter
            StringParm(@that:that) ;

         //ÀPick up optional parameter
            IF (%Parms() >= 3) ;
               Start= pStart ;
            ENDIF ;

         //ÀDecide what to do
            SELECT ;

         //ÀExit if the start is out of range rather than throw an error
            WHEN ((Start < 0) OR (Start >= this.Size)) ;
               RETURN false ;

         //ÀComparing to null is always false
            WHEN (@that = null) ;
               RETURN false ;

         //ÀThe empty string is always a match
            WHEN (that.Size = 0) ;
               RETURN true ;

         //ÀImpossible to match if too long
            WHEN (Start+that.Size > this.Size) ;
               RETURN false ;

            ENDSL ;

         //ÀFinished
            RETURN (Utility_MemCmp(
                      this.@Data+Start:
                      that.@Data:
                      that.Size) = 0) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Substring
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringSubSt...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Start                        10I 0 CONST
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Length          S             10I 0
     D Capacity        S             10I 0
     D @Data           S               *
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀError if the start is out of range (start < 0 or start >= size)
            IF ((Start < 0) OR (Start >= this.Size)) ;
               DLL0008.Index= Start ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀPick up optional parameter
            IF (%Parms() >= 3) ;
               Length= pLength ;
            ELSE ;
               Length= this.Size-Start ;
            ENDIF ;

         //ÀRestrict length
            IF (Start+Length > this.Size) ;
               Length= this.Size-Start ;
            ENDIF ;

         //ÀZero length causes the substring to be empty
            IF (Length <= 0) ;
               StringClear(@) ;
               RETURN ;
            ENDIF ;

         //ÀAllocate new storage
            @Data= %Alloc(this.Capacity) ;

         //ÀCopy substring to new storage
            Utility_MemCpy(@Data:this.@Data+Start:Length) ;

         //ÀTrash old storage
            DEALLOC(N) this.@Data ;

         //ÀSwitch to new storage
            this.@Data= @Data ;
            this.Size= Length ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Convert To ASCII
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringToASCII...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D @MyData         S               *
     D @@MyData        S               *   INZ(%Addr(@MyData))
     D nInLen          S             10I 0
     D nOutLen         S             10I 0
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

         //ÀClone the original string
            @this= StringClone(@) ;

         //ÀSet length of data to convert
            nInLen= this.Size ;
            nOutLen= this.Size ;

         //ÀSet data pointer
            @MyData= this.@Data ;

         //ÀEstablish conversion environment
            fromCCSID.CCSID= 0 ;
            toCCSID.CCSID= 819 ;
            hConv= *ALLx'00' ;
            hConv= IConv_Open(toCCSID:fromCCSID);

         //ÀConvert data
            IConv(hConv:@@MyData:%Addr(nInLen):@@MyData:%Addr(nOutLen)) ;

         //ÀClose conversion environment
            IConv_Close(hConv) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Convert To EBCDIC
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringToEBCDIC...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D @MyData         S               *
     D @@MyData        S               *   INZ(%Addr(@MyData))
     D nInLen          S             10I 0
     D nOutLen         S             10I 0
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

         //ÀClone the original string
            @this= StringClone(@) ;

         //ÀSet length of data to convert
            nInLen= this.Size ;
            nOutLen= this.Size ;

         //ÀSet data pointer
            @MyData= this.@Data ;

         //ÀEstablish conversion environment
            fromCCSID.CCSID= 819 ;
            toCCSID.CCSID= 0   ;
            hConv= *ALLx'00' ;
            hConv= IConv_Open(toCCSID:fromCCSID);

         //ÀConvert data
            IConv(hConv:@@MyData:%Addr(nInLen):@@MyData:%Addr(nOutLen)) ;

         //ÀClose conversion environment
            IConv_Close(hConv) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: ToString
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringToString...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀFinished
            RETURN StringClone(@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: ToVarying
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringToVarying...
     P                 B
     D                 PI           510A   VARYING
     D  @                              *   CONST
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Varying         S            510A   VARYING
     D Start           S             10I 0
     D Length          S             10I 0
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀOptional Starting index
            IF (%Parms() >= 2) ;
               Start= pStart ;
            ELSE ;
               Start= 0 ;
            ENDIF ;

         //ÀOptional Length
            IF (%Parms() >= 3) ;
               Length= pLength ;
            ELSE ;
               Length= this.Size ;
            ENDIF ;

         //ÀSpecial case of empty string
            IF (this.Size = 0) AND (Start = 0) AND (Length = 0) ;
               RETURN '' ;
            ENDIF ;

         //ÀError if the start is out of range (start < 0 or start >= size)
            IF ((Start < 0) OR (Start >= this.Size)) ;
               DLL0008.Index= Start ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀQuit now if empty
            IF (this.Size = 0) OR (Length <= 0) ;
               RETURN '' ;
            ENDIF ;

         //ÀAdjust if too long
            IF (Start+Length > this.Size) ;
               Length= this.Size-Start ;
            ENDIF ;

         //ÀAvoid overruns
            IF (Length > (%Size(Varying)-2)) ;
               Length= %Size(Varying)-2 ;
            ENDIF ;

         //ÀSet length
            %Len(Varying)= Length ;

         //ÀCopy out data
            Utility_MemCpy(%Addr(Varying)+2:this.@Data+Start:Length) ;

         //ÀFinished
            RETURN Varying ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Trim
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringTrim...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
      /free

         //ÀTrim left and right
            StringTrimL(@) ;
            StringTrimR(@) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: TrimL
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringTrimL...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D @Data           S               *
     D Size            S             10I 0
     D Capacity        S             10I 0
     D j               S             10I 0
     D @c              S               *
     D c               S              1A   BASED(@c)
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀIgnore empty string
            IF (this.Size = 0) ;
               RETURN ;
            ENDIF ;

         //ÀPoint at data
            @c= this.@Data ;

         //ÀFind first non-blank character
            j= 0 ;
            DOW (j < this.Size) AND (c = x'40') ;
               j= j+1 ;
               @c= @c+1 ;
            ENDDO ;

         //ÀQuit now if there is no change
            IF (j = 0) ;
               RETURN ;
            ENDIF ;

         //ÀCalculate new size
            Size= this.Size-j ;

         //ÀCalculate new capacity
            Capacity=
              Utility_NextHigherPowerOfTwo(Size) ;
            IF (Capacity < 128) ;
               Capacity= 128 ;
            ENDIF ;

         //ÀAllocate a new workspace
            @Data= %Alloc(Capacity) ;

         //ÀCopy the data
            Utility_MemCpy(@Data:@c:Size) ;

         //ÀTrash old data
            DEALLOC(N) this.@Data ;

         //ÀPoint at new data
            this.@Data= @Data ;

         //ÀSet size and capacity
            this.Size= Size ;
            this.Capacity= Capacity ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: TrimR
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringTrimR...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D Size            S             10I 0
     D Capacity        S             10I 0
     D @c              S               *
     D c               S              1A   BASED(@c)
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀIgnore empty string
            IF (this.Size = 0) ;
               RETURN ;
            ENDIF ;

         //ÀPoint at end of data
            @c= this.@Data+this.Size-1 ;

         //ÀFind last non-blank character
            Size= this.Size ;
            DOW (Size > 0) AND (c = x'40') ;
               Size= Size-1 ;
               @c= @c-1 ;
            ENDDO ;

         //ÀCalculate new capacity
            Capacity=
              Utility_NextHigherPowerOfTwo(Size) ;
            IF (Capacity < 128) ;
               Capacity= 128 ;
            ENDIF ;

         //ÀReallocate the data memory based on the new capacity
            IF (Capacity <> this.Capacity) ;
               this.@Data= %ReAlloc(this.@Data:this.Capacity) ;
            ENDIF ;

         //ÀSet size and capacity
            this.Size= Size ;
            this.Capacity= Capacity ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀString: Convert to upper case
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringUpper...
     P                 B
     D                 PI
     D  @                              *   CONST
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *À
     D QlgConvertCase  PR                  ExtProc('QlgConvertCase')
     D  ControlBlock                       LIKE(dsControlBlock)
     D  In                            1A
     D  Out                           1A
     D  DataLen                      10I 0
     D  ErrorStr                    200A
      *À
     D dsControlBlock  DS                  QUALIFIED
     D  ReqType                      10I 0 INZ(1)
     D  CCSID                        10I 0 INZ(0)
     D  CaseReq                      10I 0 INZ(0)
     D  Reserved                     10A   INZ(*LOVAL)
      *À
     D dsErrorStr      DS                  QUALIFIED
     D  BTPRO                        10I 0 INZ(%Len(dsErrorStr))
     D  BTAVL                        10I 0
     D  EXECPID                       7A
     D  Reserved                      1A   INZ(*LOVAL)
     D  DATA                        200A
      *À
     D @From           S               *
     D @To             S               *
     D @Data           S               *
      *À
     D From            S              1A   BASED(@From)
     D To              S              1A   BASED(@To)
      *À
     D Start           S             10I 0
     D Length          S             10I 0
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
      /free

         //ÀPick up object
            @this= castString(@) ;

         //ÀDeal with optional start
            IF (%Parms() >= 2) ;
               Start= pStart ;
            ENDIF ;

         //ÀDeal with optional start
            IF (%Parms() >= 3) ;
               Length= pLength ;
            ELSE ;
               Length= this.Size-Start ;
            ENDIF ;

         //ÀError if the start is out of range (start < 0 or start >= size)
            IF ((Start < 0) OR (Start >= this.Size)) ;
               DLL0008.Index= Start ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀRestrict length
            IF (Length > (this.Size-Start)) ;
               Length= this.Size-Start ;
            ENDIF ;

         //ÀQuit now if empty
            IF (this.Size = 0) OR (Length <= 0) ;
               RETURN ;
            ENDIF ;

         //ÀAllocate a work space
            @Data= %Alloc(this.Capacity) ;

         //ÀCopy the data
            Utility_MemCpy(@Data:this.@Data:this.Size) ;

         //ÀPoint to the starting characters
            @From= this.@Data+Start ;
            @To= @Data+Start ;

         //ÀDo case conversion
            QlgConvertCase(dsControlBlock:
              From:
              To:
              Length:
              dsErrorStr) ;

         //ÀTrash old data
            DEALLOC(N) this.@Data ;

         //ÀPoint to new data
            this.@Data= @Data ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
