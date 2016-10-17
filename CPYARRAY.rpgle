      *À
      *ÀCopyright (c) 2016 Ray Gillies-Jones. All rights reserved.
      *À
      *ÀSee details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @ClsArray...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSARRAY')
     D                               10I 0 INZ(%Size(@ClsArray))
     D                              126A   VARYING INZ(
     D                                     'Array')
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
      *À
     D  @thisAddAll...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisAddAll')
      *À
     D  @thisClear...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisClear')
      *À
     D  @thisClone...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisClone')
      *À
     D  @thisContains...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisContains')
      *À
     D  @thisContainsAll...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisContainsAll')
      *À
     D  @thisIndexOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisIndexOf')
      *À
     D  @thisLastIndexOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLastIndexOf')
      *À
     D  @thisHashCode...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
      *À
     D  @thisIsEmpty...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisIsEmpty')
      *À
     D  @thisChgCapacity...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisChgCapacity')
      *À
     D  @thisChg...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisChg')
      *À
     D  @thisNewIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
      *À
     D  @thisNewListIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewListIterator')
      *À
     D  @thisRtv...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRtv')
      *À
     D  @thisRemove...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
      *À
     D  @thisRemoveAll...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemoveAll')
      *À
     D  @thisRemoveObject...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemoveObject')
      *À
     D  @thisRemoveRange...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemoveRange')
      *À
     D  @thisResize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisResize')
      *À
     D  @thisRetainAll...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRetainAll')
      *À
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
      *À
     D  @thisSort...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSort')
      *À
     D  @thisSubList...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSubList')
      *À
     D  @thisToArray...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToArray')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Extend class to create a new class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsArray...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @extendsThis)
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castArray...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfArray...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArray...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @newThis)
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New with Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArrayWithSize...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @newThisWithSize)
     D  Size                         10U 0 CONST
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayDlt...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisDlt)
     D  @Array                         *
      *À
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Add element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayAdd...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisAdd)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Add all
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayAddAll...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisAddAll)
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Change Element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayChg...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisChg)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Change Capacity
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayChgCapacity...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisChgCapacity)
     D  @Array                         *   CONST
     D  Capacity                     10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClear...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisClear)
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Clone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClone...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisClone)
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Contains
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayContains...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisContains)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Contains All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayContainsAll...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisContainsAll)
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsArray.
     D                                     @thisHashCode)
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Index Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIndexOf...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsArray.
     D                                     @thisIndexOf)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Test if empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisIsEmpty)
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Last Index Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayLastIndexOf...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsArray.
     D                                     @thisLastIndexOf)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New Iterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayNewIterator...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisNewIterator)
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New ListIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayNewListIterator...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisNewListIterator)
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Retrieve Element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRtv...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRtv)
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove Element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemove...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRemove)
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveAll...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRemoveAll)
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove Object
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveObject...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRemoveObject)
     D  @Array                         *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove Range
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveRange...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRemoveRange)
     D  @Array                         *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Resize
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayResize...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisResize)
     D  @Array                         *   CONST
     D  Size                         10U 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Retain All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRetainAll...
     D                 PR              N
     D                                     EXTPROC(@ClsArray.
     D                                     @thisRetainAll)
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySize...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsArray.
     D                                     @thisSize)
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Sort
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySort...
     D                 PR
     D                                     EXTPROC(@ClsArray.
     D                                     @thisSort)
     D  @Array                         *   CONST
     D  @Comparator                    *   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: SubList
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySubList...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisSubList)
     D  @Array                         *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Convert To Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayToArray...
     D                 PR              *
     D                                     EXTPROC(@ClsArray.
     D                                     @thisToArray)
     D  @Array                         *   CONST
      *À
