      *�
      *�Copyright (c) 2016 Ray Gillies-Jones. All rights reserved.
      *�
      *�See details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      *�
      *�--------------------------------------------------------------------------------------------
      *�Definitions
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_         S             48A   BASED(@NULL)
      *�
      *�Access Constants
     D ACCESS_PUBLIC...
     D                 C                   CONST(1)
      *�
     D ACCESS_PROTECTED...
     D                 C                   CONST(2)
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
     D ACCESS_PUB_ABS...
     D                 C                   CONST(65)
      *�
     D ACCESS_PUB_ABS_FIN...
     D                 C                   CONST(97)
      *�
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
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Object
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @ClsObject...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSOBJECT')
     D                               10I 0 INZ(%Size(@ClsObject))
     D                              126A   VARYING INZ(
     D                                     'Object')
     D                                7A
      *�
     D  @extendsThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'extendsThis')
      *
     D  @castThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'castThis')
      *
     D  @instanceOfThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'instanceOfThis')
      *
     D  @newThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'newThis')
      *
     D  @thisDlt...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
      *
     D  @staticDelete...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticDelete')
      *�
     D  @staticAssign...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticAssign')
      *�
     D  @thisClone...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisClone')
      *�
     D  @thisEquals...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
      *�
     D  @staticEquals...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticEquals')
      *�
     D  @thisHashCode...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
      *�
     D  @thisRelease...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRelease')
      *�
     D  @staticPoolEnd...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticPoolEnd')
      *�
     D  @staticPoolStart...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticPoolStart')
      *�
     D  @staticRelease...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticRelease')
      *�
     D  @thisReleaseDelete...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisReleaseDelete')
      *�
     D  @staticReleaseDelete...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticReleaseDelete')
      *�
     D  @thisRetain...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRetain')
      *�
     D  @staticRetain...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticRetain')
      *�
     D  @thisRetainCount...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRetainCount')
      *�
     D  @thisRtvClassName...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvClassName')
      *�
     D  @thisToString...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToString')
      *�
     D  @thisToVarying...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToVarying')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Extend class to create a new class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsObject...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @extendsThis)
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castObject...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @castThis)
     D  @                              *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfObject...
     D                 PR              N
     D                                     EXTPROC(@ClsObject.
     D                                     @instanceOfThis)
     D  @                              *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newObject...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @newThis)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectDlt...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisDlt)
     D  @Object                        *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Delete (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Delete...
     D                 PR
     D                                     EXTPROC(@ClsObject.
     D                                     @staticDelete)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Assign (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Assign...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticAssign)
     D  @Variable                      *
     D  @Value                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Clone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectClone...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisClone)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Equals
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectEquals...
     D                 PR              N
     D                                     EXTPROC(@ClsObject.
     D                                     @thisEquals)
     D  @Object                        *   CONST
     D  @CompareTo                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Equals (static, handles nulls)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Equals...
     D                 PR              N
     D                                     EXTPROC(@ClsObject.
     D                                     @staticEquals)
     D  @ObjectOrNull                  *   CONST
     D  @ObjectOrNull                  *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsObject.
     D                                     @thisHashCode)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRelease...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisRelease)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Release...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticRelease)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release and Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectReleaseDelete...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisReleaseDelete)
     D  @Object                        *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Release and Delete (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_ReleaseDelete...
     D                 PR
     D                                     EXTPROC(@ClsObject.
     D                                     @staticReleaseDelete)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retain
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRetain...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisRetain)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retain (Static)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Retain...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticRetain)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retain Count
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRetainCount...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsObject.
     D                                     @thisRetainCount)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: Retrieve Class Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRtvClassName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@ClsObject.
     D                                     @thisRtvClassName)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: To String
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectToString...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisToString)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Object: To Varying
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectToVarying...
     D                 PR           510A   VARYING
     D                                     EXTPROC(@ClsObject.
     D                                     @thisToVarying)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Convienience Methods
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Assign...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticAssign)
     D  @Variable                      *
     D  @Value                         *   CONST
      *�
     D Release...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticRelease)
     D  @Object                        *   CONST
      *�
     D ReleaseDlt...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticReleaseDelete)
     D  @Object                        *
      *�
     D Retain...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticRetain)
     D  @Object                        *   CONST
      *�
     D Drain...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticPoolEnd)
      *�
     D Pool...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticPoolStart)
      *�
      *�
      *�============================================================================================
      *�
      *�
     D @ClsClass...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSOBJECT')
     D                               10I 0 INZ(%Size(@ClsClass))
     D                              126A   VARYING INZ(
     D                                     'Class')
     D                                7A
      *�
     D  @thisSignatureCheck...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSignatureCheck')
      *�
     D  @thisRtvName...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvName')
      *�
     D  @thisRtvSignature...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvSignature')
      *�
     D  @thisExtends...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisExtends')
      *�
     D  @thisNewInstance...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewInstance')
      *�
     D  @thisCast...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisCast')
      *�
     D  @thisInstanceOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisInstanceOf')
      *�
     D  @thisInstanceCheck...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisInstanceCheck')
      *�
     D  @thisRtvVirtual...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvVirtual')
      *�
     D  @thisRtvSuper...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvSuper')
      *�
     D  @thisRtvPublic...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvPublic')
      *�
     D  @thisRtvProtected...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvProtected')
      *�
     D  @thisLink...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLink')
      *�
     D  @thisLinkName...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLinkName')
      *�
     D  @superClone...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'superClone')
      *�
     D  @superFinalise...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'superFinalise')
      *�
     D  @superInitialise...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'superInitialise')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassSignatureCheck...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisSignatureCheck)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvName)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Signature
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvSignature...
     D                 PR            16A
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvSignature)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Create a new class by extending an existing class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassExtends...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisExtends)
     D  @SuperClass                    *   CONST
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Create a new instance of this class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassNewInstance...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisNewInstance)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Extended Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassCast...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisCast)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Instance Of test
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassInstanceOf...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsClass.
     D                                     @thisInstanceOf)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Instance Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassInstanceCheck...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisInstanceCheck)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Virtual Method Address
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvVirtual...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvVirtual)
     D  @Class                         *   CONST
     D  @Object                        *
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Superclass Method Address
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvSuper...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvSuper)
     D  @Class                         *   CONST
     D  @Object                        *
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Public Method routing address
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvPublic...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvPublic)
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Retrieve Protected Method Address
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvProtected...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvProtected)
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Link
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassLink...
     D                 PR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisLink)
     D  @Class                         *   CONST
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Link Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassLinkName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@ClsClass.
     D                                     @thisLinkName)
     D  @Template                      *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�superClone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D superClone...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @superClone)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�superFinalise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D superFinalise...
     D                 PR
     D                                     EXTPROC(@ClsClass.
     D                                     @superFinalise)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�superInitialise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D superInitialise...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @superInitialise)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *�
      *�
      *�============================================================================================
      *�
      *�
     D @ClsInterface...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSOBJECT')
     D                               10I 0 INZ(%Size(@ClsInterface))
     D                              126A   VARYING INZ(
     D                                     'Interface')
     D                                7A
      *�
     D  @thisSignatureCheck...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSignatureCheck')
      *�
     D  @newThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'newThis')
      *�
     D  @thisRtvName...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvName')
      *�
     D  @thisRtv...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtv')
      *�
     D  @thisImplements...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisImplements')
      *�
     D  @thisCast...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisCast')
      *�
     D  @thisExtends...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisExtends')
      *�
     D  @thisInstanceOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisInstanceOf')
      *�
     D  @thisLink...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLink')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceSignatureCheck...
     D                 PR              *
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisSignatureCheck)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newInterface...
     D                 PR              *
     D                                     EXTPROC(@ClsInterface.
     D                                     @newThis)
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Retrieve Name
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtvName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisRtvName)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Retrieve Entry
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtv...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisRtv)
     D  @Interface                     *   CONST
     D  @Instance                      *   CONST
     D  Name                        126A   VARYING CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceImplements...
     D                 PR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisImplements)
     D  @Interface                     *   CONST
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceCast...
     D                 PR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisCast)
     D  @Interface                     *   CONST
     D  @Instance                      *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceExtends...
     D                 PR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisExtends)
     D  @IfcSource                     *   CONST
     D  @IfcTarget                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Instance Of test
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceInstanceOf...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisInstanceOf)
     D  @Interface                     *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Interface: Link
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceLink...
     D                 PR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisLink)
     D  @Interface                     *   CONST
     D  @Template                      *   CONST
      *�
      *�============================================================================================
      *�
      *�____________________________________________________________________________________________
      *�Prototypes for Interface Comparable
      *�--------------------------------------------------------------------------------------------
      *�
     D @IfcComparable...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSOBJECT')
     D                               10I 0 INZ(%Size(@IfcComparable))
     D                              126A   VARYING INZ(
     D                                     'Comparable')
     D                                7A
      *�
     D  @extendsThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'extendsThis')
      *
     D  @castThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'castThis')
      *
     D  @instanceOfThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'instanceOfThis')
      *�
     D  @implementsThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'implementsThis')
      *�
     D  @thisDlt...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
      *�
     D  @thisCompareTo...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisCompareTo')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsComparable...
     D                 PR
     D                                     EXTPROC(@IfcComparable.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castComparable...
     D                 PR
     D                                     EXTPROC(@IfcComparable.
     D                                     @castThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfComparable...
     D                 PR              N
     D                                     EXTPROC(@IfcComparable.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsComparable...
     D                 PR
     D                                     EXTPROC(@IfcComparable.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcComparable.
     D                                     @thisDlt)
     D  @ObjectA                       *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparable: CompareTo
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableCompareTo...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcComparable.
     D                                     @thisCompareTo)
     D  @ObjectA                       *   CONST
     D  @ObjectB                       *   CONST
      *�
      *�============================================================================================
      *�
