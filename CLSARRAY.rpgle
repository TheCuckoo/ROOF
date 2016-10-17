     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO)
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
     D/COPY RAYLIB/QDLLSRCV20,CPYOBJECT
     D/COPY RAYLIB/QDLLSRCV20,PKGCOLLECT
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀDefinitions
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *ÀArray Structure
     D Array_          DS                  QUALIFIED BASED(@NULL) ALIGN
     D   #Object                           LIKE(Object_)
     D  @Data                          *
     D  Size                         10I 0
     D  Capacity                     10I 0
     D  MinCapacity                  10I 0
     D  ElementSize                  10I 0
     D  ModCount                     20U 0
      *
      *ÀArray Iterator Structure
     D ArrayIterator_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  #Object                            LIKE(Object_)
     D  @Subject                       *
     D  Index                        10I 0
     D  ModCount                     20U 0
     D  CalledNext                     N
      *
      *ÀArray ListIterator Structure
     D ArrayListIterator_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  #Object                            LIKE(Object_)
     D  @Subject                       *
     D  Cursor                       10I 0
     D  Size                         10I 0
     D  Last                         10I 0
     D  ModCount                     20U 0
      *
      *À--------------------------------------------------------------------------------------------
      *ÀPrototypes
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Class Definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorClass...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: extend class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsArrayIterator...
     D                 PR              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castArrayIterator...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfArrayIterator...
     D                 PR              N
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArrayIterator...
     D                 PR              *
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorDlt...
     D                 PR              *
     D  @Array                         *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: HasNext
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorHasNext...
     D                 PR              N
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Next
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorNext...
     D                 PR              *
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorRemove...
     D                 PR
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Class Definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorClass...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: extend class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsArrayListIterator...
     D                 PR              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castArrayListIterator...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfArrayListIterator...
     D                 PR              N
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArrayListIterator...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorDlt...
     D                 PR              *
     D  @this                          *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorAdd...
     D                 PR
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Change
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorChg...
     D                 PR
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: HasNext
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorHasNext...
     D                 PR              N
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: HasPrevious
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorHasPrevious...
     D                 PR              N
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Next
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorNext...
     D                 PR              *
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Next Index
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorNextIndex...
     D                 PR            10I 0
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Previous
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorPrevious...
     D                 PR              *
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Previous Index
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorPreviousIndex...
     D                 PR            10I 0
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorRemove...
     D                 PR
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New ListIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayNewListIterator...
     D                 PR              *
     D  @this                          *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray Class Definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClass...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: extend class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsArray...
     D                 PR              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castArray...
     D                 PR              *
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfArray...
     D                 PR              N
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArray...
     D                 PR              *
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New with Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArrayWithSize...
     D                 PR              *
     D  Size                         10U 0 CONST
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayDlt...
     D                 PR              *
     D  @Array                         *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Finalise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayFinalise...
     D                 PR
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Initialise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayInitialise...
     D                 PR
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *À#Array: Retrieve Modification Count
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D #ArrayRtvModCount...
     D                 PR            20U 0
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Add element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayAdd...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Add All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayAddAll...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Change element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayChg...
     D                 PR              *
     D  @Array                         *   CONST
     D  @Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Change Capacity
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayChgCapacity...
     D                 PR
     D  @Array                         *   CONST
     D  Capacity                     10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClear...
     D                 PR
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Clone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClone...
     D                 PR              *
     D  @Array                         *   CONST
      *À
     D #ArrayClone...
     D                 PR              *
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Contains
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayContains...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Contains All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayContainsAll...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayEquals...
     D                 PR              N
     D  @Array                         *   CONST
     D  @that                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayHashCode...
     D                 PR            10I 0
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Index Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIndexOf...
     D                 PR            10I 0
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *À
      *Àshared implementation
     D #ArrayIndexOf...
     D                 PR            10I 0
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Test if empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIsEmpty...
     D                 PR              N
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Last Index Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayLastIndexOf...
     D                 PR            10I 0
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New Iterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayNewIterator...
     D                 PR              *
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Retrieve element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRtv...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D #ArrayRtv...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemove...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D #ArrayRemove...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveAll...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove Object
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveObject...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *À
     D #ArrayRemoveObject...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove Range
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveRange...
     D                 PR
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
     D #ArrayRemoveRange...
     D                 PR
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Resize
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayResize...
     D                 PR
     D  @                              *   CONST
     D  Size                         10U 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Retain All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRetainAll...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Number of elements (cardinality)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySize...
     D                 PR            10I 0
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Sort
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySort...
     D                 PR
     D  @Array                         *   CONST
     D  @Comparator                    *   CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: SubList
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySubList...
     D                 PR              *
     D  @Array                         *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Convert To Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayToArray...
     D                 PR              *
     D  @Array                         *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConstants and Work Fields
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *À--------------------------------------------------------------------------------------------
      *À*ENTRY PLIST Parameters
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('CLSARRAY')
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

         //ÀClass: Array
            WHEN (ClassLinkName(@Template) = 'Array') ;
               ClassLink(ArrayClass():@Template:@SubClass) ;

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

               include(@IfcIterable) ;
               include(@IfcIterator) ;
               include(@IfcCollection) ;
               include(@IfcList) ;
               include(@IfcListIterator) ;
               include(@IfcSet) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Class definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorClass...
     P                 B
     D                 PI              *
      *À
     D @this           S               *   STATIC INZ(null)
      *
      *ÀClass Definition Template
     D #template       DS                  QUALIFIED
     D                               16A   INZ('*CLASS*TEMPLATE*')
     D                              126A   VARYING INZ('ArrayIterator')
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               10I 0 INZ(%Size(#template))
     D                               10I 0 INZ(%Size(ArrayIterator_))
     D                                4A
      *
     D                              126A   VARYING INZ(
     D                                     'extendsThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     extendsArrayIterator))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'castThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     castArrayIterator))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'instanceOfThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     instanceOfArrayIterator))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'newThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     newArrayIterator))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayIteratorDlt))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisHasNext')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayIteratorHasNext))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisNext')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayIteratorNext))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayIteratorRemove))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
      /free

         //ÀReturn pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //ÀBuild class definition
            @this= extendsObject(#template) ;

         //ÀInterface
            implementsIterator(@this) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀExtend class ArrayIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsArrayIterator...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      /free

         //ÀFinished
            RETURN ClassExtends(ArrayIteratorClass:pTemplate) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Cast
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castArrayIterator...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀCast as an instance of this class
            RETURN ClassCast(ArrayIteratorClass:@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfArrayIterator...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *À
      /free

         //ÀFinished
            RETURN (
              ClassInstanceOf(
                ArrayIteratorClass():
                @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *Ànew ArrayIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newArrayIterator...
     P                 B
     D                 PI              *
     D  @Array                         *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayIterator_)
     D                                     BASED(@this)
      *À
      /free

         //ÀForm a new instance of this class
            @this= ClassNewInstance(ArrayIteratorClass) ;

         //ÀMust be an array
            castArray(@Array) ;

         //ÀInitialise
            this.@Subject= @Array ;
            this.Index= 0 ;
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;
            this.CalledNext= false ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
      /free

         //ÀInstance be a member of the current class
            ClassInstanceCheck(ArrayIteratorClass():@) ;

         //ÀFinished
            RETURN ObjectDlt(@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: HasNext
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorHasNext...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayIterator_)
     D                                     BASED(@this)
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
      /free

         //ÀPick up object
            @this= castArrayIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀTest against limits of array
            IF (this.Index >= ArraySize(this.@Subject)) ;
               RETURN false ;
            ENDIF ;

         //ÀFinished
            RETURN true ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Next
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorNext...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayIterator_)
     D                                     BASED(@this)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
     D @Element        S               *
      *À
      /free

         //ÀPick up object
            @this= castArrayIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀError if the index is out of range
            IF (this.Index >= ArraySize(this.@Subject)) ;
               DLL0008.Index= this.Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀPick up element
            @Element= ArrayRtv(this.@Subject:this.Index) ;

         //ÀIncrement index
            this.Index+= 1 ;

         //ÀFlag that 'next' has been used
            this.CalledNext= true ;

         //ÀFinished
            RETURN @Element ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayIterator: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorRemove...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayIterator_)
     D                                     BASED(@this)
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
     D DLL0011         DS                  QUALIFIED
     D  Name                        126A
      *À
      /free

         //ÀPick up object
            @this= castArrayIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀCheck for prior use of 'next'
            IF (this.CalledNext = false) ;
               DLL0011.Name= 'Array' ;
               Throw(DLL0011:'DLL0011':'DLLMSGF') ;
            ENDIF ;

         //ÀRemove the element
            MONITOR ;
               Object_Delete(
                 #ArrayRemove(this.@Subject:this.Index-1)) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //ÀAdjust index
            this.Index-= 1 ;

         //ÀFlag that 'next' has not been used
            this.CalledNext= false ;

         //ÀSave new modification count
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Class definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayClass...
     P                 B
     D                 PI              *
      *À
     D @this           S               *   STATIC INZ(null)
      *
      *ÀClass Definition Template
     D #template       DS                  QUALIFIED
     D                               16A   INZ('*CLASS*TEMPLATE*')
     D                              126A   VARYING INZ('Array')
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               10I 0 INZ(%Size(#template))
     D                               10I 0 INZ(%Size(Array_))
     D                                4A
      *
     D                              126A   VARYING INZ(
     D                                     'extendsThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     extendsArray))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'castThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     castArray))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'instanceOfThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     instanceOfArray))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'newThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     newArray))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'newThisWithSize')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     newArrayWithSize))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayDlt))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisInitialise')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayInitialise))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisFinalise')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayFinalise))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisAdd')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayAdd))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisAddAll')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayAddAll))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisChg')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayChg))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisChgCapacity')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayChgCapacity))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisClear')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayClear))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisClone')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayClone))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisContains')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayContains))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisContainsAll')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayContainsAll))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisIndexOf')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayIndexOf))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisEquals')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayEquals))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisHashCode')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayHashCode))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisIsEmpty')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayIsEmpty))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisLastIndexOf')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayLastIndexOf))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisNewIterator')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayNewIterator))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisNewListIterator')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayNewListIterator))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayRemove))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisRemoveAll')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayRemoveAll))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisRemoveObject')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayRemoveObject))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisRemoveRange')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayRemoveRange))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisResize')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayResize))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisRetainAll')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayRetainAll))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisRtv')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayRtv))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisSize')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArraySize))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisSort')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArraySort))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisSubList')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArraySubList))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisToArray')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayToArray))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
      *À
      /free

         //ÀReturn pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //ÀBuild class definition
            @this= extendsObject(#template) ;

         //ÀInterface
            implementsList(@this) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀExtend class Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsArray...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      /free

         //ÀFinished
            RETURN ClassExtends(ArrayClass():pTemplate) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *Àcast to Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castArray...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀCast as an instance of this class
            RETURN ClassCast(ArrayClass():@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfArray...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *À
      /free

         //ÀFinished
            RETURN (
              ClassInstanceOf(
                ArrayClass():
                @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *Ànew Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newArray...
     P                 B
     D                 PI              *
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
      /free

         //ÀForm a new instance of this class
            @this= ClassNewInstance(ArrayClass()) ;

         //ÀExit if no optional parameters
            IF (%Parms() = 0) ;
               RETURN @this ;
            ENDIF ;

         //ÀCopy the contents in to the new collection
            ArrayAddAll(@this:@Collection) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *Ànew Array With Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newArrayWithSize...
     P                 B
     D                 PI              *
     D  Size                         10U 0 CONST
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
      /free

         //ÀForm a new array
            IF (%Parms() >= 2) ;
               @this= newArray(@Collection) ;
            ELSE ;
               @this= newArray() ;
            ENDIF ;

         //ÀResize
            ArrayResize(@this:Size) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
      /free

         //ÀInstance be a member of the current class
            ClassInstanceCheck(ArrayClass():@) ;

         //ÀFinished
            RETURN ObjectDlt(@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Initialise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayInitialise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
      /free

         //ÀInvoke superclass method
            @this= superInitialise(ArrayClass():@) ;

         //ÀInitialise
            this.MinCapacity= 32 ;
            this.ElementSize= 16 ;
            this.Size= 0 ;
            this.Capacity= this.MinCapacity ;
            this.@Data= %Alloc(this.Capacity*this.ElementSize) ;
            this.ModCount= 0 ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Finalise
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayFinalise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *À
     D j               S             10I 0
      *À
      /free

         //ÀCast to this class
            @this= ClassCast(ArrayClass():@) ;

         //ÀStart with first element
            @@Element= this.@Data ;

         //ÀProcess whole array
            FOR j= 0 TO this.Size-1 ;

            //ÀRelease and delete element
               Object_ReleaseDelete(@Element) ;

            //ÀNext element
               @@Element+= this.ElementSize ;

         //ÀLoop
            ENDFOR ;

         //ÀTrash internals
            Utility_MemSet(this.@Data:x'FF':this.Capacity*this.ElementSize);
            DEALLOC(N) this.@Data ;

         //ÀInvoke superclass method
            superFinalise(ArrayClass:@this) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Clone
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            RETURN #ArrayClone(@this) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisClone') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
     P #ArrayClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
      *ÀWork fields
     D @clone          S               *
     D clone           DS                  LIKEDS(Array_) BASED(@clone)
      *À
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *À
     D j               S             10I 0
      *À
      /free

         //ÀPick up object
            @this= castArray(@) ;

         //ÀCreate a new object
            @clone= newArray() ;

         //ÀDuplicate the internals
            clone.MinCapacity= this.MinCapacity ;
            clone.ElementSize= this.ElementSize ;
            clone.Size=        this.Size ;
            clone.Capacity=    this.Capacity ;
            clone.@Data= %ReAlloc(clone.@Data:
                            clone.Capacity*clone.ElementSize) ;
            clone.ModCount=    0 ;

         //ÀShallow copy contents
            Utility_MemCpy(
              clone.@Data:this.@Data:clone.Capacity*clone.ElementSize);

         //ÀStart with first element
            @@Element= clone.@Data ;

         //ÀProcess whole array
            FOR j= 0 TO clone.Size-1 ;

            //ÀRetain element
               Object_Retain(@Element) ;

            //ÀNext element
               @@Element+= clone.ElementSize ;

         //ÀLoop
            ENDFOR ;

         //ÀFinished
            RETURN @clone ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Test if empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIsEmpty...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            RETURN (this.Size = 0) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisIsEmpty') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: ChgCapacity
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayChgCapacity...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Capacity                     10I 0 CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Capacity                     10I 0 CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀQuit if new capacity would be too small
            IF (Capacity < this.Capacity) ;
               RETURN ;
            ENDIF ;

            IF (Capacity < 32) ;
               RETURN ;
            ENDIF ;

         //ÀPick up capacity
            this.MinCapacity= Capacity ;
            this.Capacity= Capacity ;

         //ÀReallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity*this.ElementSize);

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisChgCapacity') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  Virtual(@this:Capacity) ;
                  RETURN ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayClear...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *À
     D j               S             10I 0
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀStart with first element
            @@Element= this.@Data ;

         //ÀProcess whole array
            FOR j= 0 TO this.Size-1 ;

            //ÀRelease and delete element
               Object_ReleaseDelete(@Element) ;

            //ÀNext element
               @@Element+= this.ElementSize ;

         //ÀLoop
            ENDFOR ;

         //ÀRecord the modification
            IF (this.Size <> 0) ;
               this.ModCount+= 1 ;
            ENDIF ;

         //ÀReset the size
            this.Size= 0 ;

         //ÀReset capacity
            this.Capacity= this.MinCapacity ;

         //ÀReallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity*this.ElementSize);

         //ÀReinitialise the memory
            Utility_MemSet(this.@Data:x'00':this.Capacity*this.ElementSize);

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisClear') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  Virtual(@this) ;
                  RETURN ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Retrieve Modification Count
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P #ArrayRtvModCount...
     P                 B
     D                 PI            20U 0
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= castArray(@) ;

         //ÀFinished
            RETURN this.ModCount ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀAdd
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayAdd...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D p@Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D p@Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D @Insert         S               *
     D Bytes           S             10I 0
      *À
     D @Element        S               *
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀPick up parameter
            @Element= Object_Retain(p@Element) ;

         //ÀDecide on append or insert
            IF (%Parms() = 2) OR (Index = this.Size) ;
               EXSR Append ;
            ELSE ;
               EXSR Insert ;
            ENDIF ;

         //ÀRecord the modification
            this.ModCount+= 1 ;

         //ÀFinished
            RETURN true ;

         //À----------------------------------------------------------------------------------------
         //ÀAppend Element
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Append ;

         //ÀReallocate storage if required
            IF (this.Size = this.Capacity) ;
               this.Capacity*= 2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize) ;
            ENDIF ;

         //ÀAdd the element
            Utility_MemCpy(this.@Data+(this.Size*this.ElementSize):
              %Addr(@Element):this.ElementSize) ;

         //ÀIncrement the size value
            this.Size+= 1 ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀInsert Element
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Insert ;

         //ÀError if the index is out of range (index < 0 or index > size)
            IF ((Index < 0) OR (Index > this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀReallocate storage if required
            IF (this.Size = this.Capacity) ;
               this.Capacity*= 2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize) ;
            ENDIF ;

         //ÀFind insertion point
            @Insert= this.@Data+(Index*this.ElementSize) ;

         //ÀCalculate bytes to move
            Bytes= (this.Size-Index)*this.ElementSize ;

         //ÀMove existing elements to the right
            Utility_MemCpy(@Insert+this.ElementSize:@Insert:Bytes) ;

         //ÀInsert the element
            Utility_MemCpy(@Insert:%Addr(@Element):this.ElementSize) ;

         //ÀIncrement the size value
            this.Size+= 1 ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisAdd') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 3) ;
                     RETURN Virtual(@this:@Element:Index) ;
                  ELSE ;
                     RETURN Virtual(@this:@Element) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Add All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayAddAll...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Collection                    *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Collection                    *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D @itr            S               *
     D @Element        S               *
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D j               S             10I 0
     D Modified        S               N   INZ(false)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀPick up collection parameter
            castCollection(@Collection) ;

         //ÀAppend or Insert
            IF (%Parms() = 2) ;
               EXSR Append ;
            ELSE ;
               EXSR Insert ;
            ENDIF ;

         //ÀRecord the modification
            IF (Modified = true) ;
               this.ModCount+= 1 ;
            ENDIF ;

         //ÀFinished
            RETURN Modified ;

         //À----------------------------------------------------------------------------------------
         //ÀAppend Elements
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Append ;

           //ÀAppend collection
              @itr= CollectionNewIterator(@Collection) ;
              DOW ForEach(@itr:@Element) ;
                 IF ArrayAdd(@this:@Element) ;
                    Modified= true ;
                 ENDIF ;
              ENDDO ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀInsert Element
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Insert ;

              j= Index ;

           //ÀInsert collection
              @itr= CollectionNewIterator(@Collection) ;
              DOW ForEach(@itr:@Element) ;
                 IF ArrayAdd(@this:@Element:j) ;
                    Modified= true ;
                 ENDIF ;
                 j+= 1 ;
              ENDDO ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisAddAll') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 3) ;
                     RETURN Virtual(@this:@Collection:Index) ;
                  ELSE ;
                     RETURN Virtual(@this:@Collection) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove Element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRemove...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D Index           S             10I 0
     D @Element        S               *
     D Bytes           S             10I 0
     D @OldElement     S               *
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀDeal with optional parameters
            IF (%Parms() >= 2) ;
               RETURN #ArrayRemove(@this:pIndex) ;
            ENDIF ;

         //ÀFinished
            RETURN #ArrayRemove(@this) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRemove') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 2) ;
                     RETURN Virtual(@this:pIndex) ;
                  ELSE ;
                     RETURN Virtual(@this) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
     P #ArrayRemove...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D Index           S             10I 0
     D @Element        S               *
     D Bytes           S             10I 0
     D @OldElement     S               *
      *À
      /free

         //ÀPick up object
            @this= castArray(@) ;

         //ÀPick up index
            SELECT ;
            WHEN (%Parms() >= 2) ;
               Index= pIndex ;
            WHEN (this.Size = 0) ;
               Index= 0 ;
            OTHER ;
               Index= this.Size-1 ;
            ENDSL ;

         //ÀError if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀCalculate the element position
            @Element= this.@Data+(Index*this.ElementSize) ;

         //ÀCopy exising element
            Utility_MemCpy(%Addr(@OldElement):@Element:this.ElementSize) ;

         //ÀDecrement the size
            this.Size-= 1 ;

         //ÀCalculate bytes to move
            Bytes= (this.Size-Index)*this.ElementSize ;

         //ÀMove existing elements to the left
            IF (Bytes > 0) ;
               Utility_MemCpy(@Element:@Element+this.ElementSize:Bytes) ;
            ENDIF ;

         //ÀShrink allocated memory
            IF (this.Size > 0) AND (this.Size = this.Capacity/4)
               AND (this.Capacity/2 >= this.MinCapacity) ;
               this.Capacity= this.Capacity/2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize);
            ENDIF ;

         //ÀRecord the modification
            this.ModCount+= 1 ;

         //ÀRelease
            Object_Release(@OldElement) ;

         //ÀFinished
            RETURN @OldElement ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Retrieve Element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRtv...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D Index           S             10I 0
     D @Element        S               *
     D Element         S               *   BASED(@Element)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀPass errors back to caller
            MONITOR ;

            //ÀUse internal routine
               IF (%Parms() >= 2) ;
                  RETURN #ArrayRtv(@this:pIndex) ;
               ELSE ;
                  RETURN #ArrayRtv(@this) ;
               ENDIF ;

            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRtv') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 2) ;
                     RETURN Virtual(@this:pIndex) ;
                  ELSE ;
                     RETURN Virtual(@this) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
     P #ArrayRtv...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D Index           S             10I 0
     D @Element        S               *
     D Element         S               *   BASED(@Element)
      *À
      /free

         //ÀPick up object
            @this= castArray(@) ;

         //ÀPick up index
            SELECT ;
            WHEN (%Parms() >= 2) ;
               Index= pIndex ;
            WHEN (this.Size = 0) ;
               Index= 0 ;
            OTHER ;
               Index= this.Size-1 ;
            ENDSL ;

         //ÀError if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀPoint at entry
            @Element= this.@Data+(Index*this.ElementSize) ;

         //ÀFinished
            RETURN Element ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Equals
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayEquals...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @that                          *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @that                          *   CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀMust be an implementation of the Set interface
            IF (instanceOfSet(@that) = false) ;
               RETURN false ;
            ENDIF ;

         //ÀEqual if same instance
            IF (castObject(@this) = castObject(@that)) ;
               RETURN true ;
            ENDIF ;

         //ÀNot equal if different size
            IF (this.Size <> CollectionSize(@that)) ;
               RETURN false ;
            ENDIF ;

         //ÀWatch for errors
            MONITOR ;

            //ÀConfirm the collection contains everything it should
               RETURN ArrayContainsAll(@this:@that) ;

         //ÀBring all errors here
            ON-ERROR ;

         //ÀHandle specific errors
            SELECT ;

         //ÀNull pointer
            WHEN Catch('DLL0005') ;
               RETURN false ;

         //ÀClass cast failure
            WHEN Catch('DLL0006') ;
               RETURN false ;
            ENDSL ;

         //ÀThrow everything else back to caller
            Throw() ;

            ENDMON ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisEquals') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@that) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;


      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: HashCode
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayHashCode...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
     D j               S             10I 0
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *À
     D Hash            DS                  QUALIFIED
     D  All                    1      8I 0
     D  High                   1      4U 0
     D  Low                    5      8I 0
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀInitialise
            Hash.All= 0 ;

         //ÀPoint at entry
            @@Element= this.@Data ;

         //ÀLoop through the elements
            FOR j= 0 TO this.Size-1 ;

            //ÀBuild hash
               Hash.High= 0 ;
               Hash.All*= 31 ;
               Hash.High= 0 ;

            //ÀIgnore any null values
               IF (@Element <> null) ;
                  Hash.Low+= ObjectHashCode(@Element) ;
               ENDIF ;

            //ÀPoint at next entry
               @@Element+= this.ElementSize ;

         //ÀLoop with next element
            ENDFOR ;

         //ÀFinished
            RETURN Hash.Low ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisHashCode') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Change Element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayChg...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pElement                        *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D Index           S             10I 0
     D @Element        S               *
     D @OldElement     S               *
     D @NewElement     S               *
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀPick up index
            SELECT ;
            WHEN (%Parms() >= 3) ;
               Index= pIndex ;
            WHEN (this.Size = 0) ;
               Index= 0 ;
            OTHER ;
               Index= this.Size-1 ;
            ENDSL ;

         //ÀError if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀPick up new element
            @NewElement= pElement ;

         //ÀRetain new element
            Object_Retain(@NewElement) ;

         //ÀCalculate the element position
            @Element= this.@Data+(Index*this.ElementSize) ;

         //ÀCopy out the old element
            Utility_MemCpy(%Addr(@OldElement):@Element:this.ElementSize) ;

         //ÀRelease old element
            Object_Release(@OldElement) ;

         //ÀCopy in the new element
            Utility_MemCpy(@Element:%Addr(@NewElement):this.ElementSize) ;

         //ÀRecord the modification
            this.ModCount+= 1 ;

         //ÀFinished
            RETURN @OldElement ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisChg') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 3) ;
                     RETURN Virtual(@this:pElement:pIndex) ;
                  ELSE ;
                     RETURN Virtual(@this:pElement) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Contains
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayContains...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Search                        *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Search                        *   CONST
      *À
     D j               S             10I 0
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀLoop through array
            FOR j= 0 TO this.Size-1 ;

            //ÀPoint at entry
               @@Element= this.@Data+(j*this.ElementSize) ;

            //ÀQuit if the search object has been found
               IF (@Search <> null) AND
                    ObjectEquals(@Search:@Element) ;
                  RETURN true ;
               ELSE ;
                  IF (@Element = null) ;
                     RETURN true ;
                  ENDIF ;
               ENDIF ;

         //ÀLoop with next element
            ENDFOR ;

         //ÀFinished
            RETURN false ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisContains') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Search) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Contains All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayContainsAll...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *À
     D @itr            S               *
     D @Element        S               *
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

           //ÀIterate through collection
              @itr= CollectionNewIterator(@Collection) ;
              DOW ForEach(@itr:@Element) ;

              //ÀQuit if the collection element is not present in this array
                 IF (ArrayContains(@this:@Element) = false) ;
                    IteratorDlt(@itr) ;
                    RETURN false ;
                 ENDIF ;

              ENDDO ;

         //ÀFinished
            RETURN true ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisContainsAll') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Collection) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Index Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIndexOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @Search                        *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Search                        *   CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            RETURN #ArrayIndexOf(@:@Search) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisIndexOf') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Search) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
     P #ArrayIndexOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @Search                        *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D j               S             10I 0
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *À
      /free

         //ÀCast to this type
            @this= castArray(@) ;

         //ÀLoop through array
            FOR j= 0 TO this.Size-1 ;

            //ÀPoint at entry
               @@Element= this.@Data+(j*this.ElementSize) ;

            //ÀQuit if the search object has been found
               IF (@Search <> null) ;
                  IF ObjectEquals(@Search:@Element) ;
                     RETURN j ;
                  ENDIF ;
               ELSE ;
                  IF (@Element = null) ;
                     RETURN j ;
                  ENDIF ;
               ENDIF ;

         //ÀLoop with next element
            ENDFOR ;

         //ÀFinished
            RETURN -1 ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Last Index Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayLastIndexOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @Search                        *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Search                        *   CONST
      *À
     D j               S             10I 0
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀLoop through array
            FOR j= this.Size-1 DOWNTO 0 ;

            //ÀPoint at entry
               @@Element= this.@Data+(j*this.ElementSize) ;

            //ÀQuit if the search object has been found
               IF (@Search <> null) ;
                  IF ObjectEquals(@Search:@Element) ;
                     RETURN j ;
                  ENDIF ;
               ELSE ;
                  IF (@Element = null) ;
                     RETURN j ;
                  ENDIF ;
               ENDIF ;

         //ÀLoop with next element
            ENDFOR ;

         //ÀFinished
            RETURN -1 ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisLastIndexOf') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Search) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New Iterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayNewIterator...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            RETURN newArrayIterator(@this) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisNewIterator') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRemoveAll...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *À
     D @itr            S               *
     D @Element        S               *
     D Changed         S               N   INZ(false)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀIterate through the collection
            @itr= CollectionNewIterator(@Collection) ;
            DOW ForEach(@itr:@Element) ;

            //ÀRemove object from array
               IF #ArrayRemoveObject(@this:@Element) ;
                  Changed= true ;
               ENDIF ;

         //ÀNext element
            ENDDO ;

         //ÀRecord the modification
            IF (Changed = true) ;
               this.ModCount+= 1 ;
            ENDIF ;

         //ÀFinished
            RETURN Changed ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRemoveAll') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Collection) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove Object
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRemoveObject...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Element                       *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Element                       *   CONST
      *À
     D Index           S             10I 0
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            RETURN #ArrayRemoveObject(@this:@Element) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRemoveObject') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Element) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
     P #ArrayRemoveObject...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Element                       *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D Index           S             10I 0
      *À
      /free

         //ÀCast to correct type
            @this= castArray(@) ;

         //ÀFind object in array
            Index= #ArrayIndexOf(@this:@Element) ;

         //ÀQuit if not found
            IF (Index = -1) ;
               RETURN false ;
            ENDIF ;

         //ÀRemove entry
            Object_Delete(#ArrayRemove(@this:Index)) ;

         //ÀFinished
            RETURN true ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Remove Range
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRemoveRange...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀCatch any errors
            MONITOR ;

            //ÀRemove the range
               #ArrayRemoveRange(@this:FromIndex:ToIndex) ;

         //ÀPass any errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRemoveRange') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  Virtual(@this:FromIndex:ToIndex) ;
                  RETURN ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
     P #ArrayRemoveRange...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D @Element        S               *
     D Bytes           S             10I 0
     D Count           S             10I 0
      *À
     D @@Entry         S               *
     D @Entry          S               *    BASED(@@Entry)
     D j               S             10I 0
      *À
      /free

         //ÀPick up object
            @this= castArray(@) ;

         //ÀError if the index is out of range (index < 0 or index > size)
            IF ((FromIndex < 0) OR (FromIndex > this.Size)) ;
               DLL0008.Index= FromIndex ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀError if the index is out of range (index < 0 or index > size)
            IF ((ToIndex < 0) OR (ToIndex > this.Size)) ;
               DLL0008.Index= ToIndex ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀError if the index is out of range (ToIndex < FromIndex)
            IF (ToIndex < FromIndex) ;
               DLL0008.Index= ToIndex ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀIf FromIndex = ToIndex this operation has no effect
            IF (ToIndex = FromIndex) ;
               RETURN ;
            ENDIF ;

         //ÀPoint to first entry to be removed
            @@Entry= this.@Data+(FromIndex*this.ElementSize) ;

         //ÀProcess all in range
            FOR j= FromIndex TO ToIndex ;

            //ÀDelete this entry
               Object_ReleaseDelete(@Entry) ;

            //ÀNext entry
               @@Entry+= this.ElementSize ;

         //ÀLoop
            ENDFOR ;

         //ÀThe number of elements to remove
            Count= (ToIndex - FromIndex) ;

         //ÀCalculate the element position
            @Element= this.@Data+(FromIndex*this.ElementSize) ;

         //ÀCalculate bytes to move
            Bytes= (this.Size-ToIndex)*this.ElementSize ;

         //ÀDecrement the size
            this.Size-= Count ;

         //ÀMove existing elements to the left
            Utility_MemCpy(
              @Element:@Element+(Count*this.ElementSize):Bytes) ;

         //ÀShrink allocated memory
            IF (this.Size > 0) AND (this.Size = this.Capacity/4)
               AND (this.Capacity/2 >= this.MinCapacity) ;
               this.Capacity= this.Capacity/2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize);
            ENDIF ;

         //ÀRecord the modification
            this.ModCount+= 1 ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Resize
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayResize...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Size                         10U 0 CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Size                         10U 0 CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀDecide what to do
            SELECT ;

         //ÀArray requires expansion
            WHEN (this.Size < Size) ;
               EXSR Expand ;

         //ÀArray requires shrinking
            WHEN (this.Size > Size) ;
               EXSR Shrink ;

         //ÀExit if the array size is correct
            OTHER ;
               RETURN ;
            ENDSL ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisResize') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass errors back to caller
               MONITOR ;
                  Virtual(@this:Size) ;
                  RETURN ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀExpand
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Expand ;

         //ÀMake sure there is sufficient capacity
            ArrayChgCapacity(@this:Utility_NextHigherPowerOfTwo(Size)) ;

         //ÀSet size
            this.Size= Size ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀShrink
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Shrink ;

         //ÀRemove all unwanted elements
            ArrayRemoveRange(@this:Size+1:this.Size) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Retain All
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRetainAll...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *À
     D j               S             10I 0
     D @Element        S               *
     D Changed         S               N   INZ(false)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀProcess the entire array
            j= 0 ;
            DOW (j < this.Size) ;

            //ÀFetch element
               @Element= #ArrayRtv(@this:j) ;

            //ÀCheck if in the collection
               IF CollectionContains(@Collection:@Element) ;
                  j+= 1 ;
               ELSE ;
                  Object_Delete(#ArrayRemove(@this:j)) ;
                  Changed= true ;
               ENDIF ;

         //ÀLoop for next element
            ENDDO ;

         //ÀFinished
            RETURN Changed ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRetainAll') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Collection) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: Retrieve Size
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArraySize...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            RETURN this.Size ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisSize') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: To Array
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayToArray...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            RETURN #ArrayClone(@this) ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisToArray') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: SubList
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArraySubList...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *À
     D @clone          S               *
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀCatch any errors
            MONITOR ;

            //ÀClone the original array
               @clone= #ArrayClone(@this) ;

            //ÀRemove the unwanted upper section
               #ArrayRemoveRange(@clone:ToIndex:this.Size) ;

            //ÀRemove the unwanted lower section
               #ArrayRemoveRange(@clone:0:FromIndex) ;

         //ÀPass any errors back to the caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //ÀFinished
            RETURN @clone ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisSubList') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:FromIndex:ToIndex) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArray: New ListIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayNewListIterator...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀFinished
            IF (%Parms() >= 2) ;
               RETURN newArrayListIterator(@this:Index) ;
            ELSE ;
               RETURN newArrayListIterator(@this) ;
            ENDIF ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisNewListIterator') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 2) ;
                     RETURN Virtual(@this:Index) ;
                  ELSE ;
                     RETURN Virtual(@this) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Class definition
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorClass...
     P                 B
     D                 PI              *
      *À
     D @this           S               *   STATIC INZ(null)
      *
      *ÀClass Definition Template
     D #template       DS                  QUALIFIED
     D                               16A   INZ('*CLASS*TEMPLATE*')
     D                              126A   VARYING INZ('ArrayListIterator')
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               10I 0 INZ(%Size(#template))
     D                               10I 0 INZ(%Size(ArrayListIterator_))
     D                                4A
      *
     D                              126A   VARYING INZ(
     D                                     'extendsThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     extendsArrayListIterator))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'castThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     castArrayListIterator))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'instanceOfThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     instanceOfArrayListIterator))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'newThis')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     newArrayListIterator))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisDlt')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorDlt))
     D                               10I 0 INZ(ACCESS_PUB_STA)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisAdd')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorAdd))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisChg')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorChg))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisHasNext')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorHasNext))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisHasPrevious')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorHasPrevious))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisNext')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorNext))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisNextIndex')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorNextIndex))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisPrevious')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorPrevious))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisPreviousIndex')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorPreviousIndex))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *
     D                              126A   VARYING INZ(
     D                                     'thisRemove')
     D                                 *   PROCPTR INZ(%pAddr(
     D                                     ArrayListIteratorRemove))
     D                               10I 0 INZ(ACCESS_PUBLIC)
     D                               12A
      *À
      /free

         //ÀReturn pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //ÀBuild class definition
            @this= extendsObject(#template) ;

         //ÀInterface
            implementsListIterator(@this) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀExtend class ArrayListIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsArrayListIterator...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      /free

         //ÀFinished
            RETURN ClassExtends(ArrayListIteratorClass:pTemplate) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *Àcast to ArrayListIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castArrayListIterator...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀCast as an instance of this class
            RETURN ClassCast(ArrayListIteratorClass:@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Instance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfArrayListIterator...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *À
      /free

         //ÀFinished
            RETURN (
              ClassInstanceOf(
                ArrayListIteratorClass():
                @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *Ànew ArrayListIterator
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newArrayListIterator...
     P                 B
     D                 PI              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
      /free

         //ÀForm a new instance of this class
            @this= ClassNewInstance(ArrayListIteratorClass) ;

         //ÀMust be an array
            castArray(@Array) ;

         //ÀInitialise
            this.@Subject= @Array ;
            this.Size= ArraySize(this.@Subject) ;
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;
            this.Last= -1 ;

            IF (%Parms() >= 2) ;
               this.Cursor= Index ;
            ELSE ;
               this.Cursor= 0 ;
            ENDIF ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
      /free

         //ÀInstance be a member of the current class
            ClassInstanceCheck(ArrayListIteratorClass():@) ;

         //ÀFinished
            RETURN ObjectDlt(@) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Element                       *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
     D DLL0011         DS                  QUALIFIED
     D  Name                        126A
      *À
      /free

         //ÀPick up object
            @this= castArrayListIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀMust be a last-used value
            IF (this.Last = -1) ;
               DLL0011.Name= 'Array' ;
               Throw(DLL0011:'DLL0011':'DLLMSGF') ;
            ENDIF ;

         //ÀThis is the insertion point
            this.Last+= 1 ;

         //ÀAdd the element
            ArrayAdd(this.@Subject:@Element:this.Last) ;

         //ÀKeep the cursor up to date
            this.Cursor= this.Last+1 ;

         //ÀKeep the size updated
            this.Size= ArraySize(this.@Subject) ;

         //ÀThere is no longer a 'last' index
            this.Last= -1 ;

         //ÀSave new modification count
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Change
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorChg...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Element                       *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
     D DLL0011         DS                  QUALIFIED
     D  Name                        126A
      *À
      /free

         //ÀPick up object
            @this= castArrayListIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀMust be a last-used value
            IF (this.Last = -1) ;
               DLL0011.Name= 'Array' ;
               Throw(DLL0011:'DLL0011':'DLLMSGF') ;
            ENDIF ;

         //ÀChange the element
            ArrayChg(this.@Subject:@Element:this.Last) ;

         //ÀKeep the size updated
            this.Size= ArraySize(this.@Subject) ;

         //ÀThere is no longer a 'last' index
            this.Last= -1 ;

         //ÀSave new modification count
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: HasNext
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorHasNext...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
      /free

         //ÀPick up object
            @this= castArrayListIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀTest against limits of array
            IF (this.Cursor < this.Size) ;
               RETURN true ;
            ENDIF ;

         //ÀFinished
            RETURN false ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: HasPrevious
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorHasPrevious...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
      /free

         //ÀPick up object
            @this= castArrayListIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀTest against limits of array
            IF (this.Cursor > 0) ;
               RETURN true ;
            ENDIF ;

         //ÀFinished
            RETURN false ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Next
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorNext...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Cursor                       10I 0
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
     D @Element        S               *
      *À
      /free

         //ÀPick up object
            @this= castArrayListIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀError if the index is out of range
            IF (this.Cursor >= this.Size) ;
               DLL0008.Cursor= this.Cursor ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀPick up element
            @Element= ArrayRtv(this.@Subject:this.Cursor) ;

         //ÀRecord last index number
            this.Last= this.Cursor ;

         //ÀIncrement cursor
            this.Cursor+= 1 ;

         //ÀFinished
            RETURN @Element ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Next Index
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorNextIndex...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Cursor                       10I 0
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
     D @Element        S               *
      *À
      /free

         //ÀPick up object
            @this= castArrayListIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀError if the index is out of range
            IF (this.Cursor >= this.Size) ;
               DLL0008.Cursor= this.Cursor ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀFinished
            RETURN this.Cursor ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Previous
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorPrevious...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Cursor                       10I 0
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
     D @Element        S               *
      *À
      /free

         //ÀPick up object
            @this= castArrayListIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀError if the index is out of range
            IF (this.Cursor = 0) ;
               DLL0008.Cursor= this.Cursor ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀDecrement cursor
            this.Cursor-= 1 ;

         //ÀPick up element
            @Element= ArrayRtv(this.@Subject:this.Cursor) ;

         //ÀRecord last index number
            this.Last= this.Cursor ;

         //ÀFinished
            RETURN @Element ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: PreviousIndex
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorPreviousIndex...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Cursor                       10I 0
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
     D @Element        S               *
      *À
      /free

         //ÀPick up object
            @this= castArrayListIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀError if the index is out of range
            IF (this.Cursor = 0) ;
               DLL0008.Cursor= this.Cursor ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀFinished
            RETURN this.Cursor-1 ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀArrayListIterator: Remove
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorRemove...
     P                 B
     D                 PI
     D  @                              *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *À
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *À
     D DLL0011         DS                  QUALIFIED
     D  Name                        126A
      *À
      /free

         //ÀPick up object
            @this= castArrayListIterator(@) ;

         //ÀCheck for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //ÀMust be a last-used value
            IF (this.Last = -1) ;
               DLL0011.Name= 'Array' ;
               Throw(DLL0011:'DLL0011':'DLLMSGF') ;
            ENDIF ;

         //ÀRemove the element
            MONITOR ;
               Object_Delete(
                 #ArrayRemove(this.@Subject:this.Last)) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //ÀKeep the size updated
            this.Size= ArraySize(this.@Subject) ;

         //ÀAdjust cursor
            IF (this.Last < this.Cursor) ;
               this.Cursor-= 1 ;
            ENDIF ;

         //ÀThere is no longer a 'last' index
            this.Last= -1 ;

         //ÀSave new modification count
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀSort
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArraySort...
     P                 B
     D                 PI
     D  @                              *   CONST
     D p@Comparator                    *   CONST OPTIONS(*NOPASS)
      *À
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *À
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Comparator                    *   CONST OPTIONS(*NOPASS)
      *À
     D @Comparator     S               *
      *À
      /free

         //ÀCheck for overrides
            EXSR #Override ;

         //ÀInitialise if not already done
            IF (@IfcComparator.@extendsThis = null) ;
               include(@IfcComparator) ;
            ENDIF ;

         //ÀSort using natural ordering by default
            IF (%Parms() = 1) ;
               @Comparator= Comparator_NATURAL_ORDER() ;
            ELSE ;
               @Comparator= p@Comparator ;
            ENDIF ;

         //ÀSort
            ComparatorSort(
              @Comparator:
              this.@Data:
              this.Size:
              this.ElementSize) ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀCheck for overrides
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //ÀPick up object pointer
               @this= @ ;

            //ÀCheck for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisSort') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //ÀPass errors back to caller
               MONITOR ;
                  IF (%Parms() = 1) ;
                     Virtual(@this) ;
                  ELSE ;
                     Virtual(@this:p@Comparator) ;
                  ENDIF ;
                  RETURN ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
