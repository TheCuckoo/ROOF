      *�
      *�Copyright (c) 2016 Ray Gillies-Jones. All rights reserved.
      *�
      *�See details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      *�
      *�--------------------------------------------------------------------------------------------
      *�Class: Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @ClsArray...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSARRAY')
     D                               10I 0 INZ(%Size(@ClsArray))
     D                              126A   VARYING INZ(
     D                                     'Array')
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
     D  @newThisWithSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'newThisWithSize')
      *
     D  @thisDlt...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
      *
     D  @thisAdd...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisAdd')
      *�
     D  @thisAddAll...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisAddAll')
      *�
     D  @thisClear...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisClear')
      *�
     D  @thisClone...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisClone')
      *�
     D  @thisContains...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisContains')
      *�
     D  @thisContainsAll...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisContainsAll')
      *�
     D  @thisIndexOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisIndexOf')
      *�
     D  @thisLastIndexOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLastIndexOf')
      *�
     D  @thisHashCode...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
      *�
     D  @thisIsEmpty...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisIsEmpty')
      *�
     D  @thisChgCapacity...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisChgCapacity')
      *�
     D  @thisChg...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisChg')
      *�
     D  @thisNewIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
      *�
     D  @thisNewListIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewListIterator')
      *�
     D  @thisRtv...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtv')
      *�
     D  @thisRemove...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
      *�
     D  @thisRemoveAll...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemoveAll')
      *�
     D  @thisRemoveObject...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemoveObject')
      *�
     D  @thisRemoveRange...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemoveRange')
      *�
     D  @thisResize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisResize')
      *�
     D  @thisRetainAll...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRetainAll')
      *�
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
      *�
     D  @thisSort...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSort')
      *�
     D  @thisSubList...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSubList')
      *�
     D  @thisToArray...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToArray')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Extend class to create a new class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsArray...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @extendsThis)
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castArray...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @castThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfArray...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArray...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @newThis)
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New with Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArrayWithSize...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @newThisWithSize)
     D  Size                         10U 0 CONST
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayDlt...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisDlt)
     D  @Array                         *
      *�
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Add element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayAdd...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisAdd)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Add all
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayAddAll...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisAddAll)
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Change Element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayChg...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisChg)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Change Capacity
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayChgCapacity...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisChgCapacity)
     D  @Array                         *   CONST
     D  Capacity                     10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Clear
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClear...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisClear)
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Clone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClone...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisClone)
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Contains
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayContains...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisContains)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Contains All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayContainsAll...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisContainsAll)
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsArray.
     D                                     @thisHashCode)
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Index Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIndexOf...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsArray.
     D                                     @thisIndexOf)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Test if empty
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisIsEmpty)
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Last Index Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayLastIndexOf...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsArray.
     D                                     @thisLastIndexOf)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New Iterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayNewIterator...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisNewIterator)
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New ListIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayNewListIterator...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisNewListIterator)
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Retrieve Element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRtv...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRtv)
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove Element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemove...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRemove)
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveAll...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRemoveAll)
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove Object
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveObject...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRemoveObject)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove Range
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveRange...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRemoveRange)
     D  @Array                         *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Resize
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayResize...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisResize)
     D  @Array                         *   CONST
     D  Size                         10U 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Retain All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRetainAll...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRetainAll)
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySize...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsArray.
     D                                     @thisSize)
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Sort
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySort...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisSort)
     D  @Array                         *   CONST
     D  @Comparator                    *   CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: SubList
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySubList...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisSubList)
     D  @Array                         *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Convert To Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayToArray...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisToArray)
     D  @Array                         *   CONST
      *�
