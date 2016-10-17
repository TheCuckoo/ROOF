      *�
     D @ClsIterate...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@ClsIterate))
     D                              126A   VARYING INZ(
     D                                     'Iterate')
     D                                7A
      *�
     D  @ComparatorBinarySearch...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ComparatorBinarySearch')
      *�
     D  @ComparatorBinarySearchInsert...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ComparatorBinarySearchInsert')
      *�
     D  @ComparatorSort...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ComparatorSort')
      *�
     D  @ForEach...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ForEach')
      *�
     D  @newSimpleComparator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'newSimpleComparator')
      *�
     D  @Comparator_NATURAL_ORDER...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'Comparator_NATURAL_ORDER')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Binary Search on a Sorted Array using a Comparator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorBinarySearch...
     D                 PR              *
     D                                     EXTPROC(@ClsIterate.
     D                                     @ComparatorBinarySearch)
     D  @Comparator                    *   CONST
     D  @Search                        *   CONST
     D  @Data                          *   CONST
     D  ArraySize                    10U 0 CONST
     D  ElementSize                  10U 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Binary Search on a Sorted Array using a Comparator, with Insert information
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorBinarySearchInsert...
     D                 PR              N
     D                                     EXTPROC(@ClsIterate.
     D                                     @ComparatorBinarySearchInsert)
     D  @Comparator                    *   CONST
     D  @Search                        *   CONST
     D  @Data                          *   CONST
     D  ArraySize                    10U 0 CONST
     D  ElementSize                  10U 0 CONST
     D  @Element                       *
     D  FoundIndex                   10I 0
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Sort
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorSort...
     D                 PR
     D                                     EXTPROC(@ClsIterate.
     D                                     @ComparatorSort)
     D  @Comparator                    *   CONST
     D  @Data                          *   CONST
     D  ArraySize                    10U 0 CONST
     D  ElementSize                  10U 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ForEach
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ForEach...
     D                 PR              N
     D                                     EXTPROC(@ClsIterate.
     D                                     @ForEach)
     D  @Iterator                      *
     D  @Element                       *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: new Simple Comparator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newSimpleComparator...
     D                 PR              *
     D                                     EXTPROC(@ClsIterate.
     D                                     @newSimpleComparator)
     D  @Compare                       *   PROCPTR CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Convieniance Method for Natural Order Comparator creation
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Comparator_NATURAL_ORDER...
     D                 PR              *
     D                                     EXTPROC(@ClsIterate.
     D                                     @Comparator_NATURAL_ORDER)
      *�
      *�
      *�============================================================================================
      *�============================================================================================
      *�
      *�--------------------------------------------------------------------------------------------
      *�Prototypes for Interface Iterable
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @IfcIterable...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcIterable))
     D                              126A   VARYING INZ(
     D                                     'Iterable')
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
     D  @thisNewIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterable: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsIterable...
     D                 PR
     D                                     EXTPROC(@IfcIterable.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterable: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castIterable...
     D                 PR
     D                                     EXTPROC(@IfcIterable.
     D                                     @castThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterable: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfIterable...
     D                 PR              N
     D                                     EXTPROC(@IfcIterable.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterable: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsIterable...
     D                 PR
     D                                     EXTPROC(@IfcIterable.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterable: New Iterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IterableNewIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcIterable.
     D                                     @thisNewIterator)
     D  @Object                        *   CONST
      *�
      *�
      *�============================================================================================
      *�============================================================================================
      *�
      *�
      *�--------------------------------------------------------------------------------------------
      *�Prototypes for Interface Iterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @IfcIterator...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcIterator))
     D                              126A   VARYING INZ(
     D                                     'Iterator')
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
     D  @thisHasNext...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHasNext')
      *�
     D  @thisNext...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNext')
      *�
     D  @thisRemove...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterator: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsIterator...
     D                 PR
     D                                     EXTPROC(@IfcIterator.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterator: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castIterator...
     D                 PR
     D                                     EXTPROC(@IfcIterator.
     D                                     @castThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterator: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfIterator...
     D                 PR              N
     D                                     EXTPROC(@IfcIterator.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterator: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsIterator...
     D                 PR
     D                                     EXTPROC(@IfcIterator.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterator: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IteratorDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcIterator.
     D                                     @thisDlt)
     D  @Object                        *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterator: HasNext
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IteratorHasNext...
     D                 PR              N
     D                                     EXTPROC(@IfcIterator.
     D                                     @thisHasNext)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterator: Next
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IteratorNext...
     D                 PR              *
     D                                     EXTPROC(@IfcIterator.
     D                                     @thisNext)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Iterator: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IteratorRemove...
     D                 PR
     D                                     EXTPROC(@IfcIterator.
     D                                     @thisRemove)
     D  @Object                        *   CONST
      *�
      *�
      *�
      *�============================================================================================
      *�============================================================================================
      *�
      *�
      *�--------------------------------------------------------------------------------------------
      *�Prototypes for Interface Collection
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @IfcCollection...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcCollection))
     D                              126A   VARYING INZ(
     D                                     'Collection')
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
     D  @thisNewIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
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
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
      *�
     D  @thisToArray...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToArray')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsCollection...
     D                 PR
     D                                     EXTPROC(@IfcCollection.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castCollection...
     D                 PR
     D                                     EXTPROC(@IfcCollection.
     D                                     @castThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfCollection...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsCollection...
     D                 PR
     D                                     EXTPROC(@IfcCollection.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisDlt)
     D  @this                          *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Add
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionAdd...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisAdd)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Add All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionAddAll...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisAddAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Clear
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionClear...
     D                 PR
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisClear)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Contains
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionContains...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisContains)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Contains All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionContainsAll...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisContainsAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Retrieve HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisHashCode)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Is Empty
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisIsEmpty)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: New Iterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionNewIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisNewIterator)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionRemove...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisRemove)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Remove All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionRemoveAll...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisRemoveAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionSize...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisSize)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Collection: Convert To Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionToArray...
     D                 PR              *
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisToArray)
     D  @this                          *   CONST
      *�
      *�
      *�============================================================================================
      *�============================================================================================
      *�
      *�
      *�--------------------------------------------------------------------------------------------
      *�Prototypes for Interface List
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @IfcList...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcList))
     D                              126A   VARYING INZ(
     D                                     'List')
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
     D  @thisHashCode...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
      *�
     D  @thisIndexOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisIndexOf')
      *�
     D  @thisIsEmpty...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisIsEmpty')
      *�
     D  @thisLastIndexOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLastIndexOf')
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
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
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
      *�List: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsList...
     D                 PR
     D                                     EXTPROC(@IfcList.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castList...
     D                 PR
     D                                     EXTPROC(@IfcList.
     D                                     @castThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfList...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsList...
     D                 PR
     D                                     EXTPROC(@IfcList.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisDlt)
     D  @this                          *
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Add
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListAdd...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisAdd)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Add All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListAddAll...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisAddAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Clear
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListClear...
     D                 PR
     D                                     EXTPROC(@IfcList.
     D                                     @thisClear)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Contains
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListContains...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisContains)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Contains All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListContainsAll...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisContainsAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Retrieve HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcList.
     D                                     @thisHashCode)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Index Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIndexOf...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcList.
     D                                     @thisIndexOf)
     D  @this                          *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Is Empty
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisIsEmpty)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Last Index Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListLastIndexOf...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcList.
     D                                     @thisLastIndexOf)
     D  @this                          *   CONST
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: New Iterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListNewIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisNewIterator)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: New ListIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListNewListIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisNewListIterator)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListRemove...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisRemove)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Remove All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListRemoveAll...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisRemoveAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListSize...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcList.
     D                                     @thisSize)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: SubList
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListSubList...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisSubList)
     D  @this                          *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�List: Convert To Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListToArray...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisToArray)
     D  @this                          *   CONST
      *�
      *�
      *�============================================================================================
      *�============================================================================================
      *�
      *�
      *�--------------------------------------------------------------------------------------------
      *�Prototypes for Interface ListIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @IfcListIterator...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcListIterator))
     D                              126A   VARYING INZ(
     D                                     'ListIterator')
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
     D  @thisAdd...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisAdd')
      *�
     D  @thisChg...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisChg')
      *�
     D  @thisHasNext...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHasNext')
      *�
     D  @thisHasPrevious...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHasPrevious')
      *�
     D  @thisNext...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNext')
      *�
     D  @thisNextIndex...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNextIndex')
      *�
     D  @thisPrevious...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisPrevious')
      *�
     D  @thisPreviousIndex...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisPreviousIndex')
      *�
     D  @thisRemove...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsListIterator...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castListIterator...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @castThis)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfListIterator...
     D                 PR              N
     D                                     EXTPROC(@IfcListIterator.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsListIterator...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @implementsThis)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisDlt)
     D  @this                          *
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Add
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorAdd...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisAdd)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Change
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorChg...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisChg)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: HasNext
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorHasNext...
     D                 PR              N
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisHasNext)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: HasPrevious
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorHasPrevious...
     D                 PR              N
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisHasPrevious)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Next
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorNext...
     D                 PR              *
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisNext)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: NextIndex
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorNextIndex...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisNextIndex)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Previous
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorPrevious...
     D                 PR              *
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisPrevious)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: PreviousIndex
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorPreviousIndex...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisPreviousIndex)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ListIterator: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorRemove...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisRemove)
     D  @this                          *   CONST
      *�
      *�
      *�============================================================================================
      *�
      *�--------------------------------------------------------------------------------------------
      *�Prototypes for Interface Comparator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @IfcComparator...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcComparator))
     D                              126A   VARYING INZ(
     D                                     'Comparator')
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
     D  @thisCompare...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisCompare')
      *�
     D  @thisEquals...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsComparator...
     D                 PR
     D                                     EXTPROC(@IfcComparator.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castComparator...
     D                 PR
     D                                     EXTPROC(@IfcComparator.
     D                                     @castThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfComparator...
     D                 PR              N
     D                                     EXTPROC(@IfcComparator.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsComparator...
     D                 PR
     D                                     EXTPROC(@IfcComparator.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcComparator.
     D                                     @thisDlt)
     D  @this                          *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Compare
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorCompare...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcComparator.
     D                                     @thisCompare)
     D  @Comparator                    *   CONST
     D  @ObjectA                       *   CONST
     D  @ObjectB                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Comparator: Equals
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorEquals...
     D                 PR              N
     D                                     EXTPROC(@IfcComparator.
     D                                     @thisEquals)
     D  @ObjectA                       *   CONST
     D  @ObjectB                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Prototypes for Interface Set
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
     D @IfcSet...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcSet))
     D                              126A   VARYING INZ(
     D                                     'Set')
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
     D  @thisNewIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
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
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
      *�
     D  @thisToArray...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToArray')
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Extends
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsSet...
     D                 PR
     D                                     EXTPROC(@IfcSet.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castSet...
     D                 PR
     D                                     EXTPROC(@IfcSet.
     D                                     @castThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfSet...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Implements
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsSet...
     D                 PR
     D                                     EXTPROC(@IfcSet.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcSet.
     D                                     @thisDlt)
     D  @this                          *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Add
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetAdd...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisAdd)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Add All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetAddAll...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisAddAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Clear
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetClear...
     D                 PR
     D                                     EXTPROC(@IfcSet.
     D                                     @thisClear)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Contains
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetContains...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisContains)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Contains All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetContainsAll...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisContainsAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Retrieve HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcSet.
     D                                     @thisHashCode)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Is Empty
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisIsEmpty)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: New Iterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetNewIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcSet.
     D                                     @thisNewIterator)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetRemove...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisRemove)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Remove All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetRemoveAll...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisRemoveAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetSize...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcSet.
     D                                     @thisSize)
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Set: Convert To Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetToArray...
     D                 PR              *
     D                                     EXTPROC(@IfcSet.
     D                                     @thisToArray)
     D  @this                          *   CONST
