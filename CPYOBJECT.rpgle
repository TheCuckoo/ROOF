      *À
      *ÀCopyright (c) 2016 Ray Gillies-Jones. All rights reserved.
      *À
      *ÀSee details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀDefinitions
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_         S             48A   BASED(@NULL)
      *À
      *ÀAccess Constants
     D ACCESS_PUBLIC...
     D                 C                   CONST(1)
      *À
     D ACCESS_PROTECTED...
     D                 C                   CONST(2)
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
     D ACCESS_PUB_ABS...
     D                 C                   CONST(65)
      *À
     D ACCESS_PUB_ABS_FIN...
     D                 C                   CONST(97)
      *À
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
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Object
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @ClsObject...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSOBJECT')
     D                               10I 0 INZ(%Size(@ClsObject))
     D                              126A   VARYING INZ(
     D                                     'Object')
     D                                7A
      *À
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
      *À
     D  @staticAssign...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticAssign')
      *À
     D  @thisClone...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisClone')
      *À
     D  @thisEquals...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
      *À
     D  @staticEquals...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticEquals')
      *À
     D  @thisHashCode...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
      *À
     D  @thisRelease...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRelease')
      *À
     D  @staticPoolEnd...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticPoolEnd')
      *À
     D  @staticPoolStart...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticPoolStart')
      *À
     D  @staticRelease...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticRelease')
      *À
     D  @thisReleaseDelete...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisReleaseDelete')
      *À
     D  @staticReleaseDelete...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticReleaseDelete')
      *À
     D  @thisRetain...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRetain')
      *À
     D  @staticRetain...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'staticRetain')
      *À
     D  @thisRetainCount...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRetainCount')
      *À
     D  @thisRtvClassName...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvClassName')
      *À
     D  @thisToString...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToString')
      *À
     D  @thisToVarying...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToVarying')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Extend class to create a new class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsObject...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @extendsThis)
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castObject...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @castThis)
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfObject...
     D                 PR              N
     D                                     EXTPROC(@ClsObject.
     D                                     @instanceOfThis)
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newObject...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @newThis)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectDlt...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisDlt)
     D  @Object                        *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Delete (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Delete...
     D                 PR
     D                                     EXTPROC(@ClsObject.
     D                                     @staticDelete)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Assign (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Assign...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticAssign)
     D  @Variable                      *
     D  @Value                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Clone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectClone...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisClone)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectEquals...
     D                 PR              N
     D                                     EXTPROC(@ClsObject.
     D                                     @thisEquals)
     D  @Object                        *   CONST
     D  @CompareTo                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Equals (static, handles nulls)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Equals...
     D                 PR              N
     D                                     EXTPROC(@ClsObject.
     D                                     @staticEquals)
     D  @ObjectOrNull                  *   CONST
     D  @ObjectOrNull                  *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsObject.
     D                                     @thisHashCode)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRelease...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisRelease)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Release...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticRelease)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release and Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectReleaseDelete...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisReleaseDelete)
     D  @Object                        *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Release and Delete (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_ReleaseDelete...
     D                 PR
     D                                     EXTPROC(@ClsObject.
     D                                     @staticReleaseDelete)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retain
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRetain...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisRetain)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retain (Static)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Object_Retain...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticRetain)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retain Count
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRetainCount...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsObject.
     D                                     @thisRetainCount)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: Retrieve Class Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectRtvClassName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@ClsObject.
     D                                     @thisRtvClassName)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: To String
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectToString...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @thisToString)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀObject: To Varying
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ObjectToVarying...
     D                 PR           510A   VARYING
     D                                     EXTPROC(@ClsObject.
     D                                     @thisToVarying)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConvienience Methods
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Assign...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticAssign)
     D  @Variable                      *
     D  @Value                         *   CONST
      *À
     D Release...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticRelease)
     D  @Object                        *   CONST
      *À
     D ReleaseDlt...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticReleaseDelete)
     D  @Object                        *
      *À
     D Retain...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticRetain)
     D  @Object                        *   CONST
      *À
     D Drain...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticPoolEnd)
      *À
     D Pool...
     D                 PR              *
     D                                     EXTPROC(@ClsObject.
     D                                     @staticPoolStart)
      *À
      *À
      *À============================================================================================
      *À
      *À
     D @ClsClass...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSOBJECT')
     D                               10I 0 INZ(%Size(@ClsClass))
     D                              126A   VARYING INZ(
     D                                     'Class')
     D                                7A
      *À
     D  @thisSignatureCheck...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSignatureCheck')
      *À
     D  @thisRtvName...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvName')
      *À
     D  @thisRtvSignature...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvSignature')
      *À
     D  @thisExtends...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisExtends')
      *À
     D  @thisNewInstance...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewInstance')
      *À
     D  @thisCast...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisCast')
      *À
     D  @thisInstanceOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisInstanceOf')
      *À
     D  @thisInstanceCheck...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisInstanceCheck')
      *À
     D  @thisRtvVirtual...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvVirtual')
      *À
     D  @thisRtvSuper...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvSuper')
      *À
     D  @thisRtvPublic...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvPublic')
      *À
     D  @thisRtvProtected...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvProtected')
      *À
     D  @thisLink...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLink')
      *À
     D  @thisLinkName...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLinkName')
      *À
     D  @superClone...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'superClone')
      *À
     D  @superFinalise...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'superFinalise')
      *À
     D  @superInitialise...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'superInitialise')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassSignatureCheck...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisSignatureCheck)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvName)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Signature
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvSignature...
     D                 PR            16A
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvSignature)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Create a new class by extending an existing class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassExtends...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisExtends)
     D  @SuperClass                    *   CONST
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Create a new instance of this class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassNewInstance...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisNewInstance)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀExtended Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassCast...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisCast)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInstance Of test
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassInstanceOf...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsClass.
     D                                     @thisInstanceOf)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInstance Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassInstanceCheck...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @thisInstanceCheck)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Virtual Method Address
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvVirtual...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvVirtual)
     D  @Class                         *   CONST
     D  @Object                        *
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Superclass Method Address
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvSuper...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvSuper)
     D  @Class                         *   CONST
     D  @Object                        *
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Public Method routing address
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvPublic...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvPublic)
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Retrieve Protected Method Address
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassRtvProtected...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisRtvProtected)
     D  @Class                         *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassLink...
     D                 PR
     D                                     EXTPROC(@ClsClass.
     D                                     @thisLink)
     D  @Class                         *   CONST
     D  @Template                      *   CONST
     D  @SubClass                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Link Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ClassLinkName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@ClsClass.
     D                                     @thisLinkName)
     D  @Template                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀsuperClone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D superClone...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @superClone)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀsuperFinalise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D superFinalise...
     D                 PR
     D                                     EXTPROC(@ClsClass.
     D                                     @superFinalise)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀsuperInitialise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D superInitialise...
     D                 PR              *
     D                                     EXTPROC(@ClsClass.
     D                                     @superInitialise)
     D  @Class                         *   CONST
     D  @Object                        *   CONST
      *À
      *À
      *À============================================================================================
      *À
      *À
     D @ClsInterface...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSOBJECT')
     D                               10I 0 INZ(%Size(@ClsInterface))
     D                              126A   VARYING INZ(
     D                                     'Interface')
     D                                7A
      *À
     D  @thisSignatureCheck...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSignatureCheck')
      *À
     D  @newThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'newThis')
      *À
     D  @thisRtvName...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtvName')
      *À
     D  @thisRtv...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtv')
      *À
     D  @thisImplements...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisImplements')
      *À
     D  @thisCast...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisCast')
      *À
     D  @thisExtends...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisExtends')
      *À
     D  @thisInstanceOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisInstanceOf')
      *À
     D  @thisLink...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLink')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceSignatureCheck...
     D                 PR              *
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisSignatureCheck)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newInterface...
     D                 PR              *
     D                                     EXTPROC(@ClsInterface.
     D                                     @newThis)
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Retrieve Name
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtvName...
     D                 PR           126A   VARYING
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisRtvName)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Retrieve Entry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceRtv...
     D                 PR              *   PROCPTR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisRtv)
     D  @Interface                     *   CONST
     D  @Instance                      *   CONST
     D  Name                        126A   VARYING CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceImplements...
     D                 PR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisImplements)
     D  @Interface                     *   CONST
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceCast...
     D                 PR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisCast)
     D  @Interface                     *   CONST
     D  @Instance                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceExtends...
     D                 PR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisExtends)
     D  @IfcSource                     *   CONST
     D  @IfcTarget                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Instance Of test
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceInstanceOf...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisInstanceOf)
     D  @Interface                     *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInterface: Link
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D InterfaceLink...
     D                 PR
     D                                     EXTPROC(@ClsInterface.
     D                                     @thisLink)
     D  @Interface                     *   CONST
     D  @Template                      *   CONST
      *À
      *À============================================================================================
      *À
      *À____________________________________________________________________________________________
      *ÀPrototypes for Interface Comparable
      *À--------------------------------------------------------------------------------------------
      *À
     D @IfcComparable...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSOBJECT')
     D                               10I 0 INZ(%Size(@IfcComparable))
     D                              126A   VARYING INZ(
     D                                     'Comparable')
     D                                7A
      *À
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
      *À
     D  @implementsThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'implementsThis')
      *À
     D  @thisDlt...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
      *À
     D  @thisCompareTo...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisCompareTo')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsComparable...
     D                 PR
     D                                     EXTPROC(@IfcComparable.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castComparable...
     D                 PR
     D                                     EXTPROC(@IfcComparable.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfComparable...
     D                 PR              N
     D                                     EXTPROC(@IfcComparable.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsComparable...
     D                 PR
     D                                     EXTPROC(@IfcComparable.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcComparable.
     D                                     @thisDlt)
     D  @ObjectA                       *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparable: CompareTo
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparableCompareTo...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcComparable.
     D                                     @thisCompareTo)
     D  @ObjectA                       *   CONST
     D  @ObjectB                       *   CONST
      *À
      *À============================================================================================
      *À
