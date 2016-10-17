      *À
      *ÀCopyright (c) 2016 Ray Gillies-Jones. All rights reserved.
      *À
      *ÀCopyright details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPackage:
      *À - Iterate Class
      *À - Iterable Interface
      *À - Iterator Interface
      *À - Collection Interface
      *À - List Interface
      *À - ListIterator Interface
      *À - Comparator Interface
      *À - Set Interface
      *À - SortedSet Interface
      *À - Map Interface
      *À - MapEntry Interface
      *À - AbstractCollection Class
      *À - AbstractSet Class
      *À - AbstractMap Class
      *À - SimpleMapEntry Class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D @PkgCollections...
     D                 DS                  QUALIFIED
     D                               16A   INZ(PackageSignature)
     D                               10I 0 INZ(%Size(@PkgCollections))
     D                               12A
     D                                 *   INZ(%Addr(@ClsIterate))
     D                                 *   INZ(%Addr(@IfcIterable))
     D                                 *   INZ(%Addr(@IfcIterator))
     D                                 *   INZ(%Addr(@IfcCollection))
     D                                 *   INZ(%Addr(@IfcList))
     D                                 *   INZ(%Addr(@IfcListIterator))
     D                                 *   INZ(%Addr(@IfcComparator))
     D                                 *   INZ(%Addr(@IfcSet))
     D                                 *   INZ(%Addr(@IfcSortedSet))
     D                                 *   INZ(%Addr(@IfcMap))
     D                                 *   INZ(%Addr(@IfcMapEntry))
     D                                 *   INZ(%Addr(@ClsAbstractCollection))
     D                                 *   INZ(%Addr(@ClsAbstractSet))
     D                                 *   INZ(%Addr(@ClsAbstractMap))
     D                                 *   INZ(%Addr(@ClsSimpleMapEntry))
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Class Iterate
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @ClsIterate...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@ClsIterate))
     D                              126A   VARYING INZ(
     D                                     'Iterate')
     D                                7A
      *À
     D  @ComparatorBinarySearch...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ComparatorBinarySearch')
      *À
     D  @ComparatorBinarySearchInsert...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ComparatorBinarySearchInsert')
      *À
     D  @ComparatorSort...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ComparatorSort')
      *À
     D  @ForEach...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'ForEach')
      *À
     D  @newSimpleComparator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'newSimpleComparator')
      *À
     D  @Comparator_NATURAL_ORDER...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'Comparator_NATURAL_ORDER')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Binary Search on a Sorted Array using a Comparator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorBinarySearch...
     D                 PR              *
     D                                     EXTPROC(@ClsIterate.
     D                                     @ComparatorBinarySearch)
     D  @Comparator                    *   CONST
     D  @Search                        *   CONST
     D  @Data                          *   CONST
     D  ArraySize                    10U 0 CONST
     D  ElementSize                  10U 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Binary Search on a Sorted Array using a Comparator, with Insert information
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Sort
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorSort...
     D                 PR
     D                                     EXTPROC(@ClsIterate.
     D                                     @ComparatorSort)
     D  @Comparator                    *   CONST
     D  @Data                          *   CONST
     D  ArraySize                    10U 0 CONST
     D  ElementSize                  10U 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀForEach
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ForEach...
     D                 PR              N
     D                                     EXTPROC(@ClsIterate.
     D                                     @ForEach)
     D  @Iterator                      *
     D  @Element                       *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: new Simple Comparator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newSimpleComparator...
     D                 PR              *
     D                                     EXTPROC(@ClsIterate.
     D                                     @newSimpleComparator)
     D  @Compare                       *   PROCPTR CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Convieniance Method for Natural Order Comparator creation
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Comparator_NATURAL_ORDER...
     D                 PR              *
     D                                     EXTPROC(@ClsIterate.
     D                                     @Comparator_NATURAL_ORDER)
      *À
      *À
      *À============================================================================================
      *À============================================================================================
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface Iterable
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcIterable...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcIterable))
     D                              126A   VARYING INZ(
     D                                     'Iterable')
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
     D  @thisNewIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterable: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsIterable...
     D                 PR
     D                                     EXTPROC(@IfcIterable.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterable: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castIterable...
     D                 PR
     D                                     EXTPROC(@IfcIterable.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterable: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfIterable...
     D                 PR              N
     D                                     EXTPROC(@IfcIterable.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterable: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsIterable...
     D                 PR
     D                                     EXTPROC(@IfcIterable.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterable: New Iterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IterableNewIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcIterable.
     D                                     @thisNewIterator)
     D  @Object                        *   CONST
      *À
      *À
      *À============================================================================================
      *À============================================================================================
      *À
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface Iterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcIterator...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcIterator))
     D                              126A   VARYING INZ(
     D                                     'Iterator')
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
     D  @thisHasNext...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHasNext')
      *À
     D  @thisNext...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNext')
      *À
     D  @thisRemove...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterator: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsIterator...
     D                 PR
     D                                     EXTPROC(@IfcIterator.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterator: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castIterator...
     D                 PR
     D                                     EXTPROC(@IfcIterator.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterator: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfIterator...
     D                 PR              N
     D                                     EXTPROC(@IfcIterator.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterator: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsIterator...
     D                 PR
     D                                     EXTPROC(@IfcIterator.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterator: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IteratorDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcIterator.
     D                                     @thisDlt)
     D  @Object                        *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterator: HasNext
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IteratorHasNext...
     D                 PR              N
     D                                     EXTPROC(@IfcIterator.
     D                                     @thisHasNext)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterator: Next
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IteratorNext...
     D                 PR              *
     D                                     EXTPROC(@IfcIterator.
     D                                     @thisNext)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀIterator: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D IteratorRemove...
     D                 PR
     D                                     EXTPROC(@IfcIterator.
     D                                     @thisRemove)
     D  @Object                        *   CONST
      *À
      *À
      *À
      *À============================================================================================
      *À============================================================================================
      *À
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface Collection
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcCollection...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcCollection))
     D                              126A   VARYING INZ(
     D                                     'Collection')
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
     D  @thisNewIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
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
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
      *À
     D  @thisToArray...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToArray')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsCollection...
     D                 PR
     D                                     EXTPROC(@IfcCollection.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castCollection...
     D                 PR
     D                                     EXTPROC(@IfcCollection.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfCollection...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsCollection...
     D                 PR
     D                                     EXTPROC(@IfcCollection.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisDlt)
     D  @this                          *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionAdd...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisAdd)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Add All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionAddAll...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisAddAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionClear...
     D                 PR
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisClear)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Contains
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionContains...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisContains)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Contains All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionContainsAll...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisContainsAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Retrieve HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisHashCode)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Is Empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisIsEmpty)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: New Iterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionNewIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisNewIterator)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionRemove...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisRemove)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Remove All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionRemoveAll...
     D                 PR              N
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisRemoveAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionSize...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisSize)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀCollection: Convert To Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D CollectionToArray...
     D                 PR              *
     D                                     EXTPROC(@IfcCollection.
     D                                     @thisToArray)
     D  @this                          *   CONST
      *À
      *À
      *À============================================================================================
      *À============================================================================================
      *À
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface List
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcList...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcList))
     D                              126A   VARYING INZ(
     D                                     'List')
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
     D  @thisHashCode...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
      *À
     D  @thisIndexOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisIndexOf')
      *À
     D  @thisIsEmpty...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisIsEmpty')
      *À
     D  @thisLastIndexOf...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLastIndexOf')
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
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
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
      *ÀList: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsList...
     D                 PR
     D                                     EXTPROC(@IfcList.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castList...
     D                 PR
     D                                     EXTPROC(@IfcList.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfList...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsList...
     D                 PR
     D                                     EXTPROC(@IfcList.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisDlt)
     D  @this                          *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListAdd...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisAdd)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Add All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListAddAll...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisAddAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListClear...
     D                 PR
     D                                     EXTPROC(@IfcList.
     D                                     @thisClear)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Contains
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListContains...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisContains)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Contains All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListContainsAll...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisContainsAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Retrieve HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcList.
     D                                     @thisHashCode)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Index Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIndexOf...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcList.
     D                                     @thisIndexOf)
     D  @this                          *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Is Empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisIsEmpty)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Last Index Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListLastIndexOf...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcList.
     D                                     @thisLastIndexOf)
     D  @this                          *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: New Iterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListNewIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisNewIterator)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: New ListIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListNewListIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisNewListIterator)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListRemove...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisRemove)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Remove All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListRemoveAll...
     D                 PR              N
     D                                     EXTPROC(@IfcList.
     D                                     @thisRemoveAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListSize...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcList.
     D                                     @thisSize)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: SubList
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListSubList...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisSubList)
     D  @this                          *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀList: Convert To Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListToArray...
     D                 PR              *
     D                                     EXTPROC(@IfcList.
     D                                     @thisToArray)
     D  @this                          *   CONST
      *À
      *À
      *À============================================================================================
      *À============================================================================================
      *À
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface ListIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcListIterator...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcListIterator))
     D                              126A   VARYING INZ(
     D                                     'ListIterator')
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
     D  @thisAdd...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisAdd')
      *À
     D  @thisChg...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisChg')
      *À
     D  @thisHasNext...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHasNext')
      *À
     D  @thisHasPrevious...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHasPrevious')
      *À
     D  @thisNext...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNext')
      *À
     D  @thisNextIndex...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNextIndex')
      *À
     D  @thisPrevious...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisPrevious')
      *À
     D  @thisPreviousIndex...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisPreviousIndex')
      *À
     D  @thisRemove...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsListIterator...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castListIterator...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @castThis)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfListIterator...
     D                 PR              N
     D                                     EXTPROC(@IfcListIterator.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsListIterator...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @implementsThis)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisDlt)
     D  @this                          *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorAdd...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisAdd)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Change
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorChg...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisChg)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: HasNext
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorHasNext...
     D                 PR              N
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisHasNext)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: HasPrevious
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorHasPrevious...
     D                 PR              N
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisHasPrevious)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Next
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorNext...
     D                 PR              *
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisNext)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: NextIndex
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorNextIndex...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisNextIndex)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Previous
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorPrevious...
     D                 PR              *
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisPrevious)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: PreviousIndex
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorPreviousIndex...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisPreviousIndex)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀListIterator: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ListIteratorRemove...
     D                 PR
     D                                     EXTPROC(@IfcListIterator.
     D                                     @thisRemove)
     D  @this                          *   CONST
      *À
      *À
      *À============================================================================================
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface Comparator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcComparator...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcComparator))
     D                              126A   VARYING INZ(
     D                                     'Comparator')
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
     D  @thisCompare...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisCompare')
      *À
     D  @thisEquals...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsComparator...
     D                 PR
     D                                     EXTPROC(@IfcComparator.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castComparator...
     D                 PR
     D                                     EXTPROC(@IfcComparator.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfComparator...
     D                 PR              N
     D                                     EXTPROC(@IfcComparator.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsComparator...
     D                 PR
     D                                     EXTPROC(@IfcComparator.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcComparator.
     D                                     @thisDlt)
     D  @this                          *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Compare
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorCompare...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcComparator.
     D                                     @thisCompare)
     D  @Comparator                    *   CONST
     D  @ObjectA                       *   CONST
     D  @ObjectB                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀComparator: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ComparatorEquals...
     D                 PR              N
     D                                     EXTPROC(@IfcComparator.
     D                                     @thisEquals)
     D  @ObjectA                       *   CONST
     D  @ObjectB                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface Set
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcSet...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcSet))
     D                              126A   VARYING INZ(
     D                                     'Set')
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
     D  @thisNewIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
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
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
      *À
     D  @thisToArray...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToArray')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsSet...
     D                 PR
     D                                     EXTPROC(@IfcSet.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castSet...
     D                 PR
     D                                     EXTPROC(@IfcSet.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfSet...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsSet...
     D                 PR
     D                                     EXTPROC(@IfcSet.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcSet.
     D                                     @thisDlt)
     D  @this                          *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetAdd...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisAdd)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Add All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetAddAll...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisAddAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetClear...
     D                 PR
     D                                     EXTPROC(@IfcSet.
     D                                     @thisClear)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Contains
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetContains...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisContains)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Contains All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetContainsAll...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisContainsAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Retrieve HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcSet.
     D                                     @thisHashCode)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Is Empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisIsEmpty)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: New Iterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetNewIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcSet.
     D                                     @thisNewIterator)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetRemove...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisRemove)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Remove All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetRemoveAll...
     D                 PR              N
     D                                     EXTPROC(@IfcSet.
     D                                     @thisRemoveAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetSize...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcSet.
     D                                     @thisSize)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSet: Convert To Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SetToArray...
     D                 PR              *
     D                                     EXTPROC(@IfcSet.
     D                                     @thisToArray)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface Set
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcSortedSet...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcSortedSet))
     D                              126A   VARYING INZ(
     D                                     'SortedSet')
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
     D  @thisComparator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisComparator')
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
     D  @thisFirst...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisFirst')
      *À
     D  @thisHashCode...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
      *À
     D  @thisHeadSet...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHeadSet')
      *À
     D  @thisIsEmpty...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisIsEmpty')
      *À
     D  @thisLast...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisLast')
      *À
     D  @thisNewIterator...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
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
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
      *À
     D  @thisSubSet...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSubSet')
      *À
     D  @thisTailSet...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisTailSet')
      *À
     D  @thisToArray...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisToArray')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsSortedSet...
     D                 PR
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castSortedSet...
     D                 PR
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfSortedSet...
     D                 PR              N
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsSortedSet...
     D                 PR
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisDlt)
     D  @this                          *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetAdd...
     D                 PR              N
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisAdd)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Add All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetAddAll...
     D                 PR              N
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisAddAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetClear...
     D                 PR
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisClear)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Comparator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetComparator...
     D                 PR              *
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisComparator)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Contains
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetContains...
     D                 PR              N
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisContains)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Contains All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetContainsAll...
     D                 PR              N
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisContainsAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: First
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetFirst...
     D                 PR              *
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisFirst)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Retrieve HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisHashCode)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: HeadSet
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetHeadSet...
     D                 PR              *
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisHeadSet)
     D  @this                          *   CONST
     D  @ElementTo                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Is Empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisIsEmpty)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Last
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetLast...
     D                 PR              *
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisLast)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: New Iterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetNewIterator...
     D                 PR              *
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisNewIterator)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetRemove...
     D                 PR              N
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisRemove)
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Remove All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetRemoveAll...
     D                 PR              N
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisRemoveAll)
     D  @this                          *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetSize...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisSize)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: SubSet
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetSubSet...
     D                 PR              *
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisSubSet)
     D  @this                          *   CONST
     D  @ElementFrom                   *   CONST
     D  @ElementTo                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: TailSet
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetTailSet...
     D                 PR              *
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisHeadSet)
     D  @this                          *   CONST
     D  @ElementFrom                   *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSortedSet: Convert To Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SortedSetToArray...
     D                 PR              *
     D                                     EXTPROC(@IfcSortedSet.
     D                                     @thisToArray)
     D  @this                          *   CONST
      *À
      *À============================================================================================
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface Map
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcMap...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcMap))
     D                              126A   VARYING INZ(
     D                                     'Map')
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
     D  @thisClear...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisClear')
      *À
     D  @thisContainsKey...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisContainsKey')
      *À
     D  @thisContainsValue...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisContainsValue')
      *À
     D  @thisEntrySet...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisEntrySet')
      *À
     D  @thisEquals...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
      *À
     D  @thisGet...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisGet')
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
     D  @thisKeySet...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisKeySet')
      *À
     D  @thisPut...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisPut')
      *À
     D  @thisPutAll...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisPutAll')
      *À
     D  @thisRemove...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
      *À
     D  @thisSize...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSize')
      *À
     D  @thisValues...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisValues')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsMap...
     D                 PR
     D                                     EXTPROC(@IfcMap.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castMap...
     D                 PR
     D                                     EXTPROC(@IfcMap.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfMap...
     D                 PR              N
     D                                     EXTPROC(@IfcMap.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsMap...
     D                 PR
     D                                     EXTPROC(@IfcMap.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcMap.
     D                                     @thisDlt)
     D  @this                          *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapClear...
     D                 PR
     D                                     EXTPROC(@IfcMap.
     D                                     @thisClear)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Contains Key
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapContainsKey...
     D                 PR              N
     D                                     EXTPROC(@IfcMap.
     D                                     @thisContainsKey)
     D  @this                          *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Contains Value
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapContainsValue...
     D                 PR              N
     D                                     EXTPROC(@IfcMap.
     D                                     @thisContainsValue)
     D  @this                          *   CONST
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Entry Set
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapEntrySet...
     D                 PR              *
     D                                     EXTPROC(@IfcMap.
     D                                     @thisEntrySet)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapEquals...
     D                 PR              N
     D                                     EXTPROC(@IfcMap.
     D                                     @thisEquals)
     D  @this                          *   CONST
     D  @that                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Get
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapGet...
     D                 PR              *
     D                                     EXTPROC(@IfcMap.
     D                                     @thisGet)
     D  @this                          *   CONST
     D  @Key                           *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Retrieve HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcMap.
     D                                     @thisHashCode)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Is Empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapIsEmpty...
     D                 PR              N
     D                                     EXTPROC(@IfcMap.
     D                                     @thisIsEmpty)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Key Set
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapKeySet...
     D                 PR              *
     D                                     EXTPROC(@IfcMap.
     D                                     @thisKeySet)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Put
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapPut...
     D                 PR              *
     D                                     EXTPROC(@IfcMap.
     D                                     @thisPut)
     D  @this                          *   CONST
     D  @Key                           *   CONST
     D  @Value                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Put All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapPutAll...
     D                 PR
     D                                     EXTPROC(@IfcMap.
     D                                     @thisPutAll)
     D  @this                          *   CONST
     D  @Map                           *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapRemove...
     D                 PR              *
     D                                     EXTPROC(@IfcMap.
     D                                     @thisRemove)
     D  @this                          *   CONST
     D  @Key                           *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMap: Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapSize...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcMap.
     D                                     @thisSize)
     D  @this                          *   CONST
      *À
      *À============================================================================================
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes for Interface Map
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @IfcMapEntry...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(@IfcMapEntry))
     D                              126A   VARYING INZ(
     D                                     'MapEntry')
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
     D  @thisEquals...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
      *À
     D  @thisGetKey...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisGetKey')
      *À
     D  @thisGetValue...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisGetValue')
      *À
     D  @thisHashCode...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
      *À
     D  @thisSetValue...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSetValue')
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: Extends
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsMapEntry...
     D                 PR
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @extendsThis)
     D  @Interface                     *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: Implements
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D implementsMapEntry...
     D                 PR
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @implementsThis)
     D  @Class                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castMapEntry...
     D                 PR
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @castThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfMapEntry...
     D                 PR              N
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapEntryDlt...
     D                 PR              *
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @thisDlt)
     D  @MapEntry                      *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapEntryEquals...
     D                 PR              N
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @thisEquals)
     D  @MapEntry                      *   CONST
     D  @that                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: Get Key
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapEntryGetKey...
     D                 PR              *
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @thisGetKey)
     D  @MapEntry                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: Get Value
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapEntryGetValue...
     D                 PR              *
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @thisGetValue)
     D  @MapEntry                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapEntryHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @thisHashCode)
     D  @MapEntry                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀMapEntry: Set Value
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D MapEntrySetValue...
     D                 PR              *
     D                                     EXTPROC(@IfcMapEntry.
     D                                     @thisSetValue)
     D  @MapEntry                      *   CONST
     D  @Value                         *   CONST
      *À
      *À============================================================================================
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: AbstractCollection
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @ClsAbstractCollection...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(
     D                                     @ClsAbstractCollection))
     D                              126A   VARYING INZ(
     D                                     'AbstractCollection')
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
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractCollection: Extend class to create a new class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsAbstractCollection...
     D                 PR              *
     D                                     EXTPROC(
     D                                     @ClsAbstractCollection.
     D                                     @extendsThis)
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractCollection: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castAbstractCollection...
     D                 PR              *
     D                                     EXTPROC(
     D                                     @ClsAbstractCollection.
     D                                     @castThis)
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractCollection: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfAbstractCollection...
     D                 PR              N
     D                                     EXTPROC(@ClsAbstractCollection.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À============================================================================================
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: AbstractSet
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @ClsAbstractSet...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(
     D                                     @ClsAbstractSet))
     D                              126A   VARYING INZ(
     D                                     'AbstractSet')
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
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractSet: Extend class to create a new class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsAbstractSet...
     D                 PR              *
     D                                     EXTPROC(
     D                                     @ClsAbstractSet.
     D                                     @extendsThis)
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractSet: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castAbstractSet...
     D                 PR              *
     D                                     EXTPROC(
     D                                     @ClsAbstractSet.
     D                                     @castThis)
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractSet: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfAbstractSet...
     D                 PR              N
     D                                     EXTPROC(@ClsAbstractSet.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À============================================================================================
      *À============================================================================================
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: AbstractMap
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @ClsAbstractMap...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(
     D                                     @ClsAbstractMap))
     D                              126A   VARYING INZ(
     D                                     'AbstractMap')
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
     D  @GetFld@KeySet...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'AbstractMapGetFld@KeySet')
      *
     D  @SetFld@KeySet...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'AbstractMapSetFld@KeySet')
      *
     D  @GetFld@Values...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'AbstractMapGetFld@Values')
      *
     D  @SetFld@Values...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'AbstractMapSetFld@Values')
      *
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractMap: Extend class to create a new class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsAbstractMap...
     D                 PR              *
     D                                     EXTPROC(
     D                                     @ClsAbstractMap.
     D                                     @extendsThis)
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractMap: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castAbstractMap...
     D                 PR              *
     D                                     EXTPROC(
     D                                     @ClsAbstractMap.
     D                                     @castThis)
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractMap: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfAbstractMap...
     D                 PR              N
     D                                     EXTPROC(@ClsAbstractMap.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractMap: Get Public Field @KeySet
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D AbstractMapGetFld@KeySet...
     D                 PR              *
     D                                     EXTPROC(@ClsAbstractMap.
     D                                     @GetFld@KeySet)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractMap: Set Public Field @KeySet
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D AbstractMapSetFld@KeySet...
     D                 PR              *
     D                                     EXTPROC(@ClsAbstractMap.
     D                                     @SetFld@KeySet)
     D  @this                          *   CONST
     D  @NewValue                      *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractMap: Get Public Field @Values
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D AbstractMapGetFld@Values...
     D                 PR              *
     D                                     EXTPROC(@ClsAbstractMap.
     D                                     @GetFld@Values)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAbstractMap: Set Public Field @Values
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D AbstractMapSetFld@Values...
     D                 PR              *
     D                                     EXTPROC(@ClsAbstractMap.
     D                                     @SetFld@Values)
     D  @this                          *   CONST
     D  @NewValue                      *   CONST
      *À
      *À
      *À============================================================================================
      *À============================================================================================
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀClass: SimpleMapEntry
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
     D @ClsSimpleMapEntry...
     D                 DS                  QUALIFIED
     D                               16A   INZ(TemplateSignature)
     D                               21A   INZ('CLSCOLLECT')
     D                               10I 0 INZ(%Size(
     D                                     @ClsSimpleMapEntry))
     D                              126A   VARYING INZ(
     D                                     'SimpleMapEntry')
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
     D  @newThis...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'newThis')
      *À
     D  @thisDlt...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
      *À
     D  @thisEquals...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
      *À
     D  @thisGetKey...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisGetKey')
      *À
     D  @thisGetValue...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisGetValue')
      *À
     D  @thisHashCode...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
      *À
     D  @thisSetValue...
     D                                 *   PROCPTR
     D                              126A   VARYING INZ(
     D                                     'thisSetValue')
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
      *
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: Extend class to create a new class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsSimpleMapEntry...
     D                 PR              *
     D                                     EXTPROC(
     D                                     @ClsSimpleMapEntry.
     D                                     @extendsThis)
     D  Template                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castSimpleMapEntry...
     D                 PR              *
     D                                     EXTPROC(
     D                                     @ClsSimpleMapEntry.
     D                                     @castThis)
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfSimpleMapEntry...
     D                 PR              N
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @instanceOfThis)
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: newSimpleMapEntry(MapEntry) or newSimpleMapEntry(Key:Value)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newSimpleMapEntry...
     D                 PR              *
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @newThis)
     D  o@Parm1                        *   CONST OPTIONS(*NOPASS)
     D  o@Parm2                        *   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SimpleMapEntryDlt...
     D                 PR              *
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @thisDlt)
     D  @SmpMapEnt                     *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SimpleMapEntryEquals...
     D                 PR              N
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @thisEquals)
     D  @this                          *   CONST
     D  @that                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: Get Key
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SimpleMapEntryGetKey...
     D                 PR              *
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @thisGetKey)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: Get Value
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SimpleMapEntryGetValue...
     D                 PR              *
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @thisGetValue)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SimpleMapEntryHashCode...
     D                 PR            10I 0
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @thisHashCode)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: Set Value
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SimpleMapEntrySetValue...
     D                 PR              *
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @thisSetValue)
     D  @this                          *   CONST
     D  @Value                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: To String
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SimpleMapEntryToString...
     D                 PR              *
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @thisToString)
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSimpleMapEntry: To Varying
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D SimpleMapEntryToVarying...
     D                 PR           510A   VARYING
     D                                     EXTPROC(@ClsSimpleMapEntry.
     D                                     @thisToVarying)
     D  @this                          *   CONST
      *À
