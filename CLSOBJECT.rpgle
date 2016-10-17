     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO:*SHOWCPY)
     H BNDDIR('QC2LE')
     H COPYRIGHT('(c) 2016 Ray Gillies-Jones. All rights reserved.')
      *À
      *ÀCopyright details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedures
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *ÀCopy in required prototypes
     D/COPY RAYLIB/QDLLSRCV20,CPYUTILV20
     D/COPY RAYLIB/QDLLSRCV20,CPYZINDEX
     D/COPY RAYLIB/QDLLSRCV20,CPYZARRAY
     D/COPY RAYLIB/QDLLSRCV20,CPYSTRING
     D/COPY RAYLIB/QDLLSRCV20,CPYTMPCCH1
      *À
      *ÀBit-twiddling: Henry Gordon Dietz
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀStructures
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D ObjectPrefix...
     D                 C                   x'C0FFEE0B7EC7C0DE'
      *À
      *ÀObject Structure
     D Object_         DS                  QUALIFIED BASED(@NULL)
     D  Signature              1     16A
     D  Prefix                 1      8A
     D  Suffix                 9     16A
     D  Special                      16A
     D  SizeObject                   10I 0
     D  SizeFields                   10I 0
     D  OffsetObject                 10I 0
     D  OffsetSuper                  10I 0
      *À
     D ObjIns_         DS                  QUALIFIED BASED(@NULL)
     D  Signature              1     16A
     D  Prefix                 1      8A
     D  Suffix                 9     16A
     D  Special                      16A
     D  SizeObject                   10I 0
     D  SizeFields                   10I 0
     D  OffsetObject                 10I 0
     D  OffsetSuper                  10I 0
     D  RefCount                     10I 0
     D                               12A
      *À
      *ÀSpecial Signature
     D SpecialSignature...
     D                 C                   x'-
     D                                     1EA016B48BB8EF55-
     D                                     D3109A07C415C01A'
      *À
      *ÀClass Signature
     D ClassSignature...
     D                 C                   x'-
     D                                     86FD3B046606FC91-
     D                                     F371DB1E4026CF0A'
      *À
      *ÀClass Structure
     D Class_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  @Mths                          *
     D  @Ifcs                          *
     D  @Super                         *
     D  @Cache                         *
     D  FldSig                       16A
     D  Name                        126A   VARYING
     D  Access                       10I 0
     D  SizeObject                   10I 0
     D  SizeFields                   10I 0
     D                                4A
      *À
      *ÀClass Constants
     D CLASS_INSTANCE_NULL...
     D                 C                   CONST(-3)
      *À
     D CLASS_INSTANCE_NOT_AN_OBJECT...
     D                 C                   CONST(-2)
      *À
     D CLASS_INSTANCE_UNRELATED...
     D                 C                   CONST(-1)
      *À
     D CLASS_INSTANCE_EXACT_MATCH...
     D                 C                   CONST(0)
      *À
     D CLASS_INSTANCE_SUBCLASS...
     D                 C                   CONST(1)
      *À
      *À
      *ÀMethod Signature
     D MethodSignature...
     D                 C                   x'-
     D                                     4DA032779F4C2866-
     D                                     E104070CEB32EAD9'
      *À
     D Method_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  FldSig                       16A
     D  Name                        126A   VARYING
     D  @Handler                       *   PROCPTR
     D  ImpCls                       16A
     D  Access                       10I 0
     D                               12A
      *À
      *ÀInterface Signature
     D InterfaceSignature...
     D                 C                   x'-
     D                                     C5E6C29BABFA579E-
     D                                     36CE34CE5BD00AB6'
      *À
      *ÀInterface Data Structure
     D Interface_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  @Nams                          *
     D  @Imps                          *
     D  @Mths                          *
     D  @Lnks                          *
     D  @Exts                          *
     D  Name                        126A   VARYING
     D  Access                       10I 0
     D                               12A
      *À
      *ÀInterface Constants
     D INTERFACE_INSTANCE_NULL...
     D                 C                   CONST(-3)
     D INTERFACE_INSTANCE_NOT_AN_OBJECT...
     D                 C                   CONST(-2)
     D INTERFACE_INSTANCE_UNRELATED...
     D                 C                   CONST(-1)
     D INTERFACE_INSTANCE_EXACT_MATCH...
     D                 C                   CONST(0)
      *À
     D IfcNam_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Name                        126A   VARYING
      *À
     D IfcImp_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  FldSig                       16A
      *À
      *À
     D ACCESS_PUBLIC...
     D                 C                   CONST(1)
      *À
     D ACCESS_PRIVATE...
     D                 C                   CONST(8)
      *À
     D ACCESS_STATIC...
     D                 C                   CONST(16)
      *À
     D ACCESS_FINAL...
     D                 C                   CONST(32)
      *À
     D ACCESS_ABSTRACT...
     D                 C                   CONST(64)
      *À
     D ACCESS_PUB_STA...
     D                 C                   CONST(17)
      *À
     D ACCESS_PUB_FIN...
     D                 C                   CONST(33)
      *À
     D ACCESS_PUB_STA_FIN...
     D                 C                   CONST(49)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSignature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SignatureCheck...
     D                 PR              *
     D                                     EXTPROC(@DLLUtility.
     D                                     @SignatureCheck)
     D  @Pointer                       *   CONST
     D  Signature                    16A   CONST
     D  Type                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMethod: Compare entries
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MethodCompare...
     D                 PR            10I 0
     D  @Method                        *   CONST
     D  @Method                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMethod: Compare MthIdx entries
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MthIdxMethodCompare...
     D                 PR            10I 0
     D  @Method                        *   CONST
     D  @Method                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMethod: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MethodSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMethod: Create
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MethodCrt...
     D                 PR              *
     D  Name                        126A   VARYING CONST
     D  @Handler                       *   PROCPTR CONST
     D  Access                       10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMethod: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MethodDlt...
     D                 PR              *
     D  @MthEnt                        *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMthIdx: Retrieve Method
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MthIdxRtvMethod...
     D                 PR              *
     D  Signature                    16A   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Compare entries
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassCompare...
     D                 PR            10I 0
     D  @Class                         *   CONST
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass Class Definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassClass...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Create
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassCrt...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassDlt...
     D                 PR              *
     D  @Class                         *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvName...
     D                 PR           126A   VARYING
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Signature
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvSignature...
     D                 PR            16A
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtv...
     D                 PR              *
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Has Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassHas...
     D                 PR              N
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Add Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassAdd...
     D                 PR
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
     D  @Handler                       *   PROCPTR CONST
     D  Access                       10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀGenerate Signature
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D GenSignature...
     D                 PR            16A
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: New Instance
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassNewInstance...
     D                 PR              *
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Extends processing
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassExtends...
     D                 PR              *
     D  @Class                         *   CONST
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassCast...
     D                 PR              *
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Instance Of test
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassInstanceOf...
     D                 PR            10I 0
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Instance Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassInstanceCheck...
     D                 PR              *
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Reusable Support Program Creation
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRSP...
     D                 PR
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Virtual
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvVirtual...
     D                 PR              *   PROCPTR
     D  @Class                         *   CONST
     D  @Object                        *
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Super
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvSuper...
     D                 PR              *   PROCPTR
     D  @Class                         *   CONST
     D  @Object                        *
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Public method address
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvPublic...
     D                 PR              *   PROCPTR
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Protected method address
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvProtected...
     D                 PR              *   PROCPTR
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassLink...
     D                 PR
     D  @Class                         *   CONST
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Link Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassLinkName...
     D                 PR           126A   VARYING
     D  @Template                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject Class Definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectClass...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: extend class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsObject...
     D                 PR              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castObject...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfObject...
     D                 PR              N
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newObject...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectDlt...
     D                 PR              *
     D  @Object                        *
      *À
     D ObjectFinalise...
     D                 PR
     D  @Object                        *   CONST
      *À
      *ÀsuperFinalise
     D superFinalise...
     D                 PR
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Delete (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Delete...
     D                 PR
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Initialise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectInitialise...
     D                 PR
     D  @Object                        *   CONST
      *À
      *ÀsuperInitialise
     D superInitialise...
     D                 PR              *
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Assign (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Assign...
     D                 PR              *
     D  @Variable                      *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Clone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectClone...
     D                 PR              *
     D  @this                          *   CONST
      *À
     D #ObjectClone...
     D                 PR              *
     D  @this                          *   CONST
      *À
      *ÀsuperClone
     D superClone...
     D                 PR              *
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectEquals...
     D                 PR              N
     D  @this                          *   CONST
     D  @CompareTo                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Equals (static, Handles Nulls)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Equals...
     D                 PR              N
     D  @this                          *   CONST
     D  @CompareTo                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectHashCode...
     D                 PR            10I 0
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRelease...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Release...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release and Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectReleaseDelete...
     D                 PR              *
     D  @Object                        *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release and Delete (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_ReleaseDelete...
     D                 PR
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retain
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRetain...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retain (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Retain...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retain Count
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRetainCount...
     D                 PR            10I 0
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retrieve Class Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRtvClassName...
     D                 PR           126A   VARYING
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: To String
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectToString...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: To Varying
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectToVarying...
     D                 PR           510A   VARYING
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface Class Definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceClass...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Compare entries
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceCompare...
     D                 PR            10I 0
     D  @Interface                     *   CONST
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIfcImp: Compare entries
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IfcImpCompare...
     D                 PR            10I 0
     D  @IfcImp                        *   CONST
     D  @IfcImp                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIfcImp: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IfcImpDlt...
     D                 PR
     D  @IfcImp                        *   VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIfcNam: Compare entries
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IfcNamCompare...
     D                 PR            10I 0
     D  @IfcNam                        *   CONST
     D  @IfcNam                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIfcNam: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IfcNamDlt...
     D                 PR
     D  @IfcNam                        *   VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Create a Interface
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceCrt...
     D                 PR              *
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceDlt...
     D                 PR
     D  @Interface                     *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Retrieve Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtvName...
     D                 PR           126A   VARYING
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Retrieve Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtv...
     D                 PR              *   PROCPTR
     D  @Interface                     *   CONST
     D  @Instance                      *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Add Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceAdd...
     D                 PR
     D  @Interface                     *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceImplements...
     D                 PR
     D  @Interface                     *   CONST
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceCast...
     D                 PR
     D  @Interface                     *   CONST
     D  @Instance                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newInterface...
     D                 PR              *
     D  pTemplate                 65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceExtends...
     D                 PR
     D  @IfcToExtend                   *   CONST
     D  @IfcTarget                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Retrieve Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtvLink...
     D                 PR              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceLink...
     D                 PR
     D  @Interface                     *   CONST
     D  @Template                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Instance Of test
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceInstanceOf...
     D                 PR            10I 0
     D  @Interface                     *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Interface Definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableInterface...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsComparable...
     D                 PR
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castComparable...
     D                 PR
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfComparable...
     D                 PR              N
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsComparable...
     D                 PR
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableDlt...
     D                 PR              *
     D  @Comparable                    *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: CompareTo
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableCompareTo...
     D                 PR            10I 0
     D  @ObjectA                       *   CONST
     D  @ObjectB                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Pool Start (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_PoolStart...
     D                 PR
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Pool End (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_PoolEnd...
     D                 PR
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConstants and Work Fields
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @MthIdx         S               *
     D @ClassIndex     S               *
     D @Pool           S               *
      *À
      *ÀSystem Information Data Structure
     D                SDS
     D  PgmNam                 1     10A
     D  PgmLib                81     90A
      *À
      *À--------------------------------------------------------------------------------------------
      *À*ENTRY PLIST Parameters
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('CLSOBJECT')
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
      /free

         //ÀThis program uses automatic initialisation
         //ÀEXSR *INZSR ;

         //ÀDecide what to do
            SELECT ;

         //ÀClass: Object
            WHEN (ClassLinkName(@Template) = 'Object') ;
               ClassLink(ObjectClass():@Template:@SubClass) ;

         //ÀClass: Class
            WHEN (ClassLinkName(@Template) = 'Class') ;
               ClassLink(ClassClass():@Template:@SubClass) ;

         //ÀClass: Interface
            WHEN (ClassLinkName(@Template) = 'Interface') ;
               ClassLink(InterfaceClass():@Template:@SubClass) ;

         //ÀInterface: Comparable
            WHEN (ClassLinkName(@Template) = 'Comparable') ;
               InterfaceLink(ComparableInterface():@Template) ;

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
               DLLUTILITY(@DLLUtility) ;

            //ÀIncludes
               include(@DLLZIndex) ;
               include(@DLLZArray) ;

            //ÀEstablish Method MthIdx
               @MthIdx= ZIndexCrt(%pAddr(MthIdxMethodCompare)) ;

            //ÀEstablish index of classes
               @ClassIndex= ZIndexCrt(%pAddr(ClassCompare)) ;

            //ÀEstablish Object Pool
               @Pool= ZArrayCrt() ;

            //ÀMake sure classes exist
               ObjectClass() ;
               ClassClass() ;
               InterfaceClass() ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
     D/COPY RAYLIB/QDLLSRCV20,CPYTMPCCH2
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClassCompare: Compare entries in the list
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassCompare...
     P                 B
     D                 PI            10I 0
     D  p@A                            *   CONST
     D  p@B                            *   CONST
      *
     D @A              S               *
     D A               DS                  LIKEDS(Class_) BASED(@A)
      *
     D @B              S               *
     D B               DS                  LIKEDS(Class_) BASED(@B)
      *
      /free

         //ÀPick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.FldSig < B.FldSig) ;
               RETURN -1 ;
            WHEN (A.FldSig > B.FldSig) ;
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
      *ÀClass: Class definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassClass...
     P                 B
     D                 PI              *
      *À
     D @this           S               *   STATIC INZ(null)
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀReturn pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //ÀBuild class definition
            @this= ClassCrt() ;

         //ÀInitialise fields
            this.Name= 'Class' ;
            this.Access= ACCESS_PUBLIC ;
            this.SizeFields= 0 ;
            this.SizeObject= 0 ;

            @Method= MethodCrt('thisSignatureCheck':
              %pAddr(ClassSignatureCheck):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisRtvName':
              %pAddr(ClassRtvName):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisRtvSignature':
              %pAddr(ClassRtvSignature):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisExtends':
              %pAddr(ClassExtends):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisNewInstance':
              %pAddr(ClassNewInstance):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisCast':
              %pAddr(ClassCast):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisInstanceOf':
              %pAddr(ClassInstanceOf):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisInstanceCheck':
              %pAddr(ClassInstanceCheck):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisRtvVirtual':
              %pAddr(ClassRtvVirtual):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisRtvSuper':
              %pAddr(ClassRtvSuper):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisRtvPublic':
              %pAddr(ClassRtvPublic):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisRtvProtected':
              %pAddr(ClassRtvProtected):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisLink':
              %pAddr(ClassLink):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisLinkName':
              %pAddr(ClassLinkName):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('superClone':
              %pAddr(SuperClone):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('superFinalise':
              %pAddr(SuperFinalise):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('superInitialise':
              %pAddr(SuperInitialise):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Interface definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceClass...
     P                 B
     D                 PI              *
      *À
     D @this           S               *   STATIC INZ(null)
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀReturn pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //ÀBuild class definition
            @this= ClassCrt() ;

         //ÀInitialise fields
            this.Name= 'Interface' ;
            this.Access= ACCESS_PUBLIC ;
            this.SizeFields= 0 ;
            this.SizeObject= 0 ;

            @Method= MethodCrt('thisSignatureCheck':
              %pAddr(InterfaceSignatureCheck):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('newThis':
              %pAddr(newInterface):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisRtvName':
              %pAddr(InterfaceRtvName):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisRtv':
              %pAddr(InterfaceRtv):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisImplements':
              %pAddr(InterfaceImplements):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisCast':
              %pAddr(InterfaceCast):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisExtends':
              %pAddr(InterfaceExtends):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisLink':
              %pAddr(InterfaceLink):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

            @Method= MethodCrt('thisInstanceOf':
              %pAddr(InterfaceInstanceOf):
              ACCESS_PUBLIC) ;
            ZIndexAdd(this.@Mths:@Method) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMethodCompare: Compare entries in the list
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MethodCompare...
     P                 B
     D                 PI            10I 0
     D  p@A                            *   CONST
     D  p@B                            *   CONST
      *
     D @A              S               *
     D A               DS                  LIKEDS(Method_) BASED(@A)
      *
     D @B              S               *
     D B               DS                  LIKEDS(Method_) BASED(@B)
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
      *ÀMethod: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MethodSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀFinished
            RETURN SignatureCheck(@:
                     MethodSignature:'Method') ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMethod: Create
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MethodCrt...
     P                 B
     D                 PI              *
     D  Name                        126A   VARYING CONST
     D  @Handler                       *   PROCPTR CONST
     D  Access                       10I 0 CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Method_) BASED(@this)
      *À
      /free

         //ÀAllocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= MethodSignature ;

         //ÀInitialise
            this.Name= Name ;
            this.@Handler= @Handler ;
            this.Access= Access ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMethod: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MethodDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
      /free

         //ÀTrash the entry itself
            Utility_MemSet(@:x'FF':%Size(Method_)) ;
            DEALLOC(N) @ ;

         //ÀFinished
            RETURN @ ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMethodCompare: Compare entries in the MthIdx
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MthIdxMethodCompare...
     P                 B
     D                 PI            10I 0
     D  p@A                            *   CONST
     D  p@B                            *   CONST
      *
     D @A              S               *
     D A               DS                  LIKEDS(Method_) BASED(@A)
      *
     D @B              S               *
     D B               DS                  LIKEDS(Method_) BASED(@B)
      *
      /free

         //ÀPick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.FldSig < B.FldSig) ;
               RETURN -1 ;
            WHEN (A.FldSig > B.FldSig) ;
               RETURN +1 ;
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
      *ÀMthIdx: Retrieve Method
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MthIdxRtvMethod...
     P                 B
     D                 PI              *
     D  Signature                    16A   CONST
     D  Name                        126A   VARYING CONST
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Method_)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(Method_) BASED(@Entry)
      *À
      /free

         //ÀSet up search
            Search.FldSig= Signature ;
            Search.Name= Name ;
            Search.@Handler= null ;

         //ÀFind entry
            @Entry= ZIndexRtv(@MthIdx:@Search) ;

         //ÀFinished
            RETURN @Entry ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀFinished
            RETURN SignatureCheck(@:
                     ClassSignature:'Class') ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Create a Class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassCrt...
     P                 B
     D                 PI              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
      /free

         //ÀAllocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= ClassSignature ;

         //ÀInitialise
            this.@Super= null ;
            this.@Mths= ZIndexCrt(%pAddr(MethodCompare)) ;
            this.@Ifcs= ZIndexCrt(%pAddr(InterfaceCompare)) ;
            this.@Cache= TemplateCacheCrt() ;
            this.FldSig= GenSignature() ;
            this.Name= '' ;
            this.Access= ACCESS_PUBLIC ;
            this.SizeObject= 0 ;
            this.SizeFields= 0 ;

         //ÀAdd class to index
            ZIndexAdd(@ClassIndex:@this) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= ClassSignatureCheck(@) ;

         //ÀTrash internals
            ZIndexClr(this.@Mths:%pAddr(MethodDlt)) ;
            ZIndexDlt(this.@Mths) ;
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
      *ÀClass: Retrieve Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvName...
     P                 B
     D                 PI           126A   VARYING
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= ClassSignatureCheck(@) ;

         //ÀFinished
            RETURN this.Name ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Signature
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvSignature...
     P                 B
     D                 PI            16A
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= ClassSignatureCheck(@) ;

         //ÀFinished
            RETURN this.FldSig ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtv...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Method_)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(Method_) BASED(@Entry)
      *À
      /free

         //ÀPick up object
            @this= ClassSignatureCheck(@) ;

         //ÀSet up search
            Search.Name= Name ;

         //ÀFind entry
            @Entry= ZIndexRtv(this.@Mths:@Search) ;

         //ÀFinished
            RETURN @Entry ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Has Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassHas...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Method_)
      *À
      /free

         //ÀPick up object
            @this= ClassSignatureCheck(@) ;

         //ÀSet up search
            Search.Name= Name ;

         //ÀFinished
            RETURN ZIndexHas(this.@Mths:@Search) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Add Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
     D  @Handler                       *   PROCPTR CONST
     D pAccess                       10I 0 CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(Method_) BASED(@Entry)
      *À
     D Access          S             10I 0 INZ(ACCESS_PUBLIC)
      *À
      /free

         //ÀHandle optional parameter
            IF (%Parms() >= 4) ;
               Access= pAccess ;
            ENDIF ;

         //ÀPick up object
            @this= ClassSignatureCheck(@) ;

         //ÀCreate new entry
            @Entry= MethodCrt(Name:@Handler:Access) ;

         //ÀAdd entry
            ZIndexAdd(this.@Mths:@Entry) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀGenerate Signature
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P GenSignature...
     P                 B
     D                 PI            16A
      *À
     D Signature       DS
     D  ObjSig                        8A   INZ(ObjectPrefix)
     D  ClsSig                        8A
      *À
      /free

         //ÀForm a random class signature
            Utility_RandomBitStream(%Addr(ClsSig):%Size(ClsSig)) ;

         //ÀFinished
            RETURN Signature ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassCast...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  @@                             *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *À
     D MsgDta          DS                  QUALIFIED
     D  SigRqs                       16A
     D  SigFnd                       16A
     D  Type                        126A   VARYING
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀPoint at potential object
            @Object= @@ ;

         //ÀDetect and adjust for dispatch marker
            IF (@Object <> null) AND (Object.Signature = SpecialSignature) ;
               @Object-= 16 ;
            ENDIF ;

         //ÀDecide what to do
            SELECT ;

         //ÀExit at once if the signature is correct
            WHEN (@Object <> null) AND (Object.Signature = this.FldSig) ;
               RETURN @Object ;

         //ÀNull pointer
            WHEN (@Object = null) ;
               MsgDta.SigRqs= this.FldSig ;
               MsgDta.SigFnd= *ALLx'00' ;
               MsgDta.Type= this.Name ;
               Throw(MsgDta:'DLL0005':'DLLMSGF') ;

         //ÀMust be a recognised Object
            WHEN (Object.Prefix <> ObjectPrefix) ;
               MsgDta.SigRqs= this.FldSig ;
               MsgDta.SigFnd= Object.Signature ;
               MsgDta.Type= this.Name ;
               Throw(MsgDta:'DLL0006':'DLLMSGF') ;

            ENDSL ;

         //ÀMake sure object pointer is pointing at start of Object memory
            @Object-= Object.OffsetObject ;

         //ÀCorrect signature found, so quit
            IF (Object.Signature = this.FldSig) ;
               RETURN @Object ;
            ENDIF ;

         //ÀSearch through Object for correct field signature
            DOW (Object.OffsetSuper <> 0) ;

            //ÀPoint to superobject fields
               @Object+= Object.OffsetSuper ;

            //ÀCorrect signature found, so quit
               IF (Object.Signature = this.FldSig) ;
                  RETURN @Object ;
               ENDIF ;

         //ÀLoop
            ENDDO ;

         //ÀReturn pointer to original location
            @Object= @@ ;

         //ÀWrong signature
            MsgDta.SigRqs= this.FldSig ;
            MsgDta.SigFnd= Object.Signature ;
            MsgDta.Type= this.Name ;

         //ÀFinished
            Throw(MsgDta:'DLL0006':'DLLMSGF') ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassInstanceOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @@                             *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀNull pointer
            IF (@@ = null) ;
               RETURN CLASS_INSTANCE_NULL ;
            ENDIF ;

         //ÀPoint at potential object
            @Object= @@ ;

         //ÀDetect and adjust for dispatch marker
            IF (Object.Signature = SpecialSignature) ;
               @Object-= 16 ;
            ENDIF ;

         //ÀMust be a recognised Object
            IF (Object.Prefix <> ObjectPrefix) ;
               RETURN CLASS_INSTANCE_NOT_AN_OBJECT ;
            ENDIF ;

         //ÀMake sure object pointer is pointing at start of Object memory
            @Object-= Object.OffsetObject ;

         //ÀCorrect signature found, so quit
            IF (Object.Signature = this.FldSig) ;
               RETURN CLASS_INSTANCE_EXACT_MATCH ;
            ENDIF ;

         //ÀSearch through Object for correct field signature
            DOW (Object.OffsetSuper <> 0) ;

            //ÀPoint to superobject fields
               @Object+= Object.OffsetSuper ;

            //ÀCorrect signature found, so quit
               IF (Object.Signature = this.FldSig) ;
                  RETURN CLASS_INSTANCE_SUBCLASS ;
               ENDIF ;

         //ÀLoop
            ENDDO ;

         //ÀFinished
            RETURN CLASS_INSTANCE_UNRELATED ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Instance Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassInstanceCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  @@                             *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *À
     D MsgDta          DS                  QUALIFIED
     D  SigRqs                       16A
     D  SigFnd                       16A
     D  Type                        126A   VARYING
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀTest instance
            IF (ClassInstanceOf(@this:@@) = CLASS_INSTANCE_EXACT_MATCH) ;
               RETURN ClassCast(@this:@@) ;
            ENDIF ;

         //ÀMake sure object pointer is pointing at start of Object memory
            @Object= @@ ;
            @Object-= Object.OffsetObject ;

         //ÀSet up signature error message
            MsgDta.SigRqs= this.FldSig ;
            MsgDta.SigFnd= Object.Signature ;
            MsgDta.Type= this.Name ;

         //ÀFinished
            Throw(MsgDta:'DLL0006':'DLLMSGF') ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: New Instance
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassNewInstance...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @instance       S               *
      *À
     D @header         S               *
     D header          DS                  LIKEDS(ObjIns_) BASED(@header)
      *À
     D SizeObject      S             10I 0 INZ(0)
     D OffsetObject    S             10I 0 INZ(0)
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀError if this is an abstract class
            IF (%BitAND(this.Access:ACCESS_ABSTRACT) > 0) ;
               Throw('Class '+this.Name+' is abstract.') ;
            ENDIF ;

         //ÀKeep a note of this
            SizeObject= this.SizeObject ;

         //ÀAllocate memory and initialise
            @instance= %Alloc(this.SizeObject) ;
            Utility_MemSet(@instance:x'00':this.SizeObject) ;

         //ÀPoint to first header location
            @header= @instance ;

         //ÀLoop through class hierarchy
            DOU (1 = 0) ;

               header.Special=      SpecialSignature ;
               header.Signature=    this.FldSig ;
               header.SizeObject=   SizeObject ;
               header.SizeFields=   this.SizeFields ;
               header.OffsetObject= OffsetObject ;

            //ÀQuit now if this is the end of the chain
               IF (this.@Super = null) ;
                  header.OffsetSuper= 0 ;
                  LEAVE ;
               ELSE ;
                  header.OffsetSuper= this.SizeFields ;
               ENDIF ;

            //ÀThis is the new offset to the start of the Object
               OffsetObject+= this.SizeFields ;

            //ÀPoint at new header location
               @header+= this.SizeFields ;

            //ÀPoint at superclass
               @this= this.@Super ;

         //ÀLoop
            ENDDO ;

         //ÀInitialise Reference Count
            header.RefCount= 0 ;

         //ÀAdd to the Object Pool
            ZArrayAdd(@Pool:@Header) ;

         //ÀReset pointer to class definition
            @this= ClassSignatureCheck(@) ;

         //ÀRun thisInitialise on object
            ObjectInitialise(@instance) ;

         //ÀFinished
            RETURN @instance ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Extend
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassExtends...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @target         S               *
     D target          DS                  LIKEDS(Class_) BASED(@target)
      *À
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Marker                       16A
     D  Name                        126A   VARYING
     D  Access                       10I 0
     D  SizeTemplate                 10I 0
     D  SizeFields                   10I 0
     D                                4A
      *À
     D @Detail         S               *
     D Detail          DS                  QUALIFIED BASED(@Detail)
     D  Name                        126A   VARYING
     D  @Handler                       *   PROCPTR
     D  Access                       10I 0
     D                               12A
      *À
     D j               S             10I 0
     D Count           S             10I 0
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
     D @Existing       S               *
     D Existing        DS                  LIKEDS(Method_) BASED(@Existing)
      *À
     D @Ifc            S               *
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀPoint at template
            @Header= %Addr(pTemplate) ;

         //ÀCheck for marker
            IF (Header.Marker <> '*CLASS*TEMPLATE*') ;
               Throw('Invalid Class Template') ;
            ENDIF ;

         //ÀCalculate detail count
            Count= Header.SizeTemplate-%Size(Header) ;
            IF (%Rem(Count:%Size(Detail)) <> 0) ;
               Throw('Invalid Class template detail') ;
            ENDIF ;
            Count= Count/%Size(Detail) ;

         //ÀForm target class
            @target= ClassCrt() ;

         //ÀInitialise fields
            target.Name= Header.Name ;
            target.Access= Header.Access ;
            target.SizeFields= Header.SizeFields ;
            target.@Super= @this ;

         //ÀMaintain field alignment
            target.SizeFields= %BitAND(target.SizeFields+15:x'FFFFFFF0') ;

         //ÀCalculate new object size
            target.SizeObject= this.SizeObject+target.SizeFields ;

         //ÀPoint at first detail
            @Detail= @Header+%Size(Header) ;

         //ÀLoop through method details
            FOR j= 1 TO Count ;

               IF (%BitAND(Detail.Access:ACCESS_ABSTRACT) <> 0) ;

               //ÀForm basic method
                  @Method= MethodCrt(Detail.Name:
                     null:Detail.Access) ;

               ELSE ;

               //ÀForm basic method
                  @Method= MethodCrt(Detail.Name:
                     Detail.@Handler:Detail.Access) ;

               ENDIF ;

            //ÀSet signature values
               Method.FldSig= target.FldSig ;
               Method.ImpCls= target.FldSig ;

            //ÀAdd to class method list
               ZIndexAdd(target.@Mths:@Method) ;

            //ÀPoint to next method
               @Detail+= %Size(Detail) ;

         //ÀLoop
            ENDFOR ;

         //ÀReusable Support Program
            ClassRSP(@Target) ;

         //ÀProcess each method in the base class
            FOR j= 1 TO ZIndexSize(this.@Mths) ;

            //ÀFetch method
               @Method= ZIndexElementAtIndex(this.@Mths:j-1) ;

            //ÀFetch existing method
               @Existing= ClassRtv(@target:Method.Name) ;

            //ÀDecide what to do
               SELECT ;

            //ÀIgnore private
               WHEN (%BitAND(Method.Access:ACCESS_PRIVATE) <> 0) ;

            //ÀIgnore static
               WHEN (%BitAND(Method.Access:ACCESS_STATIC) <> 0) ;

            //Àfinal
               WHEN (%BitAND(Method.Access:ACCESS_FINAL) <> 0)
                    AND (@Existing <> null)
                    AND (%BitAND(Existing.Access:ACCESS_STATIC) = 0) ;
                  Throw('Can not override final method '+
                     Method.Name+' in Class '+
                     this.Name+'.') ;

            //ÀExists in target class
               WHEN (@Existing <> null) ;

            //Àabstract
               WHEN (%BitAND(Method.Access:ACCESS_ABSTRACT) <> 0)
                    AND (%BitAND(target.Access:ACCESS_ABSTRACT) = 0) ;
                  Throw('Abstract method '+Method.Name+' in Class '+
                     this.Name+' has not been overridden by Class '+
                     target.Name+'.') ;

            //ÀCopy the method to target class
               OTHER ;
                  EXSR CopyMethod ;
               ENDSL ;

         //ÀLoop
            ENDFOR ;

         //ÀProcess each method in the target class
            FOR j= 1 TO ZIndexSize(target.@Mths) ;

            //ÀFetch method
               @Method= ZIndexElementAtIndex(target.@Mths:j-1) ;

            //ÀAdd the method to the MthIdx
               ZIndexAdd(@MthIdx:@Method) ;

         //ÀLoop
            ENDFOR ;

         //ÀProcess each interface in the base class
            FOR j= 1 TO ZIndexSize(this.@Ifcs) ;

            //ÀFetch interface
               @Ifc= ZIndexElementAtIndex(this.@Ifcs:j-1) ;

            //ÀRegister target class with the interface
               InterfaceImplements(@Ifc:@target) ;

         //ÀLoop
            ENDFOR ;

         //ÀFinished
            RETURN @target ;


         //À----------------------------------------------------------------------------------------
         //ÀCopy Method
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CopyMethod ;

         //ÀForm basic method
            @Existing=
               MethodCrt(Method.Name:
                 Method.@Handler:Method.Access) ;

         //ÀSet signature values
            Existing.FldSig= target.FldSig ;
            Existing.ImpCls= Method.ImpCls ;

         //ÀAdd to target class
            ZIndexAdd(target.@Mths:@Existing) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Reusable Support Program Creation
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRSP...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D Number          S              6S 0 STATIC
      *À
      *ÀProgram Name Structure
     D PgmNam          DS                  QUALIFIED
     D                                4A   INZ('QOO#')
     D  Number                 5     10S 0
     D  Char                   5     10A
      *À
      *ÀDuplicate RSP
     D Qoo#DupPgm      PR                  EXTPGM('QOO#DUPPGM')
     D  NumberAsChar                  6A
     D  Text                        126A
      *À
      *ÀReusuable Support Program
     D Qoo#000000      PR                  EXTPGM(PgmNam)
     D  @Class                         *   CONST
     D  @Common                        *   CONST
      *À
      *ÀCommon procedures
     D @Common         S               *   INZ(%Addr(Common))
     D Common          DS                  QUALIFIED
     D  @cast                          *   PROCPTR
     D  @instanceOf                    *   PROCPTR
     D  @extends                       *   PROCPTR
     D  @new                           *   PROCPTR
     D  @dlt                           *   PROCPTR
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
     D ClsNam          S            126A
     D Name            S            126A   VARYING
     D @Addr           S               *   PROCPTR
      *À
     D HasCast         S               N
     D HasInstanceOf   S               N
     D HasExtends      S               N
     D HasNew          S               N
     D HasDlt          S               N
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀCheck common procedures
            HasCast= (ClassRtv(@this:'castThis') <> null) ;
            HasInstanceOf= (ClassRtv(@this:'castThis') <> null) ;
            HasExtends= (%BitAND(this.Access:ACCESS_FINAL) > 0)
                        OR (ClassRtv(@this:'castThis') <> null) ;
            HasNew= (%BitAND(this.Access:ACCESS_ABSTRACT) > 0)
                    OR (ClassRtv(@this:'newThis') <> null) ;
            HasDlt= (ClassRtv(@this:'castThis') <> null) ;

         //ÀQuit if not required
            IF HasCast AND HasInstanceOf AND HasExtends
               AND HasDlt AND HasNew ;
               RETURN ;
            ENDIF ;

         //ÀClass Name
            ClsNam= this.Name ;

         //ÀNext number in sequence
            Number+= 1 ;

         //ÀForm name
            PgmNam.Number= Number ;

         //ÀDuplicate program
            Qoo#DupPgm(PgmNam.Char:ClsNam) ;

         //ÀCreate RSP and get procedure addresses
            Qoo#000000(@this:@Common) ;

         //ÀCast
            IF NOT HasCast ;
               Name= 'castThis' ;
               @Addr= Common.@cast ;
               EXSR AddNew ;
            ENDIF ;

         //ÀInstance Of
            IF NOT HasInstanceOf ;
               Name= 'instanceOfThis' ;
               @Addr= Common.@instanceOf ;
               EXSR AddNew ;
            ENDIF ;

         //ÀExtends
            IF NOT HasExtends ;
               Name= 'extendsThis' ;
               @Addr= Common.@extends ;
               EXSR AddNew ;
            ENDIF ;

         //ÀNew
            IF NOT HasNew ;
               Name= 'newThis' ;
               @Addr= Common.@new ;
               EXSR AddNew ;
            ENDIF ;

         //ÀDelete
            IF NOT HasDlt ;
               Name= 'thisDlt' ;
               @Addr= Common.@dlt ;
               EXSR AddNew ;
            ENDIF ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀAdd new method if required
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR AddNew ;

         //ÀForm basic method
            @Method= MethodCrt(Name:
               @Addr:ACCESS_PUB_STA) ;

         //ÀSet signature values
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;

         //ÀAdd to class method list
            ZIndexAdd(this.@Mths:@Method) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Virtual
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvVirtual...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  @@                             *
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀDetect special pointer positioning
            @Object= @@ ;
            IF (Object.Signature = SpecialSignature) ;
               @Object-= 16 ;
               @@= ClassCast(@this:@Object) ;
               RETURN null ;
            ENDIF ;

         //ÀObject must be an instance of this class
            @@= ClassCast(@this:@@) ;

         //ÀMake sure object pointer is pointing to start of Object
            @Object= @@ ;
            @Object-= Object.OffsetObject ;

         //ÀFetch method
            @Method= MthIdxRtvMethod(Object.Signature:Name) ;

         //ÀError if not found
            IF (@Method = null) ;
               Throw('Method '+Name+' not found for Class '+
                 this.Name+'.') ;
            ENDIF ;

         //ÀMethod is part of the current class, so do not dispatch again
            IF (Method.ImpCls = this.FldSig) ;
               RETURN null ;
            ENDIF ;

         //ÀFurther dispatch is not required
            @@+= 16 ;

         //ÀFinished
            RETURN Method.@Handler ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Super
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvSuper...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  @@                             *
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀMove to superclass
            @this= ClassSignatureCheck(this.@Super) ;

         //ÀDetect special pointer positioning
            @Object= @@ ;
            IF (Object.Signature = SpecialSignature) ;

               @Object-= 16 ;
               @@= ClassCast(@this:@Object) ;

            ELSE ;

            //ÀObject must be an instance of this class
               @@= ClassCast(@this:@@) ;

            //ÀMake sure object pointer is pointing to start of Object
               @Object= @@ ;

            ENDIF ;

         //ÀFetch method
            @Method= MthIdxRtvMethod(Object.Signature:Name) ;

         //ÀError if not found
            IF (@Method = null) ;
               Throw('Method '+Name+' not found for Class '+
                 this.Name+'.') ;
            ENDIF ;

         //ÀFurther dispatch is not required
            @@+= 16 ;

         //ÀFinished
            RETURN Method.@Handler ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Public
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvPublic...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀFetch method
            @Method= ClassRtv(@this:Name) ;

         //ÀDecide what to do
            SELECT ;

         //ÀError if not found
            WHEN (@Method = null) ;
               Throw('Method '+Name+' not found for Class '+
                 this.Name+'.') ;

         //ÀNot public, so hide result
            WHEN (%BitAND(Method.Access:ACCESS_PUBLIC) = 0) ;
               RETURN null ;

         //ÀNot public, so hide result
            WHEN (%BitAND(this.Access:ACCESS_PUBLIC) = 0) ;
               RETURN null ;

            ENDSL ;

         //ÀFinished
            RETURN Method.@Handler ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Protected
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvProtected...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀPick up class definition
            @this= ClassSignatureCheck(@) ;

         //ÀFetch method
            @Method= ClassRtv(@this:Name) ;

         //ÀDecide what to do
            SELECT ;

         //ÀError if not found
            WHEN (@Method = null) ;
               Throw('Method '+Name+' not found for Class '+
                 this.Name+'.') ;

         //ÀPrivate, so hide result
            WHEN (%BitAND(Method.Access:ACCESS_PRIVATE) > 0) ;
               RETURN null ;

            ENDSL ;

         //ÀFinished
            RETURN Method.@Handler ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀsuperClone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P superClone...
     P                 B
     D                 PI              *
     D  @thisClass                     *   CONST
     D  @                              *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *   EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @Object         S               *
     D @Clone          S               *
      *À
      /free

         //ÀPick up object pointer
            @Object= @ ;

         //ÀFetch superclass method address
            @Virtual= ClassRtvSuper(@thisClass:@Object:
               'thisClone') ;
            IF (@Virtual = null) ;
               RETURN #ObjectClone(@Object) ;
            ENDIF ;

         //ÀInvoke superclass method
            @Clone= Virtual(@Object) ;

         //ÀFinished
            RETURN ClassCast(@thisClass:@Clone) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀsuperFinalise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P superFinalise...
     P                 B
     D                 PI
     D  @thisClass                     *   CONST
     D  @                              *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @Object         S               *
      *À
      /free

         //ÀPick up object pointer
            @Object= @ ;

           //ÀFetch superclass method address
              @Virtual= ClassRtvSuper(@thisClass:@Object:
                 'thisFinalise') ;
              IF (@Virtual = null) ;
                 RETURN ;
              ENDIF ;

         //ÀInvoke superclass method
            Virtual(@Object) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀsuperInitialise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P superInitialise...
     P                 B
     D                 PI              *
     D  @thisClass                     *   CONST
     D  @                              *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @Object         S               *
      *À
      /free

         //ÀPick up object pointer
            @Object= @ ;

           //ÀFetch superclass method address
              @Virtual= ClassRtvSuper(@thisClass:@Object:
                 'thisInitialise') ;
              IF (@Virtual = null) ;
                 RETURN ;
              ENDIF ;

         //ÀInvoke superclass method
            Virtual(@Object) ;

         //ÀFinished
            RETURN ClassCast(@thisClass:@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Class definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectClass...
     P                 B
     D                 PI              *
      *À
     D @this           S               *   STATIC INZ(null)
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀReturn pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //ÀBuild class definition
            @this= ClassCrt() ;

         //ÀInitialise fields
            this.Name= 'Object' ;
            this.Access= ACCESS_PUBLIC ;
            this.SizeFields= %Size(ObjIns_) ;
            this.SizeObject= %Size(ObjIns_) ;

            @Method= MethodCrt('extendsThis':
              %pAddr(extendsObject):
              ACCESS_PUBLIC+ACCESS_STATIC) ;
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('castThis':
              %pAddr(castObject):
              ACCESS_PUBLIC+ACCESS_STATIC) ;
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('instanceOfThis':
              %pAddr(instanceOfObject):
              ACCESS_PUBLIC+ACCESS_STATIC) ;
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('newThis':
              %pAddr(newObject):
              ACCESS_PUBLIC+ACCESS_STATIC) ;
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisDlt':
              %pAddr(ObjectDlt):
              ACCESS_PUBLIC+ACCESS_STATIC) ;
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('staticDelete':
              %pAddr(Object_Delete):
              ACCESS_PUBLIC+ACCESS_STATIC) ;
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisFinalise':
              %pAddr(ObjectFinalise):
              ACCESS_PUBLIC) ;
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisInitialise':
              %pAddr(ObjectInitialise):
              ACCESS_PUBLIC) ;
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('staticAssign':
              %pAddr(Object_Assign):
              ACCESS_PUB_STA_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisClone':
              %pAddr(ObjectClone):
              ACCESS_PUBLIC) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisEquals':
              %pAddr(ObjectEquals):
              ACCESS_PUBLIC) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('staticEquals':
              %pAddr(Object_Equals):
              ACCESS_PUBLIC+ACCESS_STATIC) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisHashCode':
              %pAddr(ObjectHashCode):
              ACCESS_PUBLIC) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('staticPoolStart':
              %pAddr(Object_PoolStart):
              ACCESS_PUB_STA_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('staticPoolEnd':
              %pAddr(Object_PoolEnd):
              ACCESS_PUB_STA_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisRelease':
              %pAddr(ObjectRelease):
              ACCESS_PUB_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('staticRelease':
              %pAddr(Object_Release):
              ACCESS_PUB_STA_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisReleaseDelete':
              %pAddr(ObjectReleaseDelete):
              ACCESS_PUB_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('staticReleaseDelete':
              %pAddr(Object_ReleaseDelete):
              ACCESS_PUB_STA_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisRetain':
              %pAddr(ObjectRetain):
              ACCESS_PUB_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('staticRetain':
              %pAddr(Object_Retain):
              ACCESS_PUB_STA_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisRetainCount':
              %pAddr(ObjectRetainCount):
              ACCESS_PUB_FIN) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisRtvClassName':
              %pAddr(ObjectRtvClassName):
              ACCESS_PUBLIC) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisToString':
              %pAddr(ObjectToString):
              ACCESS_PUBLIC) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

            @Method= MethodCrt('thisToVarying':
              %pAddr(ObjectToVarying):
              ACCESS_PUBLIC) ;
            Method.ImpCls= this.FldSig ;
            Method.FldSig= this.FldSig ;
            ZIndexAdd(this.@Mths:@Method) ;
            ZIndexAdd(@MthIdx:@Method) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Extend class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsObject...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      /free

         //ÀFinished
            RETURN ClassExtends(ObjectClass:pTemplate) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castObject...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀUse cast
            MONITOR ;
               RETURN ClassCast(ObjectClass():@) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfObject...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *À
      /free

         //ÀFinished
            RETURN (
              ClassInstanceOf(
                ObjectClass():
                @) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newObject...
     P                 B
     D                 PI              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
      /free

         //ÀForm new class instance
            @this= ClassNewInstance(ObjectClass()) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
      /free

         //ÀMust be an object
            @this= castObject(@) ;

         //ÀExit if there are references
            IF (this.RefCount > 0) ;
               RETURN null ;
            ENDIF ;

         //ÀFetch virtual method address
            @Virtual= ClassRtvVirtual(ObjectClass():@this:
              'thisFinalise') ;

         //ÀExecute virtual method
            IF (@Virtual <> null) ;
               Virtual(@this) ;
            ENDIF ;

         //ÀReset pointer to correct location
            @this= castObject(@) ;

         //ÀPoint at the start of memory for this object
            @this-= this.OffsetObject ;
            @= @this ;

         //ÀTrash memory
            Utility_MemSet(@this:x'FF':this.SizeObject) ;

         //ÀRelease storage
            DEALLOC(N) @ ;

         //ÀFinished
            RETURN @ ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Delete (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Delete...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
      *À
      /free

         //ÀIgnore nulls
            IF (@ = null) ;
               RETURN ;
            ENDIF ;

         //ÀPick up the parameter
            @this= @ ;

         //ÀDelete the object
            ObjectDlt(@this) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Finalise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectFinalise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
      /free

         //ÀMust be an object
            @this= castObject(@) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Initialise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectInitialise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //ÀPick up object pointer
              @this= @ ;

           //ÀCheck for overrides
              @Virtual= ClassRtvVirtual(ObjectClass():@this:
                'thisInitialise') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //ÀInvoke virtual method
            Virtual(@this) ;

         //ÀFinished
            RETURN ;
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Assign (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Assign...
     P                 B
     D                 PI              *
     D  @Variable                      *
     D  @Object                        *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
      /free

         //ÀRetain new value
            Object_Retain(@Object) ;

         //ÀRelease existing value
            Object_Release(@Variable) ;

         //ÀAssign the value to the variable
            @Variable= @Object ;

         //ÀFinished
            RETURN @Object ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Clone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *   EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            RETURN #ObjectClone(@this) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //ÀPick up object pointer
              @this= @ ;

           //ÀCheck for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisClone') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //ÀFinished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
     P #ObjectClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
     D @clone          S               *
     D clone           DS                  LIKEDS(ObjIns_) BASED(@clone)
      *À
      /free

         //ÀMust be an Object
            @this= castObject(@) ;

         //ÀAdjust pointers to start of object memory
            @this-= this.OffsetObject ;

         //ÀAllocate object memory
            @clone= %Alloc(this.SizeObject) ;

         //ÀShallow copy the object
            Utility_MemCpy(@clone:@this:this.SizeObject) ;

         //ÀAdjust RefCount
            @clone+= clone.SizeObject-%Size(ObjIns_) ;
            clone.RefCount= 0 ;
            @clone-= clone.OffsetObject ;

         //ÀFinished
            RETURN @clone ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectEquals...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @@                             *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N   EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @@                             *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *À
     D @that           S               *
     D that            DS                  LIKEDS(Object_) BASED(@that)
      *À
     D x               S             10I 0
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀExit with null parameter
            IF (@@ = null) ;
               RETURN false ;
            ENDIF ;

         //ÀCast to object class
            @that= ClassCast(ObjectClass:@@) ;

         //ÀAdjust pointers to start of object memory
            @this-= this.OffsetObject ;
            @that-= that.OffsetObject ;

         //ÀFinished
            RETURN (@this = @that) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //ÀPick up object pointer
              @this= @ ;

           //ÀCheck for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisEquals') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //ÀFinished
            RETURN Virtual(@this:@@) ;
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Equals (static, Handles nulls)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Equals...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @@                             *   CONST
      *À
     D @this           S               *
     D @that           S               *
      *À
      /free

         //ÀDeal with simple cases
            SELECT ;

         //ÀEqual pointers always match
            WHEN (@ = @@) ;
               RETURN true ;

         //ÀFirst pointer is null, so second must be too
            WHEN (@ = null) ;
               RETURN (@@ = null) ;

         //ÀFirst pointer is not null, so fail if second is null
            WHEN (@@ = null) ;
               RETURN false ;

            ENDSL ;

         //ÀCast to object class
            @this= ClassCast(ObjectClass():@) ;
            @that= ClassCast(ObjectClass():@@) ;

         //ÀTest for pointer equality now
            IF (@this = @that) ;
               RETURN true ;
            ENDIF ;

         //ÀFinished
            RETURN ObjectEquals(@this:@that) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retrieve HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectHashCode...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0 EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *À
     D                 DS
     D @Pointer                        *
     D HashCode               13     16I 0
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀUse pointer for code
            @Pointer= @this ;

         //ÀFinished
            RETURN HashCode ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //ÀPick up object pointer
              @this= @ ;

           //ÀCheck for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisHashCode') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //ÀFinished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectRelease...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
      /free

         //ÀMust be an Object
            @this= castObject(@) ;

         //ÀDecrease Reference Count
            this.RefCount-= 1 ;

         //ÀFinished
            RETURN @ ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Release...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀIgnore null
            IF (@ = null) ;
               RETURN @ ;
            ENDIF ;

         //ÀFinished
            RETURN ObjectRelease(@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release and Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectReleaseDelete...
     P                 B
     D                 PI              *
     D  @                              *
      *À
      /free

         //ÀRelease
            ObjectRelease(@) ;

         //ÀFinished
            RETURN ObjectDlt(@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release and Delete (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_ReleaseDelete...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
      *À
      /free

         //ÀIgnore null
            IF (@ = null) ;
               RETURN ;
            ENDIF ;

         //ÀPick up parameter
            @this= @ ;

         //ÀRelease and delete object
            ObjectReleaseDelete(@this) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retain
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectRetain...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
      /free

         //ÀMust be an Object
            @this= castObject(@) ;

         //ÀIncrease Reference Count
            this.RefCount+= 1 ;

         //ÀFinished
            RETURN @ ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retain (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Retain...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀIgnore null
            IF (@ = null) ;
               RETURN @ ;
            ENDIF ;

         //ÀFinished
            RETURN ObjectRetain(@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retain Count
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectRetainCount...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *À
      /free

         //ÀMust be an Object
            @this= castObject(@) ;

         //ÀFinished
            RETURN this.RefCount ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retrieve Class Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectRtvClassName...
     P                 B
     D                 PI           126A   VARYING
     D  @                              *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR           126A   VARYING EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *À
     D @Class          S               *
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Class_)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀMake sure object pointer is pointing at start of Object memory
            @this= @this-this.OffsetObject ;

         //ÀSet up search
            Search.FldSig= this.Signature ;

         //ÀFetch object's class
            @Class= ZIndexRtv(@ClassIndex:@Search) ;

         //ÀFinished
            RETURN ClassRtvName(@Class) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //ÀPick up object pointer
              @this= @ ;

           //ÀCheck for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisRtvClassName') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //ÀFinished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: To String
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectToString...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *   EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *À
     D @String         S               *
      *À
     D Name            S            126A   VARYING
     D Text            S             32A
      *À
     D                 DS
     D @Ptr                    1     16*
     D Ptr                     1     16A
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀMake sure object pointer is pointing at start of Object memory
            @this= @this-this.OffsetObject ;

         //ÀFetch class name
            Name= ObjectRtvClassName(@this) ;

         //ÀFetch pointer
            @Ptr= @this ;

         //ÀConvert to character representation
            Utility_CvtHexToChr(Text:Ptr:32) ;

         //ÀLoad if not already
            IF (%pAddr(newString) = null) ;
               include(@ClsString) ;
            ENDIF ;

         //ÀBuild a string
            @String= newString(Name+':'+%SubSt(Text:17)) ;

         //ÀFinished
            RETURN @String ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //ÀPick up object pointer
              @this= @ ;

           //ÀCheck for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisToString') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //ÀFinished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: To Varying
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectToVarying...
     P                 B
     D                 PI           510A   VARYING
     D  @                              *   CONST
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR           510A   VARYING EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *À
     D @String         S               *
     D Varying         S            510A   VARYING
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀBuild a string
            @String= ObjectToString(@this) ;

         //ÀLoad if not already
            IF (@ClsString.@newThis = null) ;
               include(@ClsString) ;
            ENDIF ;

         //ÀConvert to varying
            Varying= StringToVarying(@String) ;

         //ÀTidy up
            StringDlt(@String) ;

         //ÀFinished
            RETURN Varying ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //ÀPick up object pointer
              @this= @ ;

           //ÀCheck for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisToVarying') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //ÀFinished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterfaceCompare: Compare entries in the list
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceCompare...
     P                 B
     D                 PI            10I 0
     D  p@A                            *   CONST
     D  p@B                            *   CONST
      *
     D @A              S               *
     D A               DS                  LIKEDS(Interface_) BASED(@A)
      *
     D @B              S               *
     D B               DS                  LIKEDS(Interface_) BASED(@B)
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
      *ÀIfcImpCompare: Compare entries in the list
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P IfcImpCompare...
     P                 B
     D                 PI            10I 0
     D  p@A                            *   CONST
     D  p@B                            *   CONST
      *
     D @A              S               *
     D A               DS                  LIKEDS(IfcImp_) BASED(@A)
      *
     D @B              S               *
     D B               DS                  LIKEDS(IfcImp_) BASED(@B)
      *
      /free

         //ÀPick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.FldSig < B.FldSig) ;
               RETURN -1 ;
            WHEN (A.FldSig > B.FldSig) ;
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
      *ÀIfcImp: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P IfcImpDlt...
     P                 B
     D                 PI
     D  @                              *   VALUE
      *À
      /free

         //ÀTrash the entry itself
            Utility_MemSet(@:x'FF':%Size(IfcImp_)) ;
            DEALLOC(N) @ ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIfcNamCompare: Compare entries in the list
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P IfcNamCompare...
     P                 B
     D                 PI            10I 0
     D  p@A                            *   CONST
     D  p@B                            *   CONST
      *
     D @A              S               *
     D A               DS                  LIKEDS(IfcNam_) BASED(@A)
      *
     D @B              S               *
     D B               DS                  LIKEDS(IfcNam_) BASED(@B)
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
      *ÀIfcNam: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P IfcNamDlt...
     P                 B
     D                 PI
     D  @                              *   VALUE
      *À
      /free

         //ÀTrash the entry itself
            Utility_MemSet(@:x'FF':%Size(IfcNam_)) ;
            DEALLOC(N) @ ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀFinished
            RETURN SignatureCheck(@:
                     InterfaceSignature:'Interface') ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Create a Interface
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceCrt...
     P                 B
     D                 PI              *
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
      /free

         //ÀAllocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= InterfaceSignature ;

         //ÀInitialise
            this.Name= Name ;
            this.@Imps= ZIndexCrt(%pAddr(IfcImpCompare)) ;
            this.@Nams= ZIndexCrt(%pAddr(IfcNamCompare)) ;
            this.@Mths= ZIndexCrt(%pAddr(MthIdxMethodCompare)) ;
            this.@Lnks= ZIndexCrt(%pAddr(MethodCompare)) ;
            this.@Exts= ZIndexCrt(%pAddr(InterfaceCompare)) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceDlt...
     P                 B
     D                 PI
     D  @                              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= InterfaceSignatureCheck(@) ;

         //ÀTrash internals
            ZIndexClr(this.@Imps:%pAddr(IfcImpDlt)) ;
            ZIndexDlt(this.@Imps) ;

            ZIndexClr(this.@Nams:%pAddr(IfcNamDlt)) ;
            ZIndexDlt(this.@Nams) ;

            ZIndexClr(this.@Mths) ;

            ZIndexClr(this.@Lnks:%pAddr(MethodDlt)) ;
            ZIndexDlt(this.@Lnks) ;

            ZIndexDlt(this.@Exts) ;

         //ÀTrash the object itself
            Utility_MemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Retrieve Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceRtvName...
     P                 B
     D                 PI           126A   VARYING
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= InterfaceSignatureCheck(@) ;

         //ÀFinished
            RETURN this.Name ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Retrieve Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceRtv...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  @Instance                      *   CONST
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(IfcImp_)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(IfcImp_) BASED(@Entry)
      *À
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
     D @SchMth         S               *   INZ(%Addr(SchMth))
     D SchMth          DS                  LIKEDS(Method_)
      *À
      /free

         //ÀPick up interface
            @this= InterfaceSignatureCheck(@) ;

         //ÀPoint at start of object
            @Object= castObject(@Instance) ;
            @Object-= Object.OffsetObject ;

         //ÀSet up search
            SchMth.FldSig= Object.Signature ;
            SchMth.Name=   Name ;

         //ÀFetch entry from method table
            @Method= ZIndexRtv(this.@Mths:@SchMth) ;

         //ÀFound, so exit
            IF (@Method <> null) ;
               RETURN Method.@Handler ;
            ENDIF ;

         //ÀSet up search
            Search.FldSig= Object.Signature ;

         //ÀFetch entry from implementation table
            @Entry= ZIndexRtv(this.@Imps:@Search) ;

         //ÀFail if not found
            IF (@Entry = null) ;
               Throw('Interface '+this.Name+
                 ' is not implemented by object class.') ;
            ENDIF ;

         //ÀFind entry
            @Method= MthIdxRtvMethod(Object.Signature:Name) ;

         //ÀError if not found
            IF (@Method = null) ;
               Throw('Interface '+this.Name+
                 ' is not implemented by object class.') ;
            ENDIF ;

         //ÀAdd to method table
            ZIndexAdd(this.@Mths:@Method) ;

         //ÀFinished
            RETURN Method.@Handler ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Add Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(IfcNam_) BASED(@Entry)
      *À
      /free

         //ÀPick up object
            @this= InterfaceSignatureCheck(@) ;

         //ÀBuild entry
            @Entry= %Alloc(%Size(Entry)) ;
            Entry.Name= Name ;

         //ÀAdd entry
            ZIndexAdd(this.@Nams:@Entry) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceImplements...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Class                         *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
     D j               S             10I 0
      *À
     D @Name           S               *
     D Name            S            126A   VARYING BASED(@Name)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(IfcImp_) BASED(@Entry)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
     D Class           DS                  LIKEDS(Class_) BASED(@Class)
      *À
     D @Ifc            S               *
      *À
      /free

         //ÀPick up object
            @this= InterfaceSignatureCheck(@) ;

         //ÀLoop through required procedure names
            FOR j= 1 TO ZIndexSize(this.@Nams) ;

            //ÀFetch Name
               @Name= ZIndexElementAtIndex(this.@Nams:j-1) ;

               //ÀFetch method from class
                  @Method= ClassRtv(@Class:Name) ;

               //ÀCheck if procedure address is valid
                  IF (@Method = null) OR
                     (%BitAND(Method.Access:ACCESS_PUBLIC) = 0) ;
                     Throw('Interface '+this.Name+' requires public '+
                       'method '+Name+' to be implemented by Class '+
                       ClassRtvName(@Class)+'.') ;
                  ENDIF ;

         //ÀNext entry
            ENDFOR ;

         //ÀBuild entry
            @Entry= %Alloc(%Size(Entry)) ;
            Entry.FldSig= Class.FldSig ;

         //ÀAdd entry to implementation index
            ZIndexAdd(this.@Imps:@Entry) ;

         //ÀAdd interface to the class
            ZIndexAdd(Class.@Ifcs:@this) ;

         //ÀLoop through interfaces that this interface extends
            FOR j= 1 To ZIndexSize(this.@Exts) ;

            //ÀFetch interface
               @Ifc= ZIndexElementAtIndex(this.@Exts:j-1) ;

            //ÀRun implements for that interface too
               InterfaceImplements(@Ifc:@Class) ;

         //ÀLoop
            ENDFOR ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceCast...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Instance                      *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(IfcImp_)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(IfcImp_) BASED(@Entry)
      *À
      /free

         //ÀPick up object
            @this= InterfaceSignatureCheck(@) ;

         //ÀMust be an object
            @Object= castObject(@Instance) ;
            @Object-= Object.OffsetObject ;

         //ÀSet up search
            Search.FldSig= Object.Signature ;

         //ÀFetch entry from implementation table
            @Entry= ZIndexRtv(this.@Imps:@Search) ;

         //ÀFail if not found
            IF (@Entry = null) ;
               Throw('Interface '+this.Name+
                 ' is not implemented by object class.') ;
            ENDIF ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassLink...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *À
     D @that           S               *
     D that            DS                  LIKEDS(Class_) BASED(@that)
      *À
      *À
     D j               S             10I 0
     D SubClass        S               N   INZ(false)
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
     D EntryCount      S             10I 0
     D Hash            S             16A
      *À
      /free

         //ÀPick up object
            @this= ClassSignatureCheck(@) ;

         //ÀPoint at template
            @Header= @Template ;

         //ÀCheck Template
            EXSR CheckTemplate ;

         //ÀTest for SubClass
            EXSR TestSubClass ;

         //ÀRetrieve cached template if possible
            IF (@SubClass = null) AND
               (TemplateCacheRtv(this.@Cache:@Header) = true) ;
               RETURN ;
            ENDIF ;

         //ÀGenerate a hash for this template
            Hash= Utility_MD5Hash(@Header:Header.Size) ;

         //ÀProcess all entries
            FOR j= 1 TO EntryCount ;

            //ÀPoint at requested entry
               @Entry= @Header+%Size(Header)+((j-1)*%Size(Entry)) ;

            //ÀUse different retreval method if appropriate
               IF (SubClass = true) ;
                  Entry.@Addr= ClassRtvProtected(@this:Entry.Name) ;
               ELSE ;
                  Entry.@Addr= ClassRtvPublic(@this:Entry.Name) ;
               ENDIF ;

            //ÀPoint at next entry
               @Entry+= %Size(Entry) ;

         //ÀLoop
            ENDFOR ;

         //ÀCache the finished version
            IF (@SubClass = null) ;
               TemplateCacheAdd(this.@Cache:@Header:Hash) ;
            ENDIF ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀTest for Sub Class
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR TestSubClass ;

            //ÀQuit if no SubClass parameter was passed
               IF (@SubClass = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀMust be a class
               @that= ClassSignatureCheck(@SubClass) ;

            //ÀSearch up chain of classes
               DOW (@that <> null) ;
                  IF (@that = @this) ;
                     SubClass= true ;
                     LEAVESR ;
                  ENDIF ;
                  @that= that.@Super ;
               ENDDO ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck template
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CheckTemplate ;

            //ÀIt must have the correct signature
               SignatureCheck(@Header:TemplateSignature:'ClassLinkTemplate') ;

            //ÀCheck that it has the correct size
               IF (%Rem(Header.Size-%Size(Header):%Size(Entry)) <> 0) ;
                  Throw('Badly formed ClassLinkTemplate length') ;
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
      *ÀClass: Link Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassLinkName...
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
            SignatureCheck(@Header:TemplateSignature:'ClassLinkTemplate') ;

         //ÀFinished
            RETURN Header.Name ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newInterface...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Marker                       16A
     D  Name                        126A   VARYING
     D  Access                       10I 0
     D  SizeTemplate                 10I 0
     D                                8A
      *À
     D @Detail         S               *
     D Detail          DS                  QUALIFIED BASED(@Detail)
     D  Name                        126A   VARYING
     D  @Handler                       *   PROCPTR
      *À
     D j               S             10I 0
     D Count           S             10I 0
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀPoint at template
            @Header= %Addr(pTemplate) ;

         //ÀCheck for marker
            IF (Header.Marker <> '*IFACE*TEMPLATE*') ;
               Throw('Invalid Interface Template') ;
            ENDIF ;

         //ÀCalculate detail count
            Count= Header.SizeTemplate-%Size(Header) ;
            IF (%Rem(Count:%Size(Detail)) <> 0) ;
               Throw('Invalid Interface template detail') ;
            ENDIF ;
            Count= Count/%Size(Detail) ;

         //ÀForm interface
            @this= InterfaceCrt(Header.Name) ;

         //ÀInitialise fields
            this.Access= Header.Access ;

         //ÀPoint at first detail
            @Detail= @Header+%Size(Header) ;

         //ÀLoop through method details
            FOR j= 1 TO Count ;

            //ÀForm basic method
               @Method= MethodCrt(Detail.Name:
                  Detail.@Handler:ACCESS_PUBLIC) ;

            //ÀAdd to interface link list
               ZIndexAdd(this.@Lnks:@Method) ;

            //ÀInclude in names list if appropriate
               IF (Detail.Name <> 'implementsThis') AND
                  (Detail.Name <> 'castThis') AND
                  (Detail.Name <> 'instanceOfThis') AND
                  (Detail.Name <> 'extendsThis') ;
                  InterfaceAdd(@this:Detail.Name) ;
               ENDIF ;

            //ÀPoint to next method
               @Detail+= %Size(Detail) ;

         //ÀLoop
            ENDFOR ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceExtends...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @@                             *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
     D @Ifc            S               *
     D ifc             DS                  LIKEDS(Interface_) BASED(@Ifc)
      *À
     D j               S             10I 0
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀPick up objects
            @this= InterfaceSignatureCheck(@) ;
            @Ifc=  InterfaceSignatureCheck(@@) ;

         //ÀProcess each link in the base interface
            FOR j= 1 TO ZIndexSize(this.@Lnks) ;

            //ÀFetch method
               @Method= ZIndexElementAtIndex(this.@Lnks:j-1) ;

            //ÀInclude in new interface if appropriate
               IF (Method.Name <> 'implementsThis') AND
                  (Method.Name <> 'castThis') AND
                  (Method.Name <> 'extendsThis') AND
                  (Method.Name <> 'instanceOfThis') AND
                  (ZIndexHas(Ifc.@Lnks:@Method) = false) ;

               //ÀAdd to names list and links list
                  InterfaceAdd(@Ifc:Method.Name) ;
                  ZIndexAdd(Ifc.@Lnks:@Method) ;

               ENDIF ;

         //ÀLoop
            ENDFOR ;

         //ÀAdd the interface itself to the extension list
            ZIndexAdd(Ifc.@Exts:@this) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Retrieve Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceRtvLink...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Method_)
      *À
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *À
      /free

         //ÀPick up interface definition
            @this= InterfaceSignatureCheck(@) ;

         //ÀSet up search
            Search.Name= Name ;

         //ÀFetch method
            @Method= ZIndexRtv(this.@Lnks:@Search) ;

         //ÀDecide what to do
            SELECT ;

         //ÀError if not found
            WHEN (@Method = null) ;
               Throw('Method '+Name+' not found for Interface '+
                 this.Name+'.') ;

         //ÀNot public, so hide result
            WHEN (%BitAND(Method.Access:ACCESS_PUBLIC) = 0) ;
               RETURN null ;

            ENDSL ;

         //ÀFinished
            RETURN Method.@Handler ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceLink...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Template                      *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
     D j               S             10I 0
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
     D EntryCount      S             10I 0
      *À
      /free

         //ÀPick up object
            @this= InterfaceSignatureCheck(@) ;

         //ÀPoint at template
            @Header= @Template ;

         //ÀCheck Template
            EXSR CheckTemplate ;

         //ÀProcess all entries
            FOR j= 1 TO EntryCount ;

            //ÀPoint at requested entry
               @Entry= @Header+%Size(Header)+((j-1)*%Size(Entry)) ;

            //ÀFetch address
               Entry.@Addr= InterfaceRtvLink(@this:Entry.Name) ;

            //ÀPoint at next entry
               @Entry+= %Size(Entry) ;

         //ÀLoop
            ENDFOR ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck template
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CheckTemplate ;

            //ÀIt must have the correct signature
               SignatureCheck(@Header:TemplateSignature:'ClassLinkTemplate') ;

            //ÀCheck that it has the correct size
               IF (%Rem(Header.Size-%Size(Header):%Size(Entry)) <> 0) ;
                  Throw('Badly formed ClassLinkTemplate length') ;
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
      *ÀInterface: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceInstanceOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @@                             *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *À
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(IfcImp_)
      *À
     D @Entry          S               *
      *À
      /free

         //ÀPick up class definition
            @this= InterfaceSignatureCheck(@) ;

         //ÀNull pointer
            IF (@@ = null) ;
               RETURN INTERFACE_INSTANCE_NULL ;
            ENDIF ;

         //ÀPoint at potential object
            @Object= @@ ;

         //ÀDetect and adjust for dispatch marker
            IF (Object.Signature = SpecialSignature) ;
               @Object-= 16 ;
            ENDIF ;

         //ÀMust be a recognised Object
            IF (Object.Prefix <> ObjectPrefix) ;
               RETURN INTERFACE_INSTANCE_NOT_AN_OBJECT ;
            ENDIF ;

         //ÀMake sure object pointer is pointing at start of Object memory
            @Object-= Object.OffsetObject ;

         //ÀSet up search
            Search.FldSig= Object.Signature ;

         //ÀFetch entry from implementation table
            @Entry= ZIndexRtv(this.@Imps:@Search) ;

         //ÀSignature found, so quit
            IF (@Entry <> null) ;
               RETURN INTERFACE_INSTANCE_EXACT_MATCH ;
            ENDIF ;

         //ÀFinished
            RETURN INTERFACE_INSTANCE_UNRELATED ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Interface definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ComparableInterface...
     P                 B
     D                 PI              *
      *À
     D @this           S               *   STATIC INZ(null)
      *
      *ÀInterface Definition Template
     D #template       DS                  QUALIFIED
     D                               16A   INZ('*IFACE*TEMPLATE*')
     D                              126A   VARYING INZ(
     D                                     'Comparable')
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               10I 0 INZ(%Size(#template))
     D                                8A
      *
     D                              126A   VARYING INZ(
     D                                     'extendsThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     extendsComparable))
      *
     D                              126A   VARYING INZ(
     D                                     'castThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     castComparable))
      *
     D                              126A   VARYING INZ(
     D                                     'instanceOfThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     instanceOfComparable))
      *
     D                              126A   VARYING INZ(
     D                                     'implementsThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     implementsComparable))
      *
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ComparableDlt))
      *
     D                              126A   VARYING INZ(
     D                                     'thisCompareTo')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ComparableCompareTo))
      *À
      /free

         //ÀReturn pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //ÀBuild interface definition
            @this= newInterface(#template) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsComparable...
     P                 B
     D                 PI
     D  @Interface                     *   CONST
      *À
      /free

         //ÀSend any errors back to the caller
            MONITOR ;
               InterfaceExtends(ComparableInterface():
                 @Interface) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castComparable...
     P                 B
     D                 PI
     D  @this                          *   CONST
      *À
      /free

         //ÀSend any errors back to the caller
            MONITOR ;
               InterfaceCast(ComparableInterface():
                 @this) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfComparable...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *À
      /free

         //ÀFinished
            RETURN (
              InterfaceInstanceOf(
                ComparableInterface():
                @Object) = INTERFACE_INSTANCE_EXACT_MATCH) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P implementsComparable...
     P                 B
     D                 PI
     D  @Class                         *   CONST
      *À
      /free

         //ÀSend any errors back to the caller
            MONITOR ;
               InterfaceImplements(ComparableInterface():
                 @Class) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ComparableDlt...
     P                 B
     D                 PI              *
     D  @this                          *
      *À
      /free

         //ÀMust be correct type
            InterfaceCast(ComparableInterface():@this) ;

         //ÀFinished
            RETURN ObjectDlt(@this) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: CompareTo
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ComparableCompareTo...
     P                 B
     D                 PI            10I 0
     D  @this                          *   CONST
     D  @that                          *   CONST
      *À
     D @Action         S               *   PROCPTR
     D Action          PR            10I 0 EXTPROC(@Action)
     D  @this                          *   CONST
     D  @that                          *   CONST
      *À
      /free

         //ÀSend any errors back to the caller
            MONITOR ;
               @Action= InterfaceRtv(
                 ComparableInterface():
                 @this:
                 'thisCompareTo') ;
               RETURN Action(@this:@that) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Pool Start (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_PoolStart...
     P                 B
     D                 PI
      *À
      /free

         //ÀUse the pool address as a marker
            ZArrayAdd(@Pool:@Pool) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Pool End (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_PoolEnd...
     P                 B
     D                 PI
      *À
     D j               S             10I 0
     D x               S             10I 0
     D @Object         S               *
     D Object          DS                  LIKEDS(ObjIns_) BASED(@Object)
      *À
      /free

         //ÀWork back through stack
            FOR j= ZArraySize(@Pool)-1 DOWNTO 0 ;

            //ÀPick up object
               @Object= ZArrayRtv(@Pool:j) ;

            //ÀTest object
               x= ClassInstanceOf(ObjectClass():@Object) ;

            //ÀDecide what to do
               SELECT ;

            //ÀEnd marker, so remove and quit
               WHEN (@Object = @Pool) ;
                  ZArrayRmv(@Pool:j) ;
                  LEAVE ;

            //ÀNull, so remove
               WHEN (x = CLASS_INSTANCE_NULL) ;
                  ZArrayRmv(@Pool:j) ;

            //ÀInvalid, so remove
               WHEN (x = CLASS_INSTANCE_NOT_AN_OBJECT) ;
                  ZArrayRmv(@Pool:j) ;

            //ÀObject requiring deletion
               WHEN (Object.RefCount <= 0) ;
                  ZArrayRmv(@Pool:j) ;
                  ObjectDlt(@Object) ;
               ENDSL ;

         //ÀLoop
            ENDFOR ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
