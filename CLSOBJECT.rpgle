     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO:*SHOWCPY)
     H BNDDIR('QC2LE')
     H COPYRIGHT('(c) 2016 Ray Gillies-Jones. All rights reserved.')
      *�
      *�Copyright details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      *�
      *�--------------------------------------------------------------------------------------------
      *�Procedures
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�Copy in required prototypes
     D/COPY RAYLIB/QDLLSRCV20,CPYUTILV20
     D/COPY RAYLIB/QDLLSRCV20,CPYZINDEX
     D/COPY RAYLIB/QDLLSRCV20,CPYZARRAY
     D/COPY RAYLIB/QDLLSRCV20,CPYSTRING
     D/COPY RAYLIB/QDLLSRCV20,CPYTMPCCH1
      *�
      *�Bit-twiddling: Henry Gordon Dietz
      *�
      *�--------------------------------------------------------------------------------------------
      *�Structures
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D ObjectPrefix...
     D                 C                   x'C0FFEE0B7EC7C0DE'
      *�
      *�Object Structure
     D Object_         DS                  QUALIFIED BASED(@NULL)
     D  Signature              1     16A
     D  Prefix                 1      8A
     D  Suffix                 9     16A
     D  Special                      16A
     D  SizeObject                   10I 0
     D  SizeFields                   10I 0
     D  OffsetObject                 10I 0
     D  OffsetSuper                  10I 0
      *�
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
      *�
      *�Special Signature
     D SpecialSignature...
     D                 C                   x'-
     D                                     1EA016B48BB8EF55-
     D                                     D3109A07C415C01A'
      *�
      *�Class Signature
     D ClassSignature...
     D                 C                   x'-
     D                                     86FD3B046606FC91-
     D                                     F371DB1E4026CF0A'
      *�
      *�Class Structure
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
      *�
      *�Class Constants
     D CLASS_INSTANCE_NULL...
     D                 C                   CONST(-3)
      *�
     D CLASS_INSTANCE_NOT_AN_OBJECT...
     D                 C                   CONST(-2)
      *�
     D CLASS_INSTANCE_UNRELATED...
     D                 C                   CONST(-1)
      *�
     D CLASS_INSTANCE_EXACT_MATCH...
     D                 C                   CONST(0)
      *�
     D CLASS_INSTANCE_SUBCLASS...
     D                 C                   CONST(1)
      *�
      *�
      *�Method Signature
     D MethodSignature...
     D                 C                   x'-
     D                                     4DA032779F4C2866-
     D                                     E104070CEB32EAD9'
      *�
     D Method_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  FldSig                       16A
     D  Name                        126A   VARYING
     D  @Handler                       *   PROCPTR
     D  ImpCls                       16A
     D  Access                       10I 0
     D                               12A
      *�
      *�Interface Signature
     D InterfaceSignature...
     D                 C                   x'-
     D                                     C5E6C29BABFA579E-
     D                                     36CE34CE5BD00AB6'
      *�
      *�Interface Data Structure
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
      *�
      *�Interface Constants
     D INTERFACE_INSTANCE_NULL...
     D                 C                   CONST(-3)
     D INTERFACE_INSTANCE_NOT_AN_OBJECT...
     D                 C                   CONST(-2)
     D INTERFACE_INSTANCE_UNRELATED...
     D                 C                   CONST(-1)
     D INTERFACE_INSTANCE_EXACT_MATCH...
     D                 C                   CONST(0)
      *�
     D IfcNam_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Name                        126A   VARYING
      *�
     D IfcImp_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  FldSig                       16A
      *�
      *�
     D ACCESS_PUBLIC...
     D                 C                   CONST(1)
      *�
     D ACCESS_PRIVATE...
     D                 C                   CONST(8)
      *�
     D ACCESS_STATIC...
     D                 C                   CONST(16)
      *�
     D ACCESS_FINAL...
     D                 C                   CONST(32)
      *�
     D ACCESS_ABSTRACT...
     D                 C                   CONST(64)
      *�
     D ACCESS_PUB_STA...
     D                 C                   CONST(17)
      *�
     D ACCESS_PUB_FIN...
     D                 C                   CONST(33)
      *�
     D ACCESS_PUB_STA_FIN...
     D                 C                   CONST(49)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Prototypes
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�--------------------------------------------------------------------------------------------
      *�Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SignatureCheck...
     D                 PR              *
     D                                     EXTPROC(@DLLUtility.
     D                                     @SignatureCheck)
     D  @Pointer                       *   CONST
     D  Signature                    16A   CONST
     D  Type                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Method: Compare entries
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MethodCompare...
     D                 PR            10I 0
     D  @Method                        *   CONST
     D  @Method                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Method: Compare MthIdx entries
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MthIdxMethodCompare...
     D                 PR            10I 0
     D  @Method                        *   CONST
     D  @Method                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Method: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MethodSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Method: Create
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MethodCrt...
     D                 PR              *
     D  Name                        126A   VARYING CONST
     D  @Handler                       *   PROCPTR CONST
     D  Access                       10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Method: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MethodDlt...
     D                 PR              *
     D  @MthEnt                        *
      *�
      *�--------------------------------------------------------------------------------------------
      *�MthIdx: Retrieve Method
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MthIdxRtvMethod...
     D                 PR              *
     D  Signature                    16A   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Compare entries
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassCompare...
     D                 PR            10I 0
     D  @Class                         *   CONST
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class Class Definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassClass...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Create
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassCrt...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassDlt...
     D                 PR              *
     D  @Class                         *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvName...
     D                 PR           126A   VARYING
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Signature
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvSignature...
     D                 PR            16A
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtv...
     D                 PR              *
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Has Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassHas...
     D                 PR              N
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Add Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassAdd...
     D                 PR
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
     D  @Handler                       *   PROCPTR CONST
     D  Access                       10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Generate Signature
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D GenSignature...
     D                 PR            16A
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: New Instance
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassNewInstance...
     D                 PR              *
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Extends processing
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassExtends...
     D                 PR              *
     D  @Class                         *   CONST
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassCast...
     D                 PR              *
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Instance Of test
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassInstanceOf...
     D                 PR            10I 0
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Instance Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassInstanceCheck...
     D                 PR              *
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Reusable Support Program Creation
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRSP...
     D                 PR
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Virtual
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvVirtual...
     D                 PR              *   PROCPTR
     D  @Class                         *   CONST
     D  @Object                        *
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Super
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvSuper...
     D                 PR              *   PROCPTR
     D  @Class                         *   CONST
     D  @Object                        *
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Public method address
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvPublic...
     D                 PR              *   PROCPTR
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Protected method address
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvProtected...
     D                 PR              *   PROCPTR
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Link
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassLink...
     D                 PR
     D  @Class                         *   CONST
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Link Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassLinkName...
     D                 PR           126A   VARYING
     D  @Template                      *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object Class Definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectClass...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: extend class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsObject...
     D                 PR              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castObject...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfObject...
     D                 PR              N
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newObject...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectDlt...
     D                 PR              *
     D  @Object                        *
      *�
     D ObjectFinalise...
     D                 PR
     D  @Object                        *   CONST
      *�
      *�superFinalise
     D superFinalise...
     D                 PR
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Delete (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Delete...
     D                 PR
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Initialise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectInitialise...
     D                 PR
     D  @Object                        *   CONST
      *�
      *�superInitialise
     D superInitialise...
     D                 PR              *
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Assign (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Assign...
     D                 PR              *
     D  @Variable                      *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Clone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectClone...
     D                 PR              *
     D  @this                          *   CONST
      *�
     D #ObjectClone...
     D                 PR              *
     D  @this                          *   CONST
      *�
      *�superClone
     D superClone...
     D                 PR              *
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Equals
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectEquals...
     D                 PR              N
     D  @this                          *   CONST
     D  @CompareTo                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Equals (static, Handles Nulls)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Equals...
     D                 PR              N
     D  @this                          *   CONST
     D  @CompareTo                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectHashCode...
     D                 PR            10I 0
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRelease...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Release...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release and Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectReleaseDelete...
     D                 PR              *
     D  @Object                        *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release and Delete (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_ReleaseDelete...
     D                 PR
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retain
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRetain...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retain (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Retain...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retain Count
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRetainCount...
     D                 PR            10I 0
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retrieve Class Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRtvClassName...
     D                 PR           126A   VARYING
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: To String
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectToString...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: To Varying
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectToVarying...
     D                 PR           510A   VARYING
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface Class Definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceClass...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Compare entries
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceCompare...
     D                 PR            10I 0
     D  @Interface                     *   CONST
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�IfcImp: Compare entries
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IfcImpCompare...
     D                 PR            10I 0
     D  @IfcImp                        *   CONST
     D  @IfcImp                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�IfcImp: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IfcImpDlt...
     D                 PR
     D  @IfcImp                        *   VALUE
      *�
      *�--------------------------------------------------------------------------------------------
      *�IfcNam: Compare entries
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IfcNamCompare...
     D                 PR            10I 0
     D  @IfcNam                        *   CONST
     D  @IfcNam                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�IfcNam: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IfcNamDlt...
     D                 PR
     D  @IfcNam                        *   VALUE
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Create a Interface
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceCrt...
     D                 PR              *
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceDlt...
     D                 PR
     D  @Interface                     *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Retrieve Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtvName...
     D                 PR           126A   VARYING
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Retrieve Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtv...
     D                 PR              *   PROCPTR
     D  @Interface                     *   CONST
     D  @Instance                      *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Add Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceAdd...
     D                 PR
     D  @Interface                     *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceImplements...
     D                 PR
     D  @Interface                     *   CONST
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceCast...
     D                 PR
     D  @Interface                     *   CONST
     D  @Instance                      *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newInterface...
     D                 PR              *
     D  pTemplate                 65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceExtends...
     D                 PR
     D  @IfcToExtend                   *   CONST
     D  @IfcTarget                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Retrieve Link
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtvLink...
     D                 PR              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Link
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceLink...
     D                 PR
     D  @Interface                     *   CONST
     D  @Template                      *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Instance Of test
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceInstanceOf...
     D                 PR            10I 0
     D  @Interface                     *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Interface Definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableInterface...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsComparable...
     D                 PR
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castComparable...
     D                 PR
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfComparable...
     D                 PR              N
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsComparable...
     D                 PR
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableDlt...
     D                 PR              *
     D  @Comparable                    *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: CompareTo
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableCompareTo...
     D                 PR            10I 0
     D  @ObjectA                       *   CONST
     D  @ObjectB                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Pool Start (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_PoolStart...
     D                 PR
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Pool End (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_PoolEnd...
     D                 PR
      *�
      *�--------------------------------------------------------------------------------------------
      *�Constants and Work Fields
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @MthIdx         S               *
     D @ClassIndex     S               *
     D @Pool           S               *
      *�
      *�System Information Data Structure
     D                SDS
     D  PgmNam                 1     10A
     D  PgmLib                81     90A
      *�
      *�--------------------------------------------------------------------------------------------
      *�*ENTRY PLIST Parameters
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('CLSOBJECT')
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
      /free

         //�This program uses automatic initialisation
         //�EXSR *INZSR ;

         //�Decide what to do
            SELECT ;

         //�Class: Object
            WHEN (ClassLinkName(@Template) = 'Object') ;
               ClassLink(ObjectClass():@Template:@SubClass) ;

         //�Class: Class
            WHEN (ClassLinkName(@Template) = 'Class') ;
               ClassLink(ClassClass():@Template:@SubClass) ;

         //�Class: Interface
            WHEN (ClassLinkName(@Template) = 'Interface') ;
               ClassLink(InterfaceClass():@Template:@SubClass) ;

         //�Interface: Comparable
            WHEN (ClassLinkName(@Template) = 'Comparable') ;
               InterfaceLink(ComparableInterface():@Template) ;

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
               DLLUTILITY(@DLLUtility) ;

            //�Includes
               include(@DLLZIndex) ;
               include(@DLLZArray) ;

            //�Establish Method MthIdx
               @MthIdx= ZIndexCrt(%pAddr(MthIdxMethodCompare)) ;

            //�Establish index of classes
               @ClassIndex= ZIndexCrt(%pAddr(ClassCompare)) ;

            //�Establish Object Pool
               @Pool= ZArrayCrt() ;

            //�Make sure classes exist
               ObjectClass() ;
               ClassClass() ;
               InterfaceClass() ;

         //�Finished
            ENDSR ;

      /end-free
      *�
     D/COPY RAYLIB/QDLLSRCV20,CPYTMPCCH2
      *�
      *�--------------------------------------------------------------------------------------------
      *�ClassCompare: Compare entries in the list
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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

         //�Pick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.FldSig < B.FldSig) ;
               RETURN -1 ;
            WHEN (A.FldSig > B.FldSig) ;
               RETURN +1 ;
            ENDSL ;

         //�Finished
            RETURN 0 ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Class definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassClass...
     P                 B
     D                 PI              *
      *�
     D @this           S               *   STATIC INZ(null)
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Return pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //�Build class definition
            @this= ClassCrt() ;

         //�Initialise fields
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

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Interface definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceClass...
     P                 B
     D                 PI              *
      *�
     D @this           S               *   STATIC INZ(null)
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Return pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //�Build class definition
            @this= ClassCrt() ;

         //�Initialise fields
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

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�MethodCompare: Compare entries in the list
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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

         //�Pick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.Name < B.Name) ;
               RETURN -1 ;
            WHEN (A.Name > B.Name) ;
               RETURN +1 ;
            ENDSL ;

         //�Finished
            RETURN 0 ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Method: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MethodSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Finished
            RETURN SignatureCheck(@:
                     MethodSignature:'Method') ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Method: Create
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MethodCrt...
     P                 B
     D                 PI              *
     D  Name                        126A   VARYING CONST
     D  @Handler                       *   PROCPTR CONST
     D  Access                       10I 0 CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Method_) BASED(@this)
      *�
      /free

         //�Allocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= MethodSignature ;

         //�Initialise
            this.Name= Name ;
            this.@Handler= @Handler ;
            this.Access= Access ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Method: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MethodDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
      /free

         //�Trash the entry itself
            Utility_MemSet(@:x'FF':%Size(Method_)) ;
            DEALLOC(N) @ ;

         //�Finished
            RETURN @ ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�MethodCompare: Compare entries in the MthIdx
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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

         //�Pick up pointers
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

         //�Finished
            RETURN 0 ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�MthIdx: Retrieve Method
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P MthIdxRtvMethod...
     P                 B
     D                 PI              *
     D  Signature                    16A   CONST
     D  Name                        126A   VARYING CONST
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Method_)
      *�
     D @Entry          S               *
     D Entry           DS                  LIKEDS(Method_) BASED(@Entry)
      *�
      /free

         //�Set up search
            Search.FldSig= Signature ;
            Search.Name= Name ;
            Search.@Handler= null ;

         //�Find entry
            @Entry= ZIndexRtv(@MthIdx:@Search) ;

         //�Finished
            RETURN @Entry ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Finished
            RETURN SignatureCheck(@:
                     ClassSignature:'Class') ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Create a Class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassCrt...
     P                 B
     D                 PI              *
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
      /free

         //�Allocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= ClassSignature ;

         //�Initialise
            this.@Super= null ;
            this.@Mths= ZIndexCrt(%pAddr(MethodCompare)) ;
            this.@Ifcs= ZIndexCrt(%pAddr(InterfaceCompare)) ;
            this.@Cache= TemplateCacheCrt() ;
            this.FldSig= GenSignature() ;
            this.Name= '' ;
            this.Access= ACCESS_PUBLIC ;
            this.SizeObject= 0 ;
            this.SizeFields= 0 ;

         //�Add class to index
            ZIndexAdd(@ClassIndex:@this) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= ClassSignatureCheck(@) ;

         //�Trash internals
            ZIndexClr(this.@Mths:%pAddr(MethodDlt)) ;
            ZIndexDlt(this.@Mths) ;
            TemplateCacheDlt(this.@Cache) ;

         //�Trash the object itself
            Utility_MemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         //�Finished
            RETURN @ ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvName...
     P                 B
     D                 PI           126A   VARYING
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= ClassSignatureCheck(@) ;

         //�Finished
            RETURN this.Name ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Signature
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvSignature...
     P                 B
     D                 PI            16A
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= ClassSignatureCheck(@) ;

         //�Finished
            RETURN this.FldSig ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtv...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Method_)
      *�
     D @Entry          S               *
     D Entry           DS                  LIKEDS(Method_) BASED(@Entry)
      *�
      /free

         //�Pick up object
            @this= ClassSignatureCheck(@) ;

         //�Set up search
            Search.Name= Name ;

         //�Find entry
            @Entry= ZIndexRtv(this.@Mths:@Search) ;

         //�Finished
            RETURN @Entry ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Has Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassHas...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Method_)
      *�
      /free

         //�Pick up object
            @this= ClassSignatureCheck(@) ;

         //�Set up search
            Search.Name= Name ;

         //�Finished
            RETURN ZIndexHas(this.@Mths:@Search) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Add Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
     D  @Handler                       *   PROCPTR CONST
     D pAccess                       10I 0 CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Entry          S               *
     D Entry           DS                  LIKEDS(Method_) BASED(@Entry)
      *�
     D Access          S             10I 0 INZ(ACCESS_PUBLIC)
      *�
      /free

         //�Handle optional parameter
            IF (%Parms() >= 4) ;
               Access= pAccess ;
            ENDIF ;

         //�Pick up object
            @this= ClassSignatureCheck(@) ;

         //�Create new entry
            @Entry= MethodCrt(Name:@Handler:Access) ;

         //�Add entry
            ZIndexAdd(this.@Mths:@Entry) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Generate Signature
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P GenSignature...
     P                 B
     D                 PI            16A
      *�
     D Signature       DS
     D  ObjSig                        8A   INZ(ObjectPrefix)
     D  ClsSig                        8A
      *�
      /free

         //�Form a random class signature
            Utility_RandomBitStream(%Addr(ClsSig):%Size(ClsSig)) ;

         //�Finished
            RETURN Signature ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassCast...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  @@                             *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *�
     D MsgDta          DS                  QUALIFIED
     D  SigRqs                       16A
     D  SigFnd                       16A
     D  Type                        126A   VARYING
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Point at potential object
            @Object= @@ ;

         //�Detect and adjust for dispatch marker
            IF (@Object <> null) AND (Object.Signature = SpecialSignature) ;
               @Object-= 16 ;
            ENDIF ;

         //�Decide what to do
            SELECT ;

         //�Exit at once if the signature is correct
            WHEN (@Object <> null) AND (Object.Signature = this.FldSig) ;
               RETURN @Object ;

         //�Null pointer
            WHEN (@Object = null) ;
               MsgDta.SigRqs= this.FldSig ;
               MsgDta.SigFnd= *ALLx'00' ;
               MsgDta.Type= this.Name ;
               Throw(MsgDta:'DLL0005':'DLLMSGF') ;

         //�Must be a recognised Object
            WHEN (Object.Prefix <> ObjectPrefix) ;
               MsgDta.SigRqs= this.FldSig ;
               MsgDta.SigFnd= Object.Signature ;
               MsgDta.Type= this.Name ;
               Throw(MsgDta:'DLL0006':'DLLMSGF') ;

            ENDSL ;

         //�Make sure object pointer is pointing at start of Object memory
            @Object-= Object.OffsetObject ;

         //�Correct signature found, so quit
            IF (Object.Signature = this.FldSig) ;
               RETURN @Object ;
            ENDIF ;

         //�Search through Object for correct field signature
            DOW (Object.OffsetSuper <> 0) ;

            //�Point to superobject fields
               @Object+= Object.OffsetSuper ;

            //�Correct signature found, so quit
               IF (Object.Signature = this.FldSig) ;
                  RETURN @Object ;
               ENDIF ;

         //�Loop
            ENDDO ;

         //�Return pointer to original location
            @Object= @@ ;

         //�Wrong signature
            MsgDta.SigRqs= this.FldSig ;
            MsgDta.SigFnd= Object.Signature ;
            MsgDta.Type= this.Name ;

         //�Finished
            Throw(MsgDta:'DLL0006':'DLLMSGF') ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassInstanceOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @@                             *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Null pointer
            IF (@@ = null) ;
               RETURN CLASS_INSTANCE_NULL ;
            ENDIF ;

         //�Point at potential object
            @Object= @@ ;

         //�Detect and adjust for dispatch marker
            IF (Object.Signature = SpecialSignature) ;
               @Object-= 16 ;
            ENDIF ;

         //�Must be a recognised Object
            IF (Object.Prefix <> ObjectPrefix) ;
               RETURN CLASS_INSTANCE_NOT_AN_OBJECT ;
            ENDIF ;

         //�Make sure object pointer is pointing at start of Object memory
            @Object-= Object.OffsetObject ;

         //�Correct signature found, so quit
            IF (Object.Signature = this.FldSig) ;
               RETURN CLASS_INSTANCE_EXACT_MATCH ;
            ENDIF ;

         //�Search through Object for correct field signature
            DOW (Object.OffsetSuper <> 0) ;

            //�Point to superobject fields
               @Object+= Object.OffsetSuper ;

            //�Correct signature found, so quit
               IF (Object.Signature = this.FldSig) ;
                  RETURN CLASS_INSTANCE_SUBCLASS ;
               ENDIF ;

         //�Loop
            ENDDO ;

         //�Finished
            RETURN CLASS_INSTANCE_UNRELATED ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Instance Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassInstanceCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  @@                             *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *�
     D MsgDta          DS                  QUALIFIED
     D  SigRqs                       16A
     D  SigFnd                       16A
     D  Type                        126A   VARYING
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Test instance
            IF (ClassInstanceOf(@this:@@) = CLASS_INSTANCE_EXACT_MATCH) ;
               RETURN ClassCast(@this:@@) ;
            ENDIF ;

         //�Make sure object pointer is pointing at start of Object memory
            @Object= @@ ;
            @Object-= Object.OffsetObject ;

         //�Set up signature error message
            MsgDta.SigRqs= this.FldSig ;
            MsgDta.SigFnd= Object.Signature ;
            MsgDta.Type= this.Name ;

         //�Finished
            Throw(MsgDta:'DLL0006':'DLLMSGF') ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: New Instance
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassNewInstance...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @instance       S               *
      *�
     D @header         S               *
     D header          DS                  LIKEDS(ObjIns_) BASED(@header)
      *�
     D SizeObject      S             10I 0 INZ(0)
     D OffsetObject    S             10I 0 INZ(0)
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Error if this is an abstract class
            IF (%BitAND(this.Access:ACCESS_ABSTRACT) > 0) ;
               Throw('Class '+this.Name+' is abstract.') ;
            ENDIF ;

         //�Keep a note of this
            SizeObject= this.SizeObject ;

         //�Allocate memory and initialise
            @instance= %Alloc(this.SizeObject) ;
            Utility_MemSet(@instance:x'00':this.SizeObject) ;

         //�Point to first header location
            @header= @instance ;

         //�Loop through class hierarchy
            DOU (1 = 0) ;

               header.Special=      SpecialSignature ;
               header.Signature=    this.FldSig ;
               header.SizeObject=   SizeObject ;
               header.SizeFields=   this.SizeFields ;
               header.OffsetObject= OffsetObject ;

            //�Quit now if this is the end of the chain
               IF (this.@Super = null) ;
                  header.OffsetSuper= 0 ;
                  LEAVE ;
               ELSE ;
                  header.OffsetSuper= this.SizeFields ;
               ENDIF ;

            //�This is the new offset to the start of the Object
               OffsetObject+= this.SizeFields ;

            //�Point at new header location
               @header+= this.SizeFields ;

            //�Point at superclass
               @this= this.@Super ;

         //�Loop
            ENDDO ;

         //�Initialise Reference Count
            header.RefCount= 0 ;

         //�Add to the Object Pool
            ZArrayAdd(@Pool:@Header) ;

         //�Reset pointer to class definition
            @this= ClassSignatureCheck(@) ;

         //�Run thisInitialise on object
            ObjectInitialise(@instance) ;

         //�Finished
            RETURN @instance ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Extend
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassExtends...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @target         S               *
     D target          DS                  LIKEDS(Class_) BASED(@target)
      *�
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Marker                       16A
     D  Name                        126A   VARYING
     D  Access                       10I 0
     D  SizeTemplate                 10I 0
     D  SizeFields                   10I 0
     D                                4A
      *�
     D @Detail         S               *
     D Detail          DS                  QUALIFIED BASED(@Detail)
     D  Name                        126A   VARYING
     D  @Handler                       *   PROCPTR
     D  Access                       10I 0
     D                               12A
      *�
     D j               S             10I 0
     D Count           S             10I 0
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
     D @Existing       S               *
     D Existing        DS                  LIKEDS(Method_) BASED(@Existing)
      *�
     D @Ifc            S               *
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Point at template
            @Header= %Addr(pTemplate) ;

         //�Check for marker
            IF (Header.Marker <> '*CLASS*TEMPLATE*') ;
               Throw('Invalid Class Template') ;
            ENDIF ;

         //�Calculate detail count
            Count= Header.SizeTemplate-%Size(Header) ;
            IF (%Rem(Count:%Size(Detail)) <> 0) ;
               Throw('Invalid Class template detail') ;
            ENDIF ;
            Count= Count/%Size(Detail) ;

         //�Form target class
            @target= ClassCrt() ;

         //�Initialise fields
            target.Name= Header.Name ;
            target.Access= Header.Access ;
            target.SizeFields= Header.SizeFields ;
            target.@Super= @this ;

         //�Maintain field alignment
            target.SizeFields= %BitAND(target.SizeFields+15:x'FFFFFFF0') ;

         //�Calculate new object size
            target.SizeObject= this.SizeObject+target.SizeFields ;

         //�Point at first detail
            @Detail= @Header+%Size(Header) ;

         //�Loop through method details
            FOR j= 1 TO Count ;

               IF (%BitAND(Detail.Access:ACCESS_ABSTRACT) <> 0) ;

               //�Form basic method
                  @Method= MethodCrt(Detail.Name:
                     null:Detail.Access) ;

               ELSE ;

               //�Form basic method
                  @Method= MethodCrt(Detail.Name:
                     Detail.@Handler:Detail.Access) ;

               ENDIF ;

            //�Set signature values
               Method.FldSig= target.FldSig ;
               Method.ImpCls= target.FldSig ;

            //�Add to class method list
               ZIndexAdd(target.@Mths:@Method) ;

            //�Point to next method
               @Detail+= %Size(Detail) ;

         //�Loop
            ENDFOR ;

         //�Reusable Support Program
            ClassRSP(@Target) ;

         //�Process each method in the base class
            FOR j= 1 TO ZIndexSize(this.@Mths) ;

            //�Fetch method
               @Method= ZIndexElementAtIndex(this.@Mths:j-1) ;

            //�Fetch existing method
               @Existing= ClassRtv(@target:Method.Name) ;

            //�Decide what to do
               SELECT ;

            //�Ignore private
               WHEN (%BitAND(Method.Access:ACCESS_PRIVATE) <> 0) ;

            //�Ignore static
               WHEN (%BitAND(Method.Access:ACCESS_STATIC) <> 0) ;

            //�final
               WHEN (%BitAND(Method.Access:ACCESS_FINAL) <> 0)
                    AND (@Existing <> null)
                    AND (%BitAND(Existing.Access:ACCESS_STATIC) = 0) ;
                  Throw('Can not override final method '+
                     Method.Name+' in Class '+
                     this.Name+'.') ;

            //�Exists in target class
               WHEN (@Existing <> null) ;

            //�abstract
               WHEN (%BitAND(Method.Access:ACCESS_ABSTRACT) <> 0)
                    AND (%BitAND(target.Access:ACCESS_ABSTRACT) = 0) ;
                  Throw('Abstract method '+Method.Name+' in Class '+
                     this.Name+' has not been overridden by Class '+
                     target.Name+'.') ;

            //�Copy the method to target class
               OTHER ;
                  EXSR CopyMethod ;
               ENDSL ;

         //�Loop
            ENDFOR ;

         //�Process each method in the target class
            FOR j= 1 TO ZIndexSize(target.@Mths) ;

            //�Fetch method
               @Method= ZIndexElementAtIndex(target.@Mths:j-1) ;

            //�Add the method to the MthIdx
               ZIndexAdd(@MthIdx:@Method) ;

         //�Loop
            ENDFOR ;

         //�Process each interface in the base class
            FOR j= 1 TO ZIndexSize(this.@Ifcs) ;

            //�Fetch interface
               @Ifc= ZIndexElementAtIndex(this.@Ifcs:j-1) ;

            //�Register target class with the interface
               InterfaceImplements(@Ifc:@target) ;

         //�Loop
            ENDFOR ;

         //�Finished
            RETURN @target ;


         //�----------------------------------------------------------------------------------------
         //�Copy Method
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CopyMethod ;

         //�Form basic method
            @Existing=
               MethodCrt(Method.Name:
                 Method.@Handler:Method.Access) ;

         //�Set signature values
            Existing.FldSig= target.FldSig ;
            Existing.ImpCls= Method.ImpCls ;

         //�Add to target class
            ZIndexAdd(target.@Mths:@Existing) ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Reusable Support Program Creation
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRSP...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D Number          S              6S 0 STATIC
      *�
      *�Program Name Structure
     D PgmNam          DS                  QUALIFIED
     D                                4A   INZ('QOO#')
     D  Number                 5     10S 0
     D  Char                   5     10A
      *�
      *�Duplicate RSP
     D Qoo#DupPgm      PR                  EXTPGM('QOO#DUPPGM')
     D  NumberAsChar                  6A
     D  Text                        126A
      *�
      *�Reusuable Support Program
     D Qoo#000000      PR                  EXTPGM(PgmNam)
     D  @Class                         *   CONST
     D  @Common                        *   CONST
      *�
      *�Common procedures
     D @Common         S               *   INZ(%Addr(Common))
     D Common          DS                  QUALIFIED
     D  @cast                          *   PROCPTR
     D  @instanceOf                    *   PROCPTR
     D  @extends                       *   PROCPTR
     D  @new                           *   PROCPTR
     D  @dlt                           *   PROCPTR
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
     D ClsNam          S            126A
     D Name            S            126A   VARYING
     D @Addr           S               *   PROCPTR
      *�
     D HasCast         S               N
     D HasInstanceOf   S               N
     D HasExtends      S               N
     D HasNew          S               N
     D HasDlt          S               N
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Check common procedures
            HasCast= (ClassRtv(@this:'castThis') <> null) ;
            HasInstanceOf= (ClassRtv(@this:'castThis') <> null) ;
            HasExtends= (%BitAND(this.Access:ACCESS_FINAL) > 0)
                        OR (ClassRtv(@this:'castThis') <> null) ;
            HasNew= (%BitAND(this.Access:ACCESS_ABSTRACT) > 0)
                    OR (ClassRtv(@this:'newThis') <> null) ;
            HasDlt= (ClassRtv(@this:'castThis') <> null) ;

         //�Quit if not required
            IF HasCast AND HasInstanceOf AND HasExtends
               AND HasDlt AND HasNew ;
               RETURN ;
            ENDIF ;

         //�Class Name
            ClsNam= this.Name ;

         //�Next number in sequence
            Number+= 1 ;

         //�Form name
            PgmNam.Number= Number ;

         //�Duplicate program
            Qoo#DupPgm(PgmNam.Char:ClsNam) ;

         //�Create RSP and get procedure addresses
            Qoo#000000(@this:@Common) ;

         //�Cast
            IF NOT HasCast ;
               Name= 'castThis' ;
               @Addr= Common.@cast ;
               EXSR AddNew ;
            ENDIF ;

         //�Instance Of
            IF NOT HasInstanceOf ;
               Name= 'instanceOfThis' ;
               @Addr= Common.@instanceOf ;
               EXSR AddNew ;
            ENDIF ;

         //�Extends
            IF NOT HasExtends ;
               Name= 'extendsThis' ;
               @Addr= Common.@extends ;
               EXSR AddNew ;
            ENDIF ;

         //�New
            IF NOT HasNew ;
               Name= 'newThis' ;
               @Addr= Common.@new ;
               EXSR AddNew ;
            ENDIF ;

         //�Delete
            IF NOT HasDlt ;
               Name= 'thisDlt' ;
               @Addr= Common.@dlt ;
               EXSR AddNew ;
            ENDIF ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Add new method if required
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR AddNew ;

         //�Form basic method
            @Method= MethodCrt(Name:
               @Addr:ACCESS_PUB_STA) ;

         //�Set signature values
            Method.FldSig= this.FldSig ;
            Method.ImpCls= this.FldSig ;

         //�Add to class method list
            ZIndexAdd(this.@Mths:@Method) ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Virtual
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvVirtual...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  @@                             *
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Detect special pointer positioning
            @Object= @@ ;
            IF (Object.Signature = SpecialSignature) ;
               @Object-= 16 ;
               @@= ClassCast(@this:@Object) ;
               RETURN null ;
            ENDIF ;

         //�Object must be an instance of this class
            @@= ClassCast(@this:@@) ;

         //�Make sure object pointer is pointing to start of Object
            @Object= @@ ;
            @Object-= Object.OffsetObject ;

         //�Fetch method
            @Method= MthIdxRtvMethod(Object.Signature:Name) ;

         //�Error if not found
            IF (@Method = null) ;
               Throw('Method '+Name+' not found for Class '+
                 this.Name+'.') ;
            ENDIF ;

         //�Method is part of the current class, so do not dispatch again
            IF (Method.ImpCls = this.FldSig) ;
               RETURN null ;
            ENDIF ;

         //�Further dispatch is not required
            @@+= 16 ;

         //�Finished
            RETURN Method.@Handler ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Super
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvSuper...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  @@                             *
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Move to superclass
            @this= ClassSignatureCheck(this.@Super) ;

         //�Detect special pointer positioning
            @Object= @@ ;
            IF (Object.Signature = SpecialSignature) ;

               @Object-= 16 ;
               @@= ClassCast(@this:@Object) ;

            ELSE ;

            //�Object must be an instance of this class
               @@= ClassCast(@this:@@) ;

            //�Make sure object pointer is pointing to start of Object
               @Object= @@ ;

            ENDIF ;

         //�Fetch method
            @Method= MthIdxRtvMethod(Object.Signature:Name) ;

         //�Error if not found
            IF (@Method = null) ;
               Throw('Method '+Name+' not found for Class '+
                 this.Name+'.') ;
            ENDIF ;

         //�Further dispatch is not required
            @@+= 16 ;

         //�Finished
            RETURN Method.@Handler ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Public
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvPublic...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Fetch method
            @Method= ClassRtv(@this:Name) ;

         //�Decide what to do
            SELECT ;

         //�Error if not found
            WHEN (@Method = null) ;
               Throw('Method '+Name+' not found for Class '+
                 this.Name+'.') ;

         //�Not public, so hide result
            WHEN (%BitAND(Method.Access:ACCESS_PUBLIC) = 0) ;
               RETURN null ;

         //�Not public, so hide result
            WHEN (%BitAND(this.Access:ACCESS_PUBLIC) = 0) ;
               RETURN null ;

            ENDSL ;

         //�Finished
            RETURN Method.@Handler ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Protected
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassRtvProtected...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Pick up class definition
            @this= ClassSignatureCheck(@) ;

         //�Fetch method
            @Method= ClassRtv(@this:Name) ;

         //�Decide what to do
            SELECT ;

         //�Error if not found
            WHEN (@Method = null) ;
               Throw('Method '+Name+' not found for Class '+
                 this.Name+'.') ;

         //�Private, so hide result
            WHEN (%BitAND(Method.Access:ACCESS_PRIVATE) > 0) ;
               RETURN null ;

            ENDSL ;

         //�Finished
            RETURN Method.@Handler ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�superClone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P superClone...
     P                 B
     D                 PI              *
     D  @thisClass                     *   CONST
     D  @                              *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *   EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @Object         S               *
     D @Clone          S               *
      *�
      /free

         //�Pick up object pointer
            @Object= @ ;

         //�Fetch superclass method address
            @Virtual= ClassRtvSuper(@thisClass:@Object:
               'thisClone') ;
            IF (@Virtual = null) ;
               RETURN #ObjectClone(@Object) ;
            ENDIF ;

         //�Invoke superclass method
            @Clone= Virtual(@Object) ;

         //�Finished
            RETURN ClassCast(@thisClass:@Clone) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�superFinalise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P superFinalise...
     P                 B
     D                 PI
     D  @thisClass                     *   CONST
     D  @                              *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @Object         S               *
      *�
      /free

         //�Pick up object pointer
            @Object= @ ;

           //�Fetch superclass method address
              @Virtual= ClassRtvSuper(@thisClass:@Object:
                 'thisFinalise') ;
              IF (@Virtual = null) ;
                 RETURN ;
              ENDIF ;

         //�Invoke superclass method
            Virtual(@Object) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�superInitialise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P superInitialise...
     P                 B
     D                 PI              *
     D  @thisClass                     *   CONST
     D  @                              *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @Object         S               *
      *�
      /free

         //�Pick up object pointer
            @Object= @ ;

           //�Fetch superclass method address
              @Virtual= ClassRtvSuper(@thisClass:@Object:
                 'thisInitialise') ;
              IF (@Virtual = null) ;
                 RETURN ;
              ENDIF ;

         //�Invoke superclass method
            Virtual(@Object) ;

         //�Finished
            RETURN ClassCast(@thisClass:@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Class definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectClass...
     P                 B
     D                 PI              *
      *�
     D @this           S               *   STATIC INZ(null)
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Return pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //�Build class definition
            @this= ClassCrt() ;

         //�Initialise fields
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

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Extend class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsObject...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      /free

         //�Finished
            RETURN ClassExtends(ObjectClass:pTemplate) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castObject...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Use cast
            MONITOR ;
               RETURN ClassCast(ObjectClass():@) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfObject...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *�
      /free

         //�Finished
            RETURN (
              ClassInstanceOf(
                ObjectClass():
                @) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newObject...
     P                 B
     D                 PI              *
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
      /free

         //�Form new class instance
            @this= ClassNewInstance(ObjectClass()) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
      /free

         //�Must be an object
            @this= castObject(@) ;

         //�Exit if there are references
            IF (this.RefCount > 0) ;
               RETURN null ;
            ENDIF ;

         //�Fetch virtual method address
            @Virtual= ClassRtvVirtual(ObjectClass():@this:
              'thisFinalise') ;

         //�Execute virtual method
            IF (@Virtual <> null) ;
               Virtual(@this) ;
            ENDIF ;

         //�Reset pointer to correct location
            @this= castObject(@) ;

         //�Point at the start of memory for this object
            @this-= this.OffsetObject ;
            @= @this ;

         //�Trash memory
            Utility_MemSet(@this:x'FF':this.SizeObject) ;

         //�Release storage
            DEALLOC(N) @ ;

         //�Finished
            RETURN @ ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Delete (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Delete...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
      *�
      /free

         //�Ignore nulls
            IF (@ = null) ;
               RETURN ;
            ENDIF ;

         //�Pick up the parameter
            @this= @ ;

         //�Delete the object
            ObjectDlt(@this) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Finalise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectFinalise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
      /free

         //�Must be an object
            @this= castObject(@) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Initialise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectInitialise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR                  EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //�Pick up object pointer
              @this= @ ;

           //�Check for overrides
              @Virtual= ClassRtvVirtual(ObjectClass():@this:
                'thisInitialise') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //�Invoke virtual method
            Virtual(@this) ;

         //�Finished
            RETURN ;
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Assign (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Assign...
     P                 B
     D                 PI              *
     D  @Variable                      *
     D  @Object                        *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
      /free

         //�Retain new value
            Object_Retain(@Object) ;

         //�Release existing value
            Object_Release(@Variable) ;

         //�Assign the value to the variable
            @Variable= @Object ;

         //�Finished
            RETURN @Object ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Clone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *   EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            RETURN #ObjectClone(@this) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //�Pick up object pointer
              @this= @ ;

           //�Check for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisClone') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //�Finished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
     P #ObjectClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
     D @clone          S               *
     D clone           DS                  LIKEDS(ObjIns_) BASED(@clone)
      *�
      /free

         //�Must be an Object
            @this= castObject(@) ;

         //�Adjust pointers to start of object memory
            @this-= this.OffsetObject ;

         //�Allocate object memory
            @clone= %Alloc(this.SizeObject) ;

         //�Shallow copy the object
            Utility_MemCpy(@clone:@this:this.SizeObject) ;

         //�Adjust RefCount
            @clone+= clone.SizeObject-%Size(ObjIns_) ;
            clone.RefCount= 0 ;
            @clone-= clone.OffsetObject ;

         //�Finished
            RETURN @clone ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Equals
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectEquals...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @@                             *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N   EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @@                             *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *�
     D @that           S               *
     D that            DS                  LIKEDS(Object_) BASED(@that)
      *�
     D x               S             10I 0
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Exit with null parameter
            IF (@@ = null) ;
               RETURN false ;
            ENDIF ;

         //�Cast to object class
            @that= ClassCast(ObjectClass:@@) ;

         //�Adjust pointers to start of object memory
            @this-= this.OffsetObject ;
            @that-= that.OffsetObject ;

         //�Finished
            RETURN (@this = @that) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //�Pick up object pointer
              @this= @ ;

           //�Check for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisEquals') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //�Finished
            RETURN Virtual(@this:@@) ;
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Equals (static, Handles nulls)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Equals...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @@                             *   CONST
      *�
     D @this           S               *
     D @that           S               *
      *�
      /free

         //�Deal with simple cases
            SELECT ;

         //�Equal pointers always match
            WHEN (@ = @@) ;
               RETURN true ;

         //�First pointer is null, so second must be too
            WHEN (@ = null) ;
               RETURN (@@ = null) ;

         //�First pointer is not null, so fail if second is null
            WHEN (@@ = null) ;
               RETURN false ;

            ENDSL ;

         //�Cast to object class
            @this= ClassCast(ObjectClass():@) ;
            @that= ClassCast(ObjectClass():@@) ;

         //�Test for pointer equality now
            IF (@this = @that) ;
               RETURN true ;
            ENDIF ;

         //�Finished
            RETURN ObjectEquals(@this:@that) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retrieve HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectHashCode...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0 EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *�
     D                 DS
     D @Pointer                        *
     D HashCode               13     16I 0
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Use pointer for code
            @Pointer= @this ;

         //�Finished
            RETURN HashCode ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //�Pick up object pointer
              @this= @ ;

           //�Check for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisHashCode') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //�Finished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectRelease...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
      /free

         //�Must be an Object
            @this= castObject(@) ;

         //�Decrease Reference Count
            this.RefCount-= 1 ;

         //�Finished
            RETURN @ ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Release...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Ignore null
            IF (@ = null) ;
               RETURN @ ;
            ENDIF ;

         //�Finished
            RETURN ObjectRelease(@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release and Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectReleaseDelete...
     P                 B
     D                 PI              *
     D  @                              *
      *�
      /free

         //�Release
            ObjectRelease(@) ;

         //�Finished
            RETURN ObjectDlt(@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release and Delete (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_ReleaseDelete...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
      *�
      /free

         //�Ignore null
            IF (@ = null) ;
               RETURN ;
            ENDIF ;

         //�Pick up parameter
            @this= @ ;

         //�Release and delete object
            ObjectReleaseDelete(@this) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retain
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectRetain...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
      /free

         //�Must be an Object
            @this= castObject(@) ;

         //�Increase Reference Count
            this.RefCount+= 1 ;

         //�Finished
            RETURN @ ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retain (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_Retain...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Ignore null
            IF (@ = null) ;
               RETURN @ ;
            ENDIF ;

         //�Finished
            RETURN ObjectRetain(@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retain Count
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectRetainCount...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ObjIns_) BASED(@this)
      *�
      /free

         //�Must be an Object
            @this= castObject(@) ;

         //�Finished
            RETURN this.RefCount ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retrieve Class Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectRtvClassName...
     P                 B
     D                 PI           126A   VARYING
     D  @                              *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR           126A   VARYING EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *�
     D @Class          S               *
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Class_)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Make sure object pointer is pointing at start of Object memory
            @this= @this-this.OffsetObject ;

         //�Set up search
            Search.FldSig= this.Signature ;

         //�Fetch object's class
            @Class= ZIndexRtv(@ClassIndex:@Search) ;

         //�Finished
            RETURN ClassRtvName(@Class) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //�Pick up object pointer
              @this= @ ;

           //�Check for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisRtvClassName') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //�Finished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: To String
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectToString...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *   EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *�
     D @String         S               *
      *�
     D Name            S            126A   VARYING
     D Text            S             32A
      *�
     D                 DS
     D @Ptr                    1     16*
     D Ptr                     1     16A
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Make sure object pointer is pointing at start of Object memory
            @this= @this-this.OffsetObject ;

         //�Fetch class name
            Name= ObjectRtvClassName(@this) ;

         //�Fetch pointer
            @Ptr= @this ;

         //�Convert to character representation
            Utility_CvtHexToChr(Text:Ptr:32) ;

         //�Load if not already
            IF (%pAddr(newString) = null) ;
               include(@ClsString) ;
            ENDIF ;

         //�Build a string
            @String= newString(Name+':'+%SubSt(Text:17)) ;

         //�Finished
            RETURN @String ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //�Pick up object pointer
              @this= @ ;

           //�Check for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisToString') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //�Finished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: To Varying
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ObjectToVarying...
     P                 B
     D                 PI           510A   VARYING
     D  @                              *   CONST
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR           510A   VARYING EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Object_) BASED(@this)
      *�
     D @String         S               *
     D Varying         S            510A   VARYING
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Build a string
            @String= ObjectToString(@this) ;

         //�Load if not already
            IF (@ClsString.@newThis = null) ;
               include(@ClsString) ;
            ENDIF ;

         //�Convert to varying
            Varying= StringToVarying(@String) ;

         //�Tidy up
            StringDlt(@String) ;

         //�Finished
            RETURN Varying ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

           //�Pick up object pointer
              @this= @ ;

           //�Check for overrides
              @Virtual= ClassRtvVirtual(ObjectClass:@this:
                 'thisToVarying') ;
              IF (@Virtual = null) ;
                 LEAVESR ;
              ENDIF ;

         //�Finished
            RETURN Virtual(@this) ;
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�InterfaceCompare: Compare entries in the list
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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

         //�Pick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.Name < B.Name) ;
               RETURN -1 ;
            WHEN (A.Name > B.Name) ;
               RETURN +1 ;
            ENDSL ;

         //�Finished
            RETURN 0 ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�IfcImpCompare: Compare entries in the list
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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

         //�Pick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.FldSig < B.FldSig) ;
               RETURN -1 ;
            WHEN (A.FldSig > B.FldSig) ;
               RETURN +1 ;
            ENDSL ;

         //�Finished
            RETURN 0 ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�IfcImp: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P IfcImpDlt...
     P                 B
     D                 PI
     D  @                              *   VALUE
      *�
      /free

         //�Trash the entry itself
            Utility_MemSet(@:x'FF':%Size(IfcImp_)) ;
            DEALLOC(N) @ ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�IfcNamCompare: Compare entries in the list
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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

         //�Pick up pointers
            @A= p@A ;
            @B= p@B ;

            SELECT ;
            WHEN (A.Name < B.Name) ;
               RETURN -1 ;
            WHEN (A.Name > B.Name) ;
               RETURN +1 ;
            ENDSL ;

         //�Finished
            RETURN 0 ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�IfcNam: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P IfcNamDlt...
     P                 B
     D                 PI
     D  @                              *   VALUE
      *�
      /free

         //�Trash the entry itself
            Utility_MemSet(@:x'FF':%Size(IfcNam_)) ;
            DEALLOC(N) @ ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Finished
            RETURN SignatureCheck(@:
                     InterfaceSignature:'Interface') ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Create a Interface
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceCrt...
     P                 B
     D                 PI              *
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
      /free

         //�Allocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= InterfaceSignature ;

         //�Initialise
            this.Name= Name ;
            this.@Imps= ZIndexCrt(%pAddr(IfcImpCompare)) ;
            this.@Nams= ZIndexCrt(%pAddr(IfcNamCompare)) ;
            this.@Mths= ZIndexCrt(%pAddr(MthIdxMethodCompare)) ;
            this.@Lnks= ZIndexCrt(%pAddr(MethodCompare)) ;
            this.@Exts= ZIndexCrt(%pAddr(InterfaceCompare)) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceDlt...
     P                 B
     D                 PI
     D  @                              *
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= InterfaceSignatureCheck(@) ;

         //�Trash internals
            ZIndexClr(this.@Imps:%pAddr(IfcImpDlt)) ;
            ZIndexDlt(this.@Imps) ;

            ZIndexClr(this.@Nams:%pAddr(IfcNamDlt)) ;
            ZIndexDlt(this.@Nams) ;

            ZIndexClr(this.@Mths) ;

            ZIndexClr(this.@Lnks:%pAddr(MethodDlt)) ;
            ZIndexDlt(this.@Lnks) ;

            ZIndexDlt(this.@Exts) ;

         //�Trash the object itself
            Utility_MemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Retrieve Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceRtvName...
     P                 B
     D                 PI           126A   VARYING
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= InterfaceSignatureCheck(@) ;

         //�Finished
            RETURN this.Name ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Retrieve Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceRtv...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  @Instance                      *   CONST
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(IfcImp_)
      *�
     D @Entry          S               *
     D Entry           DS                  LIKEDS(IfcImp_) BASED(@Entry)
      *�
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
     D @SchMth         S               *   INZ(%Addr(SchMth))
     D SchMth          DS                  LIKEDS(Method_)
      *�
      /free

         //�Pick up interface
            @this= InterfaceSignatureCheck(@) ;

         //�Point at start of object
            @Object= castObject(@Instance) ;
            @Object-= Object.OffsetObject ;

         //�Set up search
            SchMth.FldSig= Object.Signature ;
            SchMth.Name=   Name ;

         //�Fetch entry from method table
            @Method= ZIndexRtv(this.@Mths:@SchMth) ;

         //�Found, so exit
            IF (@Method <> null) ;
               RETURN Method.@Handler ;
            ENDIF ;

         //�Set up search
            Search.FldSig= Object.Signature ;

         //�Fetch entry from implementation table
            @Entry= ZIndexRtv(this.@Imps:@Search) ;

         //�Fail if not found
            IF (@Entry = null) ;
               Throw('Interface '+this.Name+
                 ' is not implemented by object class.') ;
            ENDIF ;

         //�Find entry
            @Method= MthIdxRtvMethod(Object.Signature:Name) ;

         //�Error if not found
            IF (@Method = null) ;
               Throw('Interface '+this.Name+
                 ' is not implemented by object class.') ;
            ENDIF ;

         //�Add to method table
            ZIndexAdd(this.@Mths:@Method) ;

         //�Finished
            RETURN Method.@Handler ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Add Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
     D @Entry          S               *
     D Entry           DS                  LIKEDS(IfcNam_) BASED(@Entry)
      *�
      /free

         //�Pick up object
            @this= InterfaceSignatureCheck(@) ;

         //�Build entry
            @Entry= %Alloc(%Size(Entry)) ;
            Entry.Name= Name ;

         //�Add entry
            ZIndexAdd(this.@Nams:@Entry) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceImplements...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Class                         *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
     D j               S             10I 0
      *�
     D @Name           S               *
     D Name            S            126A   VARYING BASED(@Name)
      *�
     D @Entry          S               *
     D Entry           DS                  LIKEDS(IfcImp_) BASED(@Entry)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
     D Class           DS                  LIKEDS(Class_) BASED(@Class)
      *�
     D @Ifc            S               *
      *�
      /free

         //�Pick up object
            @this= InterfaceSignatureCheck(@) ;

         //�Loop through required procedure names
            FOR j= 1 TO ZIndexSize(this.@Nams) ;

            //�Fetch Name
               @Name= ZIndexElementAtIndex(this.@Nams:j-1) ;

               //�Fetch method from class
                  @Method= ClassRtv(@Class:Name) ;

               //�Check if procedure address is valid
                  IF (@Method = null) OR
                     (%BitAND(Method.Access:ACCESS_PUBLIC) = 0) ;
                     Throw('Interface '+this.Name+' requires public '+
                       'method '+Name+' to be implemented by Class '+
                       ClassRtvName(@Class)+'.') ;
                  ENDIF ;

         //�Next entry
            ENDFOR ;

         //�Build entry
            @Entry= %Alloc(%Size(Entry)) ;
            Entry.FldSig= Class.FldSig ;

         //�Add entry to implementation index
            ZIndexAdd(this.@Imps:@Entry) ;

         //�Add interface to the class
            ZIndexAdd(Class.@Ifcs:@this) ;

         //�Loop through interfaces that this interface extends
            FOR j= 1 To ZIndexSize(this.@Exts) ;

            //�Fetch interface
               @Ifc= ZIndexElementAtIndex(this.@Exts:j-1) ;

            //�Run implements for that interface too
               InterfaceImplements(@Ifc:@Class) ;

         //�Loop
            ENDFOR ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceCast...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Instance                      *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(IfcImp_)
      *�
     D @Entry          S               *
     D Entry           DS                  LIKEDS(IfcImp_) BASED(@Entry)
      *�
      /free

         //�Pick up object
            @this= InterfaceSignatureCheck(@) ;

         //�Must be an object
            @Object= castObject(@Instance) ;
            @Object-= Object.OffsetObject ;

         //�Set up search
            Search.FldSig= Object.Signature ;

         //�Fetch entry from implementation table
            @Entry= ZIndexRtv(this.@Imps:@Search) ;

         //�Fail if not found
            IF (@Entry = null) ;
               Throw('Interface '+this.Name+
                 ' is not implemented by object class.') ;
            ENDIF ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Link
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassLink...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Class_) BASED(@this)
      *�
     D @that           S               *
     D that            DS                  LIKEDS(Class_) BASED(@that)
      *�
      *�
     D j               S             10I 0
     D SubClass        S               N   INZ(false)
      *�
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      *�
     D @Entry          S               *
     D Entry           DS                  QUALIFIED BASED(@Entry)
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      *�
     D EntryCount      S             10I 0
     D Hash            S             16A
      *�
      /free

         //�Pick up object
            @this= ClassSignatureCheck(@) ;

         //�Point at template
            @Header= @Template ;

         //�Check Template
            EXSR CheckTemplate ;

         //�Test for SubClass
            EXSR TestSubClass ;

         //�Retrieve cached template if possible
            IF (@SubClass = null) AND
               (TemplateCacheRtv(this.@Cache:@Header) = true) ;
               RETURN ;
            ENDIF ;

         //�Generate a hash for this template
            Hash= Utility_MD5Hash(@Header:Header.Size) ;

         //�Process all entries
            FOR j= 1 TO EntryCount ;

            //�Point at requested entry
               @Entry= @Header+%Size(Header)+((j-1)*%Size(Entry)) ;

            //�Use different retreval method if appropriate
               IF (SubClass = true) ;
                  Entry.@Addr= ClassRtvProtected(@this:Entry.Name) ;
               ELSE ;
                  Entry.@Addr= ClassRtvPublic(@this:Entry.Name) ;
               ENDIF ;

            //�Point at next entry
               @Entry+= %Size(Entry) ;

         //�Loop
            ENDFOR ;

         //�Cache the finished version
            IF (@SubClass = null) ;
               TemplateCacheAdd(this.@Cache:@Header:Hash) ;
            ENDIF ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Test for Sub Class
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR TestSubClass ;

            //�Quit if no SubClass parameter was passed
               IF (@SubClass = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Must be a class
               @that= ClassSignatureCheck(@SubClass) ;

            //�Search up chain of classes
               DOW (@that <> null) ;
                  IF (@that = @this) ;
                     SubClass= true ;
                     LEAVESR ;
                  ENDIF ;
                  @that= that.@Super ;
               ENDDO ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Check template
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CheckTemplate ;

            //�It must have the correct signature
               SignatureCheck(@Header:TemplateSignature:'ClassLinkTemplate') ;

            //�Check that it has the correct size
               IF (%Rem(Header.Size-%Size(Header):%Size(Entry)) <> 0) ;
                  Throw('Badly formed ClassLinkTemplate length') ;
               ENDIF ;

            //�Convert size to an entry count
               EntryCount= (Header.Size-%Size(Header))/%Size(Entry) ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Link Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ClassLinkName...
     P                 B
     D                 PI           126A   VARYING
     D  @Template                      *   CONST
      *�
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      *�
      /free

         //�Point at template
            @Header= @Template ;

         //�It must have the correct signature
            SignatureCheck(@Header:TemplateSignature:'ClassLinkTemplate') ;

         //�Finished
            RETURN Header.Name ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newInterface...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Marker                       16A
     D  Name                        126A   VARYING
     D  Access                       10I 0
     D  SizeTemplate                 10I 0
     D                                8A
      *�
     D @Detail         S               *
     D Detail          DS                  QUALIFIED BASED(@Detail)
     D  Name                        126A   VARYING
     D  @Handler                       *   PROCPTR
      *�
     D j               S             10I 0
     D Count           S             10I 0
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Point at template
            @Header= %Addr(pTemplate) ;

         //�Check for marker
            IF (Header.Marker <> '*IFACE*TEMPLATE*') ;
               Throw('Invalid Interface Template') ;
            ENDIF ;

         //�Calculate detail count
            Count= Header.SizeTemplate-%Size(Header) ;
            IF (%Rem(Count:%Size(Detail)) <> 0) ;
               Throw('Invalid Interface template detail') ;
            ENDIF ;
            Count= Count/%Size(Detail) ;

         //�Form interface
            @this= InterfaceCrt(Header.Name) ;

         //�Initialise fields
            this.Access= Header.Access ;

         //�Point at first detail
            @Detail= @Header+%Size(Header) ;

         //�Loop through method details
            FOR j= 1 TO Count ;

            //�Form basic method
               @Method= MethodCrt(Detail.Name:
                  Detail.@Handler:ACCESS_PUBLIC) ;

            //�Add to interface link list
               ZIndexAdd(this.@Lnks:@Method) ;

            //�Include in names list if appropriate
               IF (Detail.Name <> 'implementsThis') AND
                  (Detail.Name <> 'castThis') AND
                  (Detail.Name <> 'instanceOfThis') AND
                  (Detail.Name <> 'extendsThis') ;
                  InterfaceAdd(@this:Detail.Name) ;
               ENDIF ;

            //�Point to next method
               @Detail+= %Size(Detail) ;

         //�Loop
            ENDFOR ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceExtends...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @@                             *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
     D @Ifc            S               *
     D ifc             DS                  LIKEDS(Interface_) BASED(@Ifc)
      *�
     D j               S             10I 0
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Pick up objects
            @this= InterfaceSignatureCheck(@) ;
            @Ifc=  InterfaceSignatureCheck(@@) ;

         //�Process each link in the base interface
            FOR j= 1 TO ZIndexSize(this.@Lnks) ;

            //�Fetch method
               @Method= ZIndexElementAtIndex(this.@Lnks:j-1) ;

            //�Include in new interface if appropriate
               IF (Method.Name <> 'implementsThis') AND
                  (Method.Name <> 'castThis') AND
                  (Method.Name <> 'extendsThis') AND
                  (Method.Name <> 'instanceOfThis') AND
                  (ZIndexHas(Ifc.@Lnks:@Method) = false) ;

               //�Add to names list and links list
                  InterfaceAdd(@Ifc:Method.Name) ;
                  ZIndexAdd(Ifc.@Lnks:@Method) ;

               ENDIF ;

         //�Loop
            ENDFOR ;

         //�Add the interface itself to the extension list
            ZIndexAdd(Ifc.@Exts:@this) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Retrieve Link
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceRtvLink...
     P                 B
     D                 PI              *   PROCPTR
     D  @                              *   CONST
     D  Name                        126A   VARYING CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(Method_)
      *�
     D @Method         S               *
     D Method          DS                  LIKEDS(Method_) BASED(@Method)
      *�
      /free

         //�Pick up interface definition
            @this= InterfaceSignatureCheck(@) ;

         //�Set up search
            Search.Name= Name ;

         //�Fetch method
            @Method= ZIndexRtv(this.@Lnks:@Search) ;

         //�Decide what to do
            SELECT ;

         //�Error if not found
            WHEN (@Method = null) ;
               Throw('Method '+Name+' not found for Interface '+
                 this.Name+'.') ;

         //�Not public, so hide result
            WHEN (%BitAND(Method.Access:ACCESS_PUBLIC) = 0) ;
               RETURN null ;

            ENDSL ;

         //�Finished
            RETURN Method.@Handler ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Link
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceLink...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Template                      *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
     D j               S             10I 0
      *�
     D @Header         S               *
     D Header          DS                  QUALIFIED BASED(@Header)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      *�
     D @Entry          S               *
     D Entry           DS                  QUALIFIED BASED(@Entry)
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      *�
     D EntryCount      S             10I 0
      *�
      /free

         //�Pick up object
            @this= InterfaceSignatureCheck(@) ;

         //�Point at template
            @Header= @Template ;

         //�Check Template
            EXSR CheckTemplate ;

         //�Process all entries
            FOR j= 1 TO EntryCount ;

            //�Point at requested entry
               @Entry= @Header+%Size(Header)+((j-1)*%Size(Entry)) ;

            //�Fetch address
               Entry.@Addr= InterfaceRtvLink(@this:Entry.Name) ;

            //�Point at next entry
               @Entry+= %Size(Entry) ;

         //�Loop
            ENDFOR ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Check template
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR CheckTemplate ;

            //�It must have the correct signature
               SignatureCheck(@Header:TemplateSignature:'ClassLinkTemplate') ;

            //�Check that it has the correct size
               IF (%Rem(Header.Size-%Size(Header):%Size(Entry)) <> 0) ;
                  Throw('Badly formed ClassLinkTemplate length') ;
               ENDIF ;

            //�Convert size to an entry count
               EntryCount= (Header.Size-%Size(Header))/%Size(Entry) ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P InterfaceInstanceOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @@                             *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Interface_) BASED(@this)
      *�
     D @Object         S               *
     D Object          DS                  LIKEDS(Object_) BASED(@Object)
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(IfcImp_)
      *�
     D @Entry          S               *
      *�
      /free

         //�Pick up class definition
            @this= InterfaceSignatureCheck(@) ;

         //�Null pointer
            IF (@@ = null) ;
               RETURN INTERFACE_INSTANCE_NULL ;
            ENDIF ;

         //�Point at potential object
            @Object= @@ ;

         //�Detect and adjust for dispatch marker
            IF (Object.Signature = SpecialSignature) ;
               @Object-= 16 ;
            ENDIF ;

         //�Must be a recognised Object
            IF (Object.Prefix <> ObjectPrefix) ;
               RETURN INTERFACE_INSTANCE_NOT_AN_OBJECT ;
            ENDIF ;

         //�Make sure object pointer is pointing at start of Object memory
            @Object-= Object.OffsetObject ;

         //�Set up search
            Search.FldSig= Object.Signature ;

         //�Fetch entry from implementation table
            @Entry= ZIndexRtv(this.@Imps:@Search) ;

         //�Signature found, so quit
            IF (@Entry <> null) ;
               RETURN INTERFACE_INSTANCE_EXACT_MATCH ;
            ENDIF ;

         //�Finished
            RETURN INTERFACE_INSTANCE_UNRELATED ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Interface definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ComparableInterface...
     P                 B
     D                 PI              *
      *�
     D @this           S               *   STATIC INZ(null)
      *
      *�Interface Definition Template
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
      *�
      /free

         //�Return pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //�Build interface definition
            @this= newInterface(#template) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsComparable...
     P                 B
     D                 PI
     D  @Interface                     *   CONST
      *�
      /free

         //�Send any errors back to the caller
            MONITOR ;
               InterfaceExtends(ComparableInterface():
                 @Interface) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castComparable...
     P                 B
     D                 PI
     D  @this                          *   CONST
      *�
      /free

         //�Send any errors back to the caller
            MONITOR ;
               InterfaceCast(ComparableInterface():
                 @this) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfComparable...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *�
      /free

         //�Finished
            RETURN (
              InterfaceInstanceOf(
                ComparableInterface():
                @Object) = INTERFACE_INSTANCE_EXACT_MATCH) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P implementsComparable...
     P                 B
     D                 PI
     D  @Class                         *   CONST
      *�
      /free

         //�Send any errors back to the caller
            MONITOR ;
               InterfaceImplements(ComparableInterface():
                 @Class) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ComparableDlt...
     P                 B
     D                 PI              *
     D  @this                          *
      *�
      /free

         //�Must be correct type
            InterfaceCast(ComparableInterface():@this) ;

         //�Finished
            RETURN ObjectDlt(@this) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: CompareTo
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ComparableCompareTo...
     P                 B
     D                 PI            10I 0
     D  @this                          *   CONST
     D  @that                          *   CONST
      *�
     D @Action         S               *   PROCPTR
     D Action          PR            10I 0 EXTPROC(@Action)
     D  @this                          *   CONST
     D  @that                          *   CONST
      *�
      /free

         //�Send any errors back to the caller
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
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Pool Start (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_PoolStart...
     P                 B
     D                 PI
      *�
      /free

         //�Use the pool address as a marker
            ZArrayAdd(@Pool:@Pool) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Pool End (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P Object_PoolEnd...
     P                 B
     D                 PI
      *�
     D j               S             10I 0
     D x               S             10I 0
     D @Object         S               *
     D Object          DS                  LIKEDS(ObjIns_) BASED(@Object)
      *�
      /free

         //�Work back through stack
            FOR j= ZArraySize(@Pool)-1 DOWNTO 0 ;

            //�Pick up object
               @Object= ZArrayRtv(@Pool:j) ;

            //�Test object
               x= ClassInstanceOf(ObjectClass():@Object) ;

            //�Decide what to do
               SELECT ;

            //�End marker, so remove and quit
               WHEN (@Object = @Pool) ;
                  ZArrayRmv(@Pool:j) ;
                  LEAVE ;

            //�Null, so remove
               WHEN (x = CLASS_INSTANCE_NULL) ;
                  ZArrayRmv(@Pool:j) ;

            //�Invalid, so remove
               WHEN (x = CLASS_INSTANCE_NOT_AN_OBJECT) ;
                  ZArrayRmv(@Pool:j) ;

            //�Object requiring deletion
               WHEN (Object.RefCount <= 0) ;
                  ZArrayRmv(@Pool:j) ;
                  ObjectDlt(@Object) ;
               ENDSL ;

         //�Loop
            ENDFOR ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
