     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO)
     H BNDDIR('QC2LE')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Procedures
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�Copy in required prototypes
     D/COPY RAYLIB/QDLLSRCV20,CPYUTILV20
     D/COPY RAYLIB/QDLLSRCV20,CPYOBJECT
     D/COPY RAYLIB/QDLLSRCV20,PKGCOLLECT
      *�
      *�--------------------------------------------------------------------------------------------
      *�Definitions
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�String Instance Structure
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
      *�--------------------------------------------------------------------------------------------
      *�Prototypes
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Provide a Comparator for case insensitive sorting
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D String_CASE_INSENSITIVE_ORDER...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Decode parameter as a String if possible
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringParm...
     D                 PR
     D  @Parm                          *   CONST
     D  StringParm                         LIKEDS(StringParm_)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Class definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringClass...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castString...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfString...
     D                 PR              N
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newString...
     D                 PR              *
     D  @String                        *   CONST OPTIONS(*STRING:*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Initialise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringInitialise...
     D                 PR
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Finalise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringFinalise...
     D                 PR
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Delete an instance
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringDlt...
     D                 PR              *
     D  @String                        *
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Append
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringAppend...
     D                 PR
     D  @this                          *   CONST
     D  @String                        *   CONST OPTIONS(*STRING)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Append Bytes
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringAppendBytes...
     D                 PR
     D  @this                          *   CONST
     D  @Source                        *   CONST
     D  Size                         10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Retrieve Capacity
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringCapacity...
     D                 PR            10I 0
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Character At specified Index
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringCharAt...
     D                 PR             1A
     D  @this                          *   CONST
     D  Index                        10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Change Capacity
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringChgCapacity...
     D                 PR
     D  @this                          *   CONST
     D  Capacity                     10I 0 VALUE
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Clear
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringClear...
     D                 PR
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Clone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringClone...
     D                 PR              *
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: CompareTo
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringCompareTo...
     D                 PR            10I 0
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: CompareTo Ignore Case
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringCompareToIgnoreCase...
     D                 PR            10I 0
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Ends With
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringEndsWith...
     D                 PR              N
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Equals
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringEquals...
     D                 PR              N
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Equals Ignore Case
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringEqualsIgnoreCase...
     D                 PR              N
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringHashCode...
     D                 PR            10I 0
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Insert
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringInsert...
     D                 PR
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Test if empty
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringIsEmpty...
     D                 PR              N
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Convert to lower case
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringLower...
     D                 PR
     D  @this                          *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
     D  Length                       10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Region Matches
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringRegionMatches...
     D                 PR              N
     D  @this                          *   CONST
     D  StartThis                    10I 0 CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  StartThat                    10I 0 CONST
     D  Length                       10I 0 CONST
     D  IgnoreCase                     N   CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringRemove...
     D                 PR
     D  @this                          *   CONST
     D  Index                        10I 0 CONST
     D  Length                       10I 0 VALUE
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Replace
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringReplace...
     D                 PR
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
     D  Length                       10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Retrieve Bytes
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringRtvBytes...
     D                 PR
     D  @this                          *   CONST
     D  @Target                        *   CONST
     D  TargetSize                   10I 0 CONST
     D  PadChar                       1A   CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Scan
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringScan...
     D                 PR            10I 0
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  Start                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D #Scan           PR            10I 0
     D   Haystack                          LIKEDS(StringParm_)
     D   Needle                            LIKEDS(StringParm_)
     D   Start                       10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Retrieve Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringSize...
     D                 PR            10I 0
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Starts with
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringStartsWith...
     D                 PR              N
     D  @this                          *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D oIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Substring
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringSubSt...
     D                 PR
     D  @this                          *   CONST
     D  Start                        10I 0 CONST
     D oLength                       10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Convert To ASCII
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringToASCII...
     D                 PR              *
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Convert To EBCDIC
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringToEBCDIC...
     D                 PR              *
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: ToString
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringToString...
     D                 PR              *
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: ToVarying
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringToVarying...
     D                 PR           510A   VARYING
     D  @this                          *   CONST
     D oIndex                        10I 0 CONST OPTIONS(*NOPASS)
     D oLength                       10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Trim
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringTrim...
     D                 PR
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: TrimL
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringTrimL...
     D                 PR
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: TrimR
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringTrimR...
     D                 PR
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Convert to upper case
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D StringUpper...
     D                 PR
     D  @this                          *   CONST
     D oIndex                        10I 0 CONST OPTIONS(*NOPASS)
     D oLength                       10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�*ENTRY PLIST Parameters
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('CLSSTRING')
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *�
     D Main            PI
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Start of executable
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *
      /free

         //�This program uses automatic initialisation
         //�EXSR *INZSR ;

         //�Decide what to do
            SELECT ;

         //�Class: String
            WHEN (ClassLinkName(@Template) = 'String') ;
               ClassLink(StringClass():@Template:@SubClass) ;

         //�Unknown name
            OTHER ;
               Throw('Unrecognised class name: '+ClassLinkName(@Template)) ;
            ENDSL ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Automatic Initialisation
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR *INZSR ;

            //�Load Utilities
               DLLUtility(@DLLUtility) ;

            //�Includes
               include(@ClsObject) ;
               include(@ClsClass) ;
               include(@ClsInterface) ;
               include(@IfcComparable) ;
               include(@ClsIterate) ;

         //�Finished
            ENDSR ;

      /end-free
      *
      *�--------------------------------------------------------------------------------------------
      *�String: Provide Comparator for case insensitive sorting
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P String_CASE_INSENSITIVE_ORDER...
     P                 B
     D                 PI              *
      *�
     D @this           S               *   STATIC
      *�
      /free

         //�Exit if already built
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //�Use Generic Comparator function
            Assign(@this:
               newSimpleComparator(%pAddr(StringCompareToIgnoreCase))) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of Procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Decode parameter as a String if possible
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringParm...
     P                 B
     D                 PI
     D  @Parm                          *   CONST
     D  StringParm                         LIKEDS(StringParm_)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Type            S             10I 0
      *�
      /free

         //�Initialise
            StringParm.@Data= %Addr(StringParm.Text)+2 ;
            StringParm.Size= 0 ;
            StringParm.Capacity= 128 ;
            StringParm.Text= '' ;

         //�Test the parameter
            Type= ClassInstanceOf(StringClass:@Parm) ;

         //�Null parameters are converted to empty strings
            IF (Type = CLASS_INSTANCE_NULL) ;
               RETURN ;
            ENDIF ;

         //�Not an object, so assume immediate data instead
            IF (Type = CLASS_INSTANCE_NOT_AN_OBJECT) ;
               StringParm.Text= %Str(@Parm:512) ;
               StringParm.Size= %Len(StringParm.Text) ;
               StringParm.Capacity=
                 Utility_NextHigherPowerOfTwo(StringParm.Size) ;
               RETURN ;
            ENDIF ;

         //�Watch for errors
            MONITOR ;

            //�Attempt to cast the parameter as a String object
               @this= castString(@Parm) ;

         //�Pass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //�Pick up information from String object
            StringParm.@Data= this.@Data ;
            StringParm.Size= this.Size ;
            StringParm.Capacity=
              Utility_NextHigherPowerOfTwo(this.Size) ;

         //�Finished
            RETURN ;

      /end-free
      *�
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Class Definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringClass...
     P                 B
     D                 PI              *
      *�
      *�Class Pointer
     D @this           S               *   STATIC INZ(null)
      *
      *�Class Definition Template
     D Template        DS                  QUALIFIED
     D                               16A   INZ('*CLASS*TEMPLATE*')
     D                              126A   VARYING INZ(
     D                                     'String')
     D                               10I 0 INZ(ACCESS_PUB_FIN)
     D                               10I 0 INZ(%Size(Template))
     D                               10I 0 INZ(%Size(String_))
     D                                4A
      *�
     D                              126A   VARYING INZ(
     D                                     'String_CASE_INSENSITIVE_ORDER')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     String_CASE_INSENSITIVE_ORDER))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'castThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     castString))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *�
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
      *�
     D                              126A   VARYING INZ(
     D                                     'thisInitialise')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringInitialise))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisFinalise')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringFinalise))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringDlt))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisAppend')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringAppend))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisAppendBytes')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringAppendBytes))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisCapacity')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringCapacity))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisCharAt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringCharAt))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisChgCapacity')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringChgCapacity))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisClear')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringClear))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisClone')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringClone))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisCompareTo')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringCompareTo))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisCompareToIgnoreCase')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringCompareToIgnoreCase))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisEndsWith')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringEndsWith))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringEquals))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisEqualsIgnoreCase')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringEqualsIgnoreCase))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringHashCode))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisInsert')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringInsert))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisIsEmpty')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringIsEmpty))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisLower')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringLower))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisRegionMatches')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringRegionMatches))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringRemove))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisReplace')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringReplace))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisRtvBytes')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringRtvBytes))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisScan')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringScan))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisSize')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringSize))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisStartsWith')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringStartsWith))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisSubSt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringSubSt))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisToASCII')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringToASCII))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisToEBCDIC')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringToEBCDIC))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisToString')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringToString))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisToVarying')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringToVarying))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisTrim')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringTrim))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisTrimL')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringTrimL))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisTrimR')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringTrimR))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
     D                              126A   VARYING INZ(
     D                                     'thisUpper')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     StringUpper))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *�
      /free

         //�Return pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //�Build class definition
            @this= extendsObject(Template) ;

         //�Interfaces
            implementsComparable(@this) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castString...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Cast as an instance of this class
            RETURN ClassCast(StringClass():@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfString...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *�
      /free

         //�Finished
            RETURN (
              ClassInstanceOf(
                StringClass():
                @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newString...
     P                 B
     D                 PI              *
     D  @Parm                          *   CONST OPTIONS(*STRING:*NOPASS)
      *�
     D s               DS                  LIKEDS(StringParm_)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
      /free

         //�Form a new instance of this class
            @this= ClassNewInstance(StringClass()) ;

         //�Resolve parameter data if applicable
            IF (%Parms() = 0) ;
               StringParm(null:s) ;
            ELSE ;
               StringParm(@Parm:s) ;
            ENDIF ;

         //�Pick up size
            IF (s.Capacity > this.Capacity) ;
               this.Capacity= s.Capacity ;
               this.@Data= %ReAlloc(this.@Data:this.Capacity) ;
            ENDIF ;

         //�Initialise
            this.Size= s.Size ;

         //�Copy in initial value if applicable
            IF (this.Size > 0) ;
               Utility_MemCpy(this.@Data:s.@Data:s.Size) ;
            ENDIF ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Initialise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringInitialise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
      /free

         //�Invoke superclass method
            @this= superInitialise(StringClass:@) ;

         //�Initialise fields
            this.Size= 0 ;
            this.Capacity= 128 ;
            this.@Data= %Alloc(this.Capacity) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Finalise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringFinalise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
      /free

         //�Cast to this class
            @this= ClassCast(StringClass:@) ;

         //�Trash internals
            Utility_MemSet(this.@Data:x'FF':this.Capacity) ;
            DEALLOC(N) this.@Data ;

         //�Invoke superclass method
            superFinalise(StringClass():@this) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
      /free

         //�Instance must be a member of the current class
            ClassInstanceCheck(StringClass():@) ;

         //�Finished
            RETURN ObjectDlt(@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Append
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringAppend...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Parm                          *   CONST OPTIONS(*STRING)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Parm            DS                  LIKEDS(StringParm_)
      *�
     D Capacity        S             10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Decode the parameter
            StringParm(@Parm:Parm) ;

         //�Quit if there is nothing to copy
            IF (Parm.Size = 0) ;
               RETURN ;
            ENDIF ;

         //�Calculate new capacity
            Capacity=
              Utility_NextHigherPowerOfTwo(this.Size+Parm.Size) ;

         //�Reallocate storage if required
            IF (Capacity > this.Capacity) ;
               this.Capacity= Capacity ;
               this.@Data= %ReAlloc(this.@Data:this.Capacity) ;
            ENDIF ;

         //�Add the elements
            Utility_MemCpy(this.@Data+this.Size:Parm.@Data:Parm.Size) ;

         //�Increment the size value
            this.Size+= Parm.Size ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Append Bytes
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringAppendBytes...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Source                        *   CONST
     D  Size                         10I 0 CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Parm            DS                  LIKEDS(StringParm_)
      *�
     D Capacity        S             10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Increase capacity if required
            StringChgCapacity(@this:this.Size+Size) ;

         //�Copy in the supplied data
            Utility_MemCpy(this.@Data+this.Size:@Source:Size) ;

         //�Adjust the size
            this.Size+= Size ;

         //�Finished
            RETURN ;

      /end-free
      *�
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Capacity
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringCapacity...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Finished
            RETURN this.Capacity ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Character At specified Index
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringCharAt...
     P                 B
     D                 PI             1A
     D  @                              *   CONST
     D  Index                        10I 0 CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D @a              S               *
     D a               S              1A   BASED(@a)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Error if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Point at character
            @a= this.@Data+Index ;

         //�Finished
            RETURN a ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Change Capacity
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringChgCapacity...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Capacity                     10I 0 VALUE
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Required        S             10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Round up the requested amount
            Capacity= Utility_NextHigherPowerOfTwo(Capacity) ;

         //�Find how much capacity is actually required
            Required= Utility_NextHigherPowerOfTwo(this.Size) ;

         //�Do not allow the capacity to be set too small
            IF (Capacity < this.Size) ;
               Capacity= Required ;
            ENDIF ;

         //�Never go below 128 bytes
            IF (Capacity < 128) ;
               Capacity= 128 ;
            ENDIF ;

         //�Set the new capacity value
            this.Capacity= Capacity ;

         //�Reallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Clear
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringClear...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Reset the size
            this.Size= 0 ;

         //�Reset capacity
            this.Capacity= 128 ;

         //�Reallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity);

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Clone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Finished
            RETURN newString(@this) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: CompareTo
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringCompareTo...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D that            DS                  LIKEDS(StringParm_)
      *�
     D StrTest         S             10I 0
     D Len             S             10U 0
     D Flag            S              3I 0
      *�
      /free

         //�Cast to this class
            @this= ClassCast(StringClass:@) ;

         //�Null is not allowed here, so fail deliberately via cast
            IF (@that = null) ;
               castString(@that) ;
            ENDIF ;

         //�Pick up comparison parameter
            StringParm(@that:that) ;

         //�Decide what to do
            SELECT ;

         //�Avoid detailed checking if the pointers are identical
            WHEN (@this = @that) ;
               RETURN 0 ;

         //�Equal Size zero matches regardless of pointers
            WHEN (this.Size = 0) AND (that.Size = 0) ;
               RETURN 0 ;

         //�Zero size in this String counts as less than
            WHEN (this.Size = 0) ;
               RETURN -1 ;

         //�Zero size in that String counts as greater than
            WHEN (that.Size = 0) ;
               RETURN +1 ;

         //�this is longer than that
            WHEN (this.Size > that.Size) ;
               Flag= +1 ;
               Len= that.Size ;

         //�this is shorter than that
            WHEN (this.Size < that.Size) ;
               Flag= -1 ;
               Len= this.Size ;

         //�Both are the same length
            OTHER ;
               Flag= 0 ;
               Len= this.Size ;
            ENDSL ;

         //�Test the strings
            StrTest= Utility_MemCmp(this.@Data:that.@Data:Len) ;

         //�Decide on the result
            SELECT ;

         //�Less than
            WHEN (StrTest < 0) ;
               RETURN -1 ;

         //�Greater than
            WHEN (StrTest > 0) ;
               RETURN +1 ;

            ENDSL ;

         //�Finished
            RETURN Flag ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Compare To Ignore Case
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringCompareToIgnoreCase...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D that            DS                  LIKEDS(StringParm_)
      *�
     D StrTest         S             10I 0
     D Len             S             10U 0
     D Flag            S              3I 0
      *�
      /free

         //�Cast to this class
            @this= ClassCast(StringClass:@) ;

         //�Null is not allowed here, so fail deliberately via cast
            IF (@that = null) ;
               castString(@that) ;
            ENDIF ;

         //�Pick up comparison parameter
            StringParm(@that:that) ;

         //�Decide what to do
            SELECT ;

         //�Avoid detailed checking if the pointers are identical
            WHEN (@this = @that) ;
               RETURN 0 ;

         //�Equal Size zero matches regardless of pointers
            WHEN (this.Size = 0) AND (that.Size = 0) ;
               RETURN 0 ;

         //�Zero size in this String counts as less than
            WHEN (this.Size = 0) ;
               RETURN -1 ;

         //�Zero size in that String counts as greater than
            WHEN (that.Size = 0) ;
               RETURN +1 ;

         //�this is longer than that
            WHEN (this.Size > that.Size) ;
               Flag= +1 ;
               Len= that.Size ;

         //�this is shorter than that
            WHEN (this.Size < that.Size) ;
               Flag= -1 ;
               Len= this.Size ;

         //�Both are the same length
            OTHER ;
               Flag= 0 ;
               Len= this.Size ;
            ENDSL ;

         //�Test the strings
            StrTest= Utility_MemCmpIgnCse(this.@Data:that.@Data:Len) ;

         //�Decide on the result
            SELECT ;

         //�Less than
            WHEN (StrTest < 0) ;
               RETURN -1 ;

         //�Greater than
            WHEN (StrTest > 0) ;
               RETURN +1 ;

            ENDSL ;

         //�Finished
            RETURN Flag ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Ends with
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringEndsWith...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D that            DS                  LIKEDS(StringParm_)
      *�
     D Start           S             10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Decode the parameter
            StringParm(@that:that) ;

         //�Calculate start position
            Start= this.Size-that.Size ;

         //�Finished
            RETURN StringStartsWith(@this:@that:Start) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Equals
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringEquals...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @@                             *   CONST OPTIONS(*STRING)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Type            S             10I 0
      *�
      /free

         //�Cast to this class
            @this= ClassCast(StringClass:@) ;

         //�Fetch type
            Type= ClassInstanceOf(StringClass:@@) ;

         //�Must be same class
            IF (@@ = null) OR (Type = CLASS_INSTANCE_UNRELATED) ;
               RETURN false ;
            ENDIF ;

         //�Avoid detailed checking if the pointers are identical
            IF (@ = @@) ;
               RETURN true ;
            ENDIF ;

         //�Finished
            RETURN (StringCompareTo(@:@@) = 0) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Equals Ignore Case
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringEqualsIgnoreCase...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @@                             *   CONST OPTIONS(*STRING)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Type            S             10I 0
      *�
      /free

         //�Cast to this class
            @this= ClassCast(StringClass:@) ;

         //�Fetch type
            Type= ClassInstanceOf(StringClass:@@) ;

         //�Must be same class
            IF (@@ = null) OR (Type = CLASS_INSTANCE_UNRELATED) ;
               RETURN false ;
            ENDIF ;

         //�Finished
            RETURN (StringCompareToIgnoreCase(@:@@) = 0) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringHashCode...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D hash            S             10I 0 INZ(17)
      *�
      /free

         //�Cast to this class
            @this= ClassCast(StringClass:@) ;

         //�Calculate hash value
            Utility_CombineHash(hash:this.@Data:this.Size) ;

         //�Finished
            RETURN hash ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Insert
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringInsert...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D that            DS                  LIKEDS(StringParm_)
      *�
     D Index           S             10I 0 INZ(0)
     D Capacity        S             10I 0
     D @Data           S               *
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Pick up optional start parameter
            IF (%Parms() >= 3) ;
               Index= pIndex ;
            ENDIF ;

         //�Error if the index is out of range (index < 0 or index > size)
            IF ((Index < 0) OR (Index > this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Decode the parameter
            StringParm(@that:that) ;

         //�Nothing needs to be done with an empty string
            IF (that.Size = 0) ;
               RETURN ;
            ENDIF ;

         //�Decide what to do
            SELECT ;

         //�Target is empty
            WHEN (this.Size = 0) ;
               EXSR DoEmpty ;

         //�Insert at start
            WHEN (Index = 0) ;
               EXSR DoStart ;

         //�Insert at end
            WHEN (Index = this.Size) ;
               EXSR DoEnd ;

         //�Insert in middle
            OTHER ;
               EXSR DoMiddle ;
            ENDSL ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Insert into empty target string
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoEmpty ;

            //�Use append
               StringAppend(@:@that) ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Insert at start of target string
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoStart ;

            //�Calculate new capacity
               Capacity=
                 Utility_NextHigherPowerOfTwo(this.Size+that.Size) ;
               IF (Capacity < this.Capacity) ;
                  Capacity= this.Capacity ;
               ENDIF ;

            //�Allocate a work area
               @Data= %Alloc(Capacity) ;

            //�Copy in data to be inserted
               Utility_MemCpy(@Data:that.@Data:that.Size) ;

            //�Copy in original data
               Utility_MemCpy(@Data+that.Size:this.@Data:this.Size) ;

            //�Destroy original data
               DEALLOC(N) this.@Data ;

            //�Point at new data
               this.@Data= @Data ;

            //�New size
               this.Size+= that.Size ;

            //�New capacity
               this.Capacity= Capacity ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Insert at end of target string
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoEnd ;

            //�Use append
               StringAppend(@:@that) ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Insert in middle of target string
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoMiddle ;

            //�Calculate new capacity
               Capacity=
                 Utility_NextHigherPowerOfTwo(this.Size+that.Size) ;
               IF (Capacity < this.Capacity) ;
                  Capacity= this.Capacity ;
               ENDIF ;

            //�Allocate a work area
               @Data= %Alloc(Capacity) ;

            //�Copy in 'before' data
               Utility_MemCpy(@Data:this.@Data:Index) ;

            //�Copy in data to be inserted
               Utility_MemCpy(@Data+Index:that.@Data:that.Size) ;

            //�Copy in 'after' data
               Utility_MemCpy(@Data+Index+that.Size:
                      this.@Data+Index:
                      this.Size-Index) ;

            //�Destroy original data
               DEALLOC(N) this.@Data ;

            //�Point at new data
               this.@Data= @Data ;

            //�New size
               this.Size+= that.Size ;

            //�New capacity
               this.Capacity= Capacity ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Test if empty
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringIsEmpty...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Finished
            RETURN (this.Size = 0) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Convert to lower case
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringLower...
     P                 B
     D                 PI
     D  @                              *   CONST
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D QlgConvertCase  PR                  ExtProc('QlgConvertCase')
     D  ControlBlock                       LIKE(dsControlBlock)
     D  In                            1A
     D  Out                           1A
     D  DataLen                      10I 0
     D  ErrorStr                    200A
      *�
     D dsControlBlock  DS                  QUALIFIED
     D  ReqType                      10I 0 INZ(1)
     D  CCSID                        10I 0 INZ(0)
     D  CaseReq                      10I 0 INZ(1)
     D  Reserved                     10A   INZ(*LOVAL)
      *�
     D dsErrorStr      DS                  QUALIFIED
     D  BtPro                        10I 0 INZ(%Len(dsErrorStr))
     D  BtAvl                        10I 0
     D  EcexpID                       7A
     D  Reserved                      1A   INZ(*LOVAL)
     D  Data                        200A
      *�
     D @From           S               *
     D @To             S               *
     D @Data           S               *
      *�
     D From            S              1A   BASED(@From)
     D To              S              1A   BASED(@To)
      *�
     D Start           S             10I 0
     D Length          S             10I 0
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Deal with optional start
            IF (%Parms() >= 2) ;
               Start= pStart ;
            ENDIF ;

         //�Deal with optional start
            IF (%Parms() >= 3) ;
               Length= pLength ;
            ELSE ;
               Length= this.Size-Start ;
            ENDIF ;

         //�Error if the start is out of range (start < 0 or start >= size)
            IF ((Start < 0) OR (Start >= this.Size)) ;
               DLL0008.Index= Start ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Restrict length
            IF (Length > (this.Size-Start)) ;
               Length= this.Size-Start ;
            ENDIF ;

         //�Quit now if empty
            IF (this.Size = 0) OR (Length <= 0) ;
               RETURN ;
            ENDIF ;

         //�Allocate a work space
            @Data= %Alloc(this.Capacity) ;

         //�Copy the data
            Utility_MemCpy(@Data:this.@Data:this.Size) ;

         //�Point to the starting characters
            @From= this.@Data+Start ;
            @To= @Data+Start ;

         //�Do case conversion
            QlgConvertCase(dsControlBlock:
              From:
              To:
              Length:
              dsErrorStr) ;

         //�Trash old data
            DEALLOC(N) this.@Data ;

         //�Point to new data
            this.@Data= @Data ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Region Matches
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringRegionMatches...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  tOffset                      10I 0 CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D  oOffset                      10I 0 CONST
     D  Length                       10I 0 CONST
     D  IgnoreCase                     N   CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D that            DS                  LIKEDS(StringParm_)
      *�
     D StrTest         S             10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Pick up string parameter
            StringParm(@that:that) ;

            SELECT ;

         //�Negative offset in this string
            WHEN (tOffset < 0) ;
               RETURN false ;

         //�Negative offset in other string
            WHEN (oOffset < 0) ;
               RETURN false ;

         //�Impossible to match
            WHEN (tOffset+Length > this.Size) ;
               RETURN false ;

         //�Impossible to match
            WHEN (oOffset+Length > that.Size) ;
               RETURN false ;

            ENDSL ;

         //�Ignore case if requested
            IF (%Parms() >= 6) AND (IgnoreCase = true) ;
               StrTest= Utility_MemCmpIgnCse(
                   this.@Data+tOffset:that.@Data+oOffset:Length);
            ELSE ;
               StrTest= Utility_MemCmp(
                   this.@Data+tOffset:that.@Data+oOffset:Length);
            ENDIF ;

         //�Finished
            RETURN (StrTest = 0) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringRemove...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Index                        10I 0 CONST
     D  Length                       10I 0 VALUE
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D @Data           S               *
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Error if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Quit with negative or zero lengths
            IF (Length <= 0) ;
               RETURN ;
            ENDIF ;

         //�Limit the length
            IF (Index+Length > this.Size) ;
               Length= this.Size-Index ;
            ENDIF ;

         //�Remove from middle of target string
            EXSR DoMiddle ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Remove from middle of target string
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR DoMiddle ;

            //�Allocate a work area
               @Data= %Alloc(this.Capacity) ;

            //�Copy in 'before' data
               Utility_MemCpy(@Data:this.@Data:Index) ;

            //�Copy in 'after' data
               Utility_MemCpy(@Data+Index:
                      this.@Data+Index+Length:
                      this.Size-Length) ;

            //�Destroy original data
               DEALLOC(N) this.@Data ;

            //�Point at new data
               this.@Data= @Data ;

            //�New size
               this.Size-= Length ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Replace
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringReplace...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Index           S             10I 0
     D Length          S             10I 0
      *�
     D that            DS                  LIKEDS(StringParm_)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Decode the parameter
            StringParm(@that:that) ;

         //�Pick up optional index parameter
            IF (%Parms() >= 3) ;
               Index= pIndex ;
            ELSE ;
               Index= 0 ;
            ENDIF ;

         //�Pick up optional length parameter
            IF (%Parms() >= 4) ;
               Length= pLength ;
            ELSE ;
               Length= that.Size ;
            ENDIF ;

         //�Error if the index is out of range (index < 0 or index > size)
            IF ((Index < 0) OR (Index > this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Remove existing text if required
            IF (Index < this.Size) AND (Length > 0) ;
               StringRemove(@this:Index:Length) ;
            ENDIF ;

         //�Insert replacement text
            IF (that.Size > 0) ;
               StringInsert(@this:@that:Index) ;
            ENDIF ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Retrieve Bytes
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringRtvBytes...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Target                        *   CONST
     D  TargetSize                   10I 0 CONST
     D pPadChar                       1A   CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D PadChar         S              1A   INZ(x'00')
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Pick up optional parameter
            IF (%Parms() >= 4) ;
               PadChar= pPadChar ;
            ENDIF ;

         //�Copy out the data
            Utility_MemCpyPad(
              @Target:TargetSize:
              this.@Data:this.Size:
              PadChar) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Scan
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringScan...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Needle          DS                  LIKEDS(StringParm_)
     D Haystack        DS                  LIKEDS(StringParm_)
      *�
     D Start           S             10I 0 INZ(0)
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Pick up optional start parameter
            IF (%Parms() >= 3) ;
               Start= pStart ;
            ENDIF ;

         //�Decode the parameter
            StringParm(@that:Needle) ;

         //�Set up the search
            Haystack.@Data= this.@Data ;
            Haystack.Size= this.Size ;

         //�Finished
            RETURN #Scan(Haystack:Needle:Start) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�Internal scan function
     P #Scan...
     P                 B
     D                 PI            10I 0
     D  this                               LIKEDS(StringParm_)
     D  that                               LIKEDS(StringParm_)
     D  Start                        10I 0 CONST
      *�
     D Byte            S              3U 0 BASED(that.@Data)
      *�
     D @Data           S               *
     D @Found          S               *
     D Char            S             10I 0
     D x               S             10I 0
     D y               S             10I 0
     D Limit           S             10I 0
     D Found           S             10I 0 INZ(-1)
      *�
      /free

         //�The empty string is always considered to be found
            IF (that.Size = 0) ;
               RETURN 0 ;
            ENDIF ;

         //�Calculate the limit of the scan
            Limit= this.Size-that.Size-Start+1 ;

         //�No possibility of success
            IF (Limit <= 0) ;
               RETURN -1 ;
            ENDIF ;

         //�Load search values
            Char= Byte ;
            @Data= this.@Data+Start ;

         //�Start the scan
            @Found= Utility_MemChr(@Data:Char:Limit) ;
            DOW (@Found <> null) ;

            //�Quit if found complete string
               IF (Utility_MemCmp(@Found:that.@Data:that.Size) = 0) ;
                  LEAVE ;
               ENDIF ;

            //�Next attempt will be from here
               @Data= @Found+1 ;

            //�Calculate new limit
               Limit= this.Size-that.Size+1 ;
               Limit-= (@Data-this.@Data) ;

            //�Quit if search can not continue
               IF (Limit <= 0) ;
                  @Found= null ;
                  LEAVE ;
               ENDIF ;

            //�Scan again
               @Found= Utility_MemChr(@Data:Char:Limit) ;

         //�Loop
            ENDDO ;

         //�Calculate found index
            IF (@Found <> null) ;
               Found= (@Found-this.@Data) ;
            ENDIF ;

         //�Finished
            RETURN Found ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Retrieve Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringSize...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Finished
            RETURN this.Size ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Starts with
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringStartsWith...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @that                          *   CONST OPTIONS(*STRING)
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D that            DS                  LIKEDS(StringParm_)
      *�
     D Start           S             10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Decode the parameter
            StringParm(@that:that) ;

         //�Pick up optional parameter
            IF (%Parms() >= 3) ;
               Start= pStart ;
            ENDIF ;

         //�Decide what to do
            SELECT ;

         //�Exit if the start is out of range rather than throw an error
            WHEN ((Start < 0) OR (Start >= this.Size)) ;
               RETURN false ;

         //�Comparing to null is always false
            WHEN (@that = null) ;
               RETURN false ;

         //�The empty string is always a match
            WHEN (that.Size = 0) ;
               RETURN true ;

         //�Impossible to match if too long
            WHEN (Start+that.Size > this.Size) ;
               RETURN false ;

            ENDSL ;

         //�Finished
            RETURN (Utility_MemCmp(
                      this.@Data+Start:
                      that.@Data:
                      that.Size) = 0) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Substring
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringSubSt...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Start                        10I 0 CONST
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Length          S             10I 0
     D Capacity        S             10I 0
     D @Data           S               *
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Error if the start is out of range (start < 0 or start >= size)
            IF ((Start < 0) OR (Start >= this.Size)) ;
               DLL0008.Index= Start ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Pick up optional parameter
            IF (%Parms() >= 3) ;
               Length= pLength ;
            ELSE ;
               Length= this.Size-Start ;
            ENDIF ;

         //�Restrict length
            IF (Start+Length > this.Size) ;
               Length= this.Size-Start ;
            ENDIF ;

         //�Zero length causes the substring to be empty
            IF (Length <= 0) ;
               StringClear(@) ;
               RETURN ;
            ENDIF ;

         //�Allocate new storage
            @Data= %Alloc(this.Capacity) ;

         //�Copy substring to new storage
            Utility_MemCpy(@Data:this.@Data+Start:Length) ;

         //�Trash old storage
            DEALLOC(N) this.@Data ;

         //�Switch to new storage
            this.@Data= @Data ;
            this.Size= Length ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Convert To ASCII
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringToASCII...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D @MyData         S               *
     D @@MyData        S               *   INZ(%Addr(@MyData))
     D nInLen          S             10I 0
     D nOutLen         S             10I 0
      *�
     D fromCCSID       DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D toCCSID         DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D hConv           DS                  LIKEDS(IConv_T)
     D                                     INZ(*LIKEDS)
      *�
     D IConv_T         DS                  QUALIFIED INZ
     D  rtn_value                    10I 0
     D  cd                           10I 0 DIM(12)
      *�
     D IConv_Open      PR                  EXTPROC('QtqIconvOpen')
     D                                     LIKEDS(iconv_T)
     D  toCCSID                            LIKEDS(QtqCode_T)
     D  fromCCSID                          LIKEDS(QtqCode_T)
      *�
     D IConv           PR            10U 0 EXTPROC('iconv')
     D  hConv                              LIKEDS(iconv_t) VALUE
     D  pInBuff                        *   VALUE
     D  nInLen                         *   VALUE
     D  pOutBuff                       *   VALUE
     D  nOutLen                        *   VALUE
      *�
     D IConv_Close     PR            10I 0 EXTPROC('iconv_close')
     D  hConv                              LIKEDS(iconv_t) VALUE
      *�
     D QtqCode_T       DS                  QUALIFIED
     D  CCSID                        10I 0 INZ(0)
     D  CvtAlt                       10I 0 INZ(0)
     D  SubAlt                       10I 0 INZ(0)
     D  ShiftState                   10I 0 INZ(1)
     D  InLenOpt                     10I 0 INZ(0)
     D  MixDataErrorOpt...
     D                               10I 0 INZ(0)
     D  Reserved                      8A   INZ(*ALLx'00')
      *�
      /free

         //�Clone the original string
            @this= StringClone(@) ;

         //�Set length of data to convert
            nInLen= this.Size ;
            nOutLen= this.Size ;

         //�Set data pointer
            @MyData= this.@Data ;

         //�Establish conversion environment
            fromCCSID.CCSID= 0 ;
            toCCSID.CCSID= 819 ;
            hConv= *ALLx'00' ;
            hConv= IConv_Open(toCCSID:fromCCSID);

         //�Convert data
            IConv(hConv:@@MyData:%Addr(nInLen):@@MyData:%Addr(nOutLen)) ;

         //�Close conversion environment
            IConv_Close(hConv) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Convert To EBCDIC
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringToEBCDIC...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D @MyData         S               *
     D @@MyData        S               *   INZ(%Addr(@MyData))
     D nInLen          S             10I 0
     D nOutLen         S             10I 0
      *�
     D fromCCSID       DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D toCCSID         DS                  LIKEDS(QtqCode_T)
     D                                     INZ(*LIKEDS)
     D hConv           DS                  LIKEDS(IConv_T)
     D                                     INZ(*LIKEDS)
      *�
     D IConv_T         DS                  QUALIFIED INZ
     D  rtn_value                    10I 0
     D  cd                           10I 0 DIM(12)
      *�
     D IConv_Open      PR                  EXTPROC('QtqIconvOpen')
     D                                     LIKEDS(iconv_T)
     D  toCCSID                            LIKEDS(QtqCode_T)
     D  fromCCSID                          LIKEDS(QtqCode_T)
      *�
     D IConv           PR            10U 0 EXTPROC('iconv')
     D  hConv                              LIKEDS(iconv_t) VALUE
     D  pInBuff                        *   VALUE
     D  nInLen                         *   VALUE
     D  pOutBuff                       *   VALUE
     D  nOutLen                        *   VALUE
      *�
     D IConv_Close     PR            10I 0 EXTPROC('iconv_close')
     D  hConv                              LIKEDS(iconv_t) VALUE
      *�
     D QtqCode_T       DS                  QUALIFIED
     D  CCSID                        10I 0 INZ(0)
     D  CvtAlt                       10I 0 INZ(0)
     D  SubAlt                       10I 0 INZ(0)
     D  ShiftState                   10I 0 INZ(1)
     D  InLenOpt                     10I 0 INZ(0)
     D  MixDataErrorOpt...
     D                               10I 0 INZ(0)
     D  Reserved                      8A   INZ(*ALLx'00')
      *�
      /free

         //�Clone the original string
            @this= StringClone(@) ;

         //�Set length of data to convert
            nInLen= this.Size ;
            nOutLen= this.Size ;

         //�Set data pointer
            @MyData= this.@Data ;

         //�Establish conversion environment
            fromCCSID.CCSID= 819 ;
            toCCSID.CCSID= 0   ;
            hConv= *ALLx'00' ;
            hConv= IConv_Open(toCCSID:fromCCSID);

         //�Convert data
            IConv(hConv:@@MyData:%Addr(nInLen):@@MyData:%Addr(nOutLen)) ;

         //�Close conversion environment
            IConv_Close(hConv) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: ToString
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringToString...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Finished
            RETURN StringClone(@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: ToVarying
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringToVarying...
     P                 B
     D                 PI           510A   VARYING
     D  @                              *   CONST
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Varying         S            510A   VARYING
     D Start           S             10I 0
     D Length          S             10I 0
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Optional Starting index
            IF (%Parms() >= 2) ;
               Start= pStart ;
            ELSE ;
               Start= 0 ;
            ENDIF ;

         //�Optional Length
            IF (%Parms() >= 3) ;
               Length= pLength ;
            ELSE ;
               Length= this.Size ;
            ENDIF ;

         //�Special case of empty string
            IF (this.Size = 0) AND (Start = 0) AND (Length = 0) ;
               RETURN '' ;
            ENDIF ;

         //�Error if the start is out of range (start < 0 or start >= size)
            IF ((Start < 0) OR (Start >= this.Size)) ;
               DLL0008.Index= Start ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Quit now if empty
            IF (this.Size = 0) OR (Length <= 0) ;
               RETURN '' ;
            ENDIF ;

         //�Adjust if too long
            IF (Start+Length > this.Size) ;
               Length= this.Size-Start ;
            ENDIF ;

         //�Avoid overruns
            IF (Length > (%Size(Varying)-2)) ;
               Length= %Size(Varying)-2 ;
            ENDIF ;

         //�Set length
            %Len(Varying)= Length ;

         //�Copy out data
            Utility_MemCpy(%Addr(Varying)+2:this.@Data+Start:Length) ;

         //�Finished
            RETURN Varying ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Trim
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringTrim...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
      /free

         //�Trim left and right
            StringTrimL(@) ;
            StringTrimR(@) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: TrimL
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringTrimL...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D @Data           S               *
     D Size            S             10I 0
     D Capacity        S             10I 0
     D j               S             10I 0
     D @c              S               *
     D c               S              1A   BASED(@c)
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Ignore empty string
            IF (this.Size = 0) ;
               RETURN ;
            ENDIF ;

         //�Point at data
            @c= this.@Data ;

         //�Find first non-blank character
            j= 0 ;
            DOW (j < this.Size) AND (c = x'40') ;
               j= j+1 ;
               @c= @c+1 ;
            ENDDO ;

         //�Quit now if there is no change
            IF (j = 0) ;
               RETURN ;
            ENDIF ;

         //�Calculate new size
            Size= this.Size-j ;

         //�Calculate new capacity
            Capacity=
              Utility_NextHigherPowerOfTwo(Size) ;
            IF (Capacity < 128) ;
               Capacity= 128 ;
            ENDIF ;

         //�Allocate a new workspace
            @Data= %Alloc(Capacity) ;

         //�Copy the data
            Utility_MemCpy(@Data:@c:Size) ;

         //�Trash old data
            DEALLOC(N) this.@Data ;

         //�Point at new data
            this.@Data= @Data ;

         //�Set size and capacity
            this.Size= Size ;
            this.Capacity= Capacity ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: TrimR
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringTrimR...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D Size            S             10I 0
     D Capacity        S             10I 0
     D @c              S               *
     D c               S              1A   BASED(@c)
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Ignore empty string
            IF (this.Size = 0) ;
               RETURN ;
            ENDIF ;

         //�Point at end of data
            @c= this.@Data+this.Size-1 ;

         //�Find last non-blank character
            Size= this.Size ;
            DOW (Size > 0) AND (c = x'40') ;
               Size= Size-1 ;
               @c= @c-1 ;
            ENDDO ;

         //�Calculate new capacity
            Capacity=
              Utility_NextHigherPowerOfTwo(Size) ;
            IF (Capacity < 128) ;
               Capacity= 128 ;
            ENDIF ;

         //�Reallocate the data memory based on the new capacity
            IF (Capacity <> this.Capacity) ;
               this.@Data= %ReAlloc(this.@Data:this.Capacity) ;
            ENDIF ;

         //�Set size and capacity
            this.Size= Size ;
            this.Capacity= Capacity ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�String: Convert to upper case
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P StringUpper...
     P                 B
     D                 PI
     D  @                              *   CONST
     D pStart                        10I 0 CONST OPTIONS(*NOPASS)
     D pLength                       10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(String_) BASED(@this)
      *�
     D QlgConvertCase  PR                  ExtProc('QlgConvertCase')
     D  ControlBlock                       LIKE(dsControlBlock)
     D  In                            1A
     D  Out                           1A
     D  DataLen                      10I 0
     D  ErrorStr                    200A
      *�
     D dsControlBlock  DS                  QUALIFIED
     D  ReqType                      10I 0 INZ(1)
     D  CCSID                        10I 0 INZ(0)
     D  CaseReq                      10I 0 INZ(0)
     D  Reserved                     10A   INZ(*LOVAL)
      *�
     D dsErrorStr      DS                  QUALIFIED
     D  BTPRO                        10I 0 INZ(%Len(dsErrorStr))
     D  BTAVL                        10I 0
     D  EXECPID                       7A
     D  Reserved                      1A   INZ(*LOVAL)
     D  DATA                        200A
      *�
     D @From           S               *
     D @To             S               *
     D @Data           S               *
      *�
     D From            S              1A   BASED(@From)
     D To              S              1A   BASED(@To)
      *�
     D Start           S             10I 0
     D Length          S             10I 0
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
      /free

         //�Pick up object
            @this= castString(@) ;

         //�Deal with optional start
            IF (%Parms() >= 2) ;
               Start= pStart ;
            ENDIF ;

         //�Deal with optional start
            IF (%Parms() >= 3) ;
               Length= pLength ;
            ELSE ;
               Length= this.Size-Start ;
            ENDIF ;

         //�Error if the start is out of range (start < 0 or start >= size)
            IF ((Start < 0) OR (Start >= this.Size)) ;
               DLL0008.Index= Start ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Restrict length
            IF (Length > (this.Size-Start)) ;
               Length= this.Size-Start ;
            ENDIF ;

         //�Quit now if empty
            IF (this.Size = 0) OR (Length <= 0) ;
               RETURN ;
            ENDIF ;

         //�Allocate a work space
            @Data= %Alloc(this.Capacity) ;

         //�Copy the data
            Utility_MemCpy(@Data:this.@Data:this.Size) ;

         //�Point to the starting characters
            @From= this.@Data+Start ;
            @To= @Data+Start ;

         //�Do case conversion
            QlgConvertCase(dsControlBlock:
              From:
              To:
              Length:
              dsErrorStr) ;

         //�Trash old data
            DEALLOC(N) this.@Data ;

         //�Point to new data
            this.@Data= @Data ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
