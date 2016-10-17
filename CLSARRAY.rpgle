     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO)
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
     D/COPY RAYLIB/QDLLSRCV20,CPYOBJECT
     D/COPY RAYLIB/QDLLSRCV20,PKGCOLLECT
      *�
      *�--------------------------------------------------------------------------------------------
      *�Definitions
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�Array Structure
     D Array_          DS                  QUALIFIED BASED(@NULL) ALIGN
     D   #Object                           LIKE(Object_)
     D  @Data                          *
     D  Size                         10I 0
     D  Capacity                     10I 0
     D  MinCapacity                  10I 0
     D  ElementSize                  10I 0
     D  ModCount                     20U 0
      *
      *�Array Iterator Structure
     D ArrayIterator_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  #Object                            LIKE(Object_)
     D  @Subject                       *
     D  Index                        10I 0
     D  ModCount                     20U 0
     D  CalledNext                     N
      *
      *�Array ListIterator Structure
     D ArrayListIterator_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  #Object                            LIKE(Object_)
     D  @Subject                       *
     D  Cursor                       10I 0
     D  Size                         10I 0
     D  Last                         10I 0
     D  ModCount                     20U 0
      *
      *�--------------------------------------------------------------------------------------------
      *�Prototypes
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Class Definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorClass...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: extend class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsArrayIterator...
     D                 PR              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castArrayIterator...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfArrayIterator...
     D                 PR              N
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArrayIterator...
     D                 PR              *
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorDlt...
     D                 PR              *
     D  @Array                         *
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: HasNext
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorHasNext...
     D                 PR              N
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Next
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorNext...
     D                 PR              *
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIteratorRemove...
     D                 PR
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Class Definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorClass...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: extend class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsArrayListIterator...
     D                 PR              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castArrayListIterator...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfArrayListIterator...
     D                 PR              N
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArrayListIterator...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorDlt...
     D                 PR              *
     D  @this                          *
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Add
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorAdd...
     D                 PR
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Change
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorChg...
     D                 PR
     D  @this                          *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: HasNext
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorHasNext...
     D                 PR              N
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: HasPrevious
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorHasPrevious...
     D                 PR              N
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Next
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorNext...
     D                 PR              *
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Next Index
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorNextIndex...
     D                 PR            10I 0
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Previous
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorPrevious...
     D                 PR              *
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Previous Index
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorPreviousIndex...
     D                 PR            10I 0
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayListIteratorRemove...
     D                 PR
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New ListIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayNewListIterator...
     D                 PR              *
     D  @this                          *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array Class Definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClass...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: extend class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsArray...
     D                 PR              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castArray...
     D                 PR              *
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfArray...
     D                 PR              N
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArray...
     D                 PR              *
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New with Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newArrayWithSize...
     D                 PR              *
     D  Size                         10U 0 CONST
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayDlt...
     D                 PR              *
     D  @Array                         *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Finalise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayFinalise...
     D                 PR
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Initialise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayInitialise...
     D                 PR
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�#Array: Retrieve Modification Count
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D #ArrayRtvModCount...
     D                 PR            20U 0
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Add element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayAdd...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Add All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayAddAll...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Change element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayChg...
     D                 PR              *
     D  @Array                         *   CONST
     D  @Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Change Capacity
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayChgCapacity...
     D                 PR
     D  @Array                         *   CONST
     D  Capacity                     10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Clear
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClear...
     D                 PR
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Clone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayClone...
     D                 PR              *
     D  @Array                         *   CONST
      *�
     D #ArrayClone...
     D                 PR              *
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Contains
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayContains...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Contains All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayContainsAll...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Equals
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayEquals...
     D                 PR              N
     D  @Array                         *   CONST
     D  @that                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayHashCode...
     D                 PR            10I 0
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Index Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIndexOf...
     D                 PR            10I 0
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *�
      *�shared implementation
     D #ArrayIndexOf...
     D                 PR            10I 0
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Test if empty
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayIsEmpty...
     D                 PR              N
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Last Index Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayLastIndexOf...
     D                 PR            10I 0
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New Iterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayNewIterator...
     D                 PR              *
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Retrieve element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRtv...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D #ArrayRtv...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemove...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D #ArrayRemove...
     D                 PR              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveAll...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove Object
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveObject...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *�
     D #ArrayRemoveObject...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Element                       *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove Range
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRemoveRange...
     D                 PR
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
     D #ArrayRemoveRange...
     D                 PR
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Resize
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayResize...
     D                 PR
     D  @                              *   CONST
     D  Size                         10U 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Retain All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayRetainAll...
     D                 PR              N
     D  @Array                         *   CONST
     D  @Collection                    *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Number of elements (cardinality)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySize...
     D                 PR            10I 0
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Sort
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySort...
     D                 PR
     D  @Array                         *   CONST
     D  @Comparator                    *   CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: SubList
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArraySubList...
     D                 PR              *
     D  @Array                         *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Convert To Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ArrayToArray...
     D                 PR              *
     D  @Array                         *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Constants and Work Fields
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�--------------------------------------------------------------------------------------------
      *�*ENTRY PLIST Parameters
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('CLSARRAY')
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

         //�Class: Array
            WHEN (ClassLinkName(@Template) = 'Array') ;
               ClassLink(ArrayClass():@Template:@SubClass) ;

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

               include(@IfcIterable) ;
               include(@IfcIterator) ;
               include(@IfcCollection) ;
               include(@IfcList) ;
               include(@IfcListIterator) ;
               include(@IfcSet) ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Class definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorClass...
     P                 B
     D                 PI              *
      *�
     D @this           S               *   STATIC INZ(null)
      *
      *�Class Definition Template
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
      *�
      /free

         //�Return pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //�Build class definition
            @this= extendsObject(#template) ;

         //�Interface
            implementsIterator(@this) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Extend class ArrayIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsArrayIterator...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      /free

         //�Finished
            RETURN ClassExtends(ArrayIteratorClass:pTemplate) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Cast
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castArrayIterator...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Cast as an instance of this class
            RETURN ClassCast(ArrayIteratorClass:@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfArrayIterator...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *�
      /free

         //�Finished
            RETURN (
              ClassInstanceOf(
                ArrayIteratorClass():
                @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�new ArrayIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newArrayIterator...
     P                 B
     D                 PI              *
     D  @Array                         *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayIterator_)
     D                                     BASED(@this)
      *�
      /free

         //�Form a new instance of this class
            @this= ClassNewInstance(ArrayIteratorClass) ;

         //�Must be an array
            castArray(@Array) ;

         //�Initialise
            this.@Subject= @Array ;
            this.Index= 0 ;
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;
            this.CalledNext= false ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
      /free

         //�Instance be a member of the current class
            ClassInstanceCheck(ArrayIteratorClass():@) ;

         //�Finished
            RETURN ObjectDlt(@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: HasNext
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorHasNext...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayIterator_)
     D                                     BASED(@this)
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
      /free

         //�Pick up object
            @this= castArrayIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Test against limits of array
            IF (this.Index >= ArraySize(this.@Subject)) ;
               RETURN false ;
            ENDIF ;

         //�Finished
            RETURN true ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Next
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorNext...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayIterator_)
     D                                     BASED(@this)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
     D @Element        S               *
      *�
      /free

         //�Pick up object
            @this= castArrayIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Error if the index is out of range
            IF (this.Index >= ArraySize(this.@Subject)) ;
               DLL0008.Index= this.Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Pick up element
            @Element= ArrayRtv(this.@Subject:this.Index) ;

         //�Increment index
            this.Index+= 1 ;

         //�Flag that 'next' has been used
            this.CalledNext= true ;

         //�Finished
            RETURN @Element ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayIterator: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIteratorRemove...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayIterator_)
     D                                     BASED(@this)
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
     D DLL0011         DS                  QUALIFIED
     D  Name                        126A
      *�
      /free

         //�Pick up object
            @this= castArrayIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Check for prior use of 'next'
            IF (this.CalledNext = false) ;
               DLL0011.Name= 'Array' ;
               Throw(DLL0011:'DLL0011':'DLLMSGF') ;
            ENDIF ;

         //�Remove the element
            MONITOR ;
               Object_Delete(
                 #ArrayRemove(this.@Subject:this.Index-1)) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //�Adjust index
            this.Index-= 1 ;

         //�Flag that 'next' has not been used
            this.CalledNext= false ;

         //�Save new modification count
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Class definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayClass...
     P                 B
     D                 PI              *
      *�
     D @this           S               *   STATIC INZ(null)
      *
      *�Class Definition Template
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
      *�
      /free

         //�Return pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //�Build class definition
            @this= extendsObject(#template) ;

         //�Interface
            implementsList(@this) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Extend class Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsArray...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      /free

         //�Finished
            RETURN ClassExtends(ArrayClass():pTemplate) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�cast to Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castArray...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Cast as an instance of this class
            RETURN ClassCast(ArrayClass():@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfArray...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *�
      /free

         //�Finished
            RETURN (
              ClassInstanceOf(
                ArrayClass():
                @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�new Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newArray...
     P                 B
     D                 PI              *
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
      /free

         //�Form a new instance of this class
            @this= ClassNewInstance(ArrayClass()) ;

         //�Exit if no optional parameters
            IF (%Parms() = 0) ;
               RETURN @this ;
            ENDIF ;

         //�Copy the contents in to the new collection
            ArrayAddAll(@this:@Collection) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�new Array With Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newArrayWithSize...
     P                 B
     D                 PI              *
     D  Size                         10U 0 CONST
     D  @Collection                    *   CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
      /free

         //�Form a new array
            IF (%Parms() >= 2) ;
               @this= newArray(@Collection) ;
            ELSE ;
               @this= newArray() ;
            ENDIF ;

         //�Resize
            ArrayResize(@this:Size) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
      /free

         //�Instance be a member of the current class
            ClassInstanceCheck(ArrayClass():@) ;

         //�Finished
            RETURN ObjectDlt(@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Initialise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayInitialise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
      /free

         //�Invoke superclass method
            @this= superInitialise(ArrayClass():@) ;

         //�Initialise
            this.MinCapacity= 32 ;
            this.ElementSize= 16 ;
            this.Size= 0 ;
            this.Capacity= this.MinCapacity ;
            this.@Data= %Alloc(this.Capacity*this.ElementSize) ;
            this.ModCount= 0 ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Finalise
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayFinalise...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *�
     D j               S             10I 0
      *�
      /free

         //�Cast to this class
            @this= ClassCast(ArrayClass():@) ;

         //�Start with first element
            @@Element= this.@Data ;

         //�Process whole array
            FOR j= 0 TO this.Size-1 ;

            //�Release and delete element
               Object_ReleaseDelete(@Element) ;

            //�Next element
               @@Element+= this.ElementSize ;

         //�Loop
            ENDFOR ;

         //�Trash internals
            Utility_MemSet(this.@Data:x'FF':this.Capacity*this.ElementSize);
            DEALLOC(N) this.@Data ;

         //�Invoke superclass method
            superFinalise(ArrayClass:@this) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Clone
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            RETURN #ArrayClone(@this) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisClone') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
     P #ArrayClone...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
      *�Work fields
     D @clone          S               *
     D clone           DS                  LIKEDS(Array_) BASED(@clone)
      *�
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *�
     D j               S             10I 0
      *�
      /free

         //�Pick up object
            @this= castArray(@) ;

         //�Create a new object
            @clone= newArray() ;

         //�Duplicate the internals
            clone.MinCapacity= this.MinCapacity ;
            clone.ElementSize= this.ElementSize ;
            clone.Size=        this.Size ;
            clone.Capacity=    this.Capacity ;
            clone.@Data= %ReAlloc(clone.@Data:
                            clone.Capacity*clone.ElementSize) ;
            clone.ModCount=    0 ;

         //�Shallow copy contents
            Utility_MemCpy(
              clone.@Data:this.@Data:clone.Capacity*clone.ElementSize);

         //�Start with first element
            @@Element= clone.@Data ;

         //�Process whole array
            FOR j= 0 TO clone.Size-1 ;

            //�Retain element
               Object_Retain(@Element) ;

            //�Next element
               @@Element+= clone.ElementSize ;

         //�Loop
            ENDFOR ;

         //�Finished
            RETURN @clone ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Test if empty
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIsEmpty...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            RETURN (this.Size = 0) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisIsEmpty') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: ChgCapacity
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayChgCapacity...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Capacity                     10I 0 CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Capacity                     10I 0 CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Quit if new capacity would be too small
            IF (Capacity < this.Capacity) ;
               RETURN ;
            ENDIF ;

            IF (Capacity < 32) ;
               RETURN ;
            ENDIF ;

         //�Pick up capacity
            this.MinCapacity= Capacity ;
            this.Capacity= Capacity ;

         //�Reallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity*this.ElementSize);

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisChgCapacity') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  Virtual(@this:Capacity) ;
                  RETURN ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Clear
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayClear...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *�
     D j               S             10I 0
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Start with first element
            @@Element= this.@Data ;

         //�Process whole array
            FOR j= 0 TO this.Size-1 ;

            //�Release and delete element
               Object_ReleaseDelete(@Element) ;

            //�Next element
               @@Element+= this.ElementSize ;

         //�Loop
            ENDFOR ;

         //�Record the modification
            IF (this.Size <> 0) ;
               this.ModCount+= 1 ;
            ENDIF ;

         //�Reset the size
            this.Size= 0 ;

         //�Reset capacity
            this.Capacity= this.MinCapacity ;

         //�Reallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity*this.ElementSize);

         //�Reinitialise the memory
            Utility_MemSet(this.@Data:x'00':this.Capacity*this.ElementSize);

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisClear') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  Virtual(@this) ;
                  RETURN ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Retrieve Modification Count
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P #ArrayRtvModCount...
     P                 B
     D                 PI            20U 0
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
      /free

         //�Pick up object
            @this= castArray(@) ;

         //�Finished
            RETURN this.ModCount ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Add
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayAdd...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D p@Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D p@Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D @Insert         S               *
     D Bytes           S             10I 0
      *�
     D @Element        S               *
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Pick up parameter
            @Element= Object_Retain(p@Element) ;

         //�Decide on append or insert
            IF (%Parms() = 2) OR (Index = this.Size) ;
               EXSR Append ;
            ELSE ;
               EXSR Insert ;
            ENDIF ;

         //�Record the modification
            this.ModCount+= 1 ;

         //�Finished
            RETURN true ;

         //�----------------------------------------------------------------------------------------
         //�Append Element
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Append ;

         //�Reallocate storage if required
            IF (this.Size = this.Capacity) ;
               this.Capacity*= 2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize) ;
            ENDIF ;

         //�Add the element
            Utility_MemCpy(this.@Data+(this.Size*this.ElementSize):
              %Addr(@Element):this.ElementSize) ;

         //�Increment the size value
            this.Size+= 1 ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Insert Element
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Insert ;

         //�Error if the index is out of range (index < 0 or index > size)
            IF ((Index < 0) OR (Index > this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Reallocate storage if required
            IF (this.Size = this.Capacity) ;
               this.Capacity*= 2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize) ;
            ENDIF ;

         //�Find insertion point
            @Insert= this.@Data+(Index*this.ElementSize) ;

         //�Calculate bytes to move
            Bytes= (this.Size-Index)*this.ElementSize ;

         //�Move existing elements to the right
            Utility_MemCpy(@Insert+this.ElementSize:@Insert:Bytes) ;

         //�Insert the element
            Utility_MemCpy(@Insert:%Addr(@Element):this.ElementSize) ;

         //�Increment the size value
            this.Size+= 1 ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisAdd') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 3) ;
                     RETURN Virtual(@this:@Element:Index) ;
                  ELSE ;
                     RETURN Virtual(@this:@Element) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Add All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayAddAll...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Collection                    *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Collection                    *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D @itr            S               *
     D @Element        S               *
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D j               S             10I 0
     D Modified        S               N   INZ(false)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Pick up collection parameter
            castCollection(@Collection) ;

         //�Append or Insert
            IF (%Parms() = 2) ;
               EXSR Append ;
            ELSE ;
               EXSR Insert ;
            ENDIF ;

         //�Record the modification
            IF (Modified = true) ;
               this.ModCount+= 1 ;
            ENDIF ;

         //�Finished
            RETURN Modified ;

         //�----------------------------------------------------------------------------------------
         //�Append Elements
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Append ;

           //�Append collection
              @itr= CollectionNewIterator(@Collection) ;
              DOW ForEach(@itr:@Element) ;
                 IF ArrayAdd(@this:@Element) ;
                    Modified= true ;
                 ENDIF ;
              ENDDO ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Insert Element
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Insert ;

              j= Index ;

           //�Insert collection
              @itr= CollectionNewIterator(@Collection) ;
              DOW ForEach(@itr:@Element) ;
                 IF ArrayAdd(@this:@Element:j) ;
                    Modified= true ;
                 ENDIF ;
                 j+= 1 ;
              ENDDO ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisAddAll') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 3) ;
                     RETURN Virtual(@this:@Collection:Index) ;
                  ELSE ;
                     RETURN Virtual(@this:@Collection) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove Element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRemove...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D Index           S             10I 0
     D @Element        S               *
     D Bytes           S             10I 0
     D @OldElement     S               *
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Deal with optional parameters
            IF (%Parms() >= 2) ;
               RETURN #ArrayRemove(@this:pIndex) ;
            ENDIF ;

         //�Finished
            RETURN #ArrayRemove(@this) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRemove') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 2) ;
                     RETURN Virtual(@this:pIndex) ;
                  ELSE ;
                     RETURN Virtual(@this) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
     P #ArrayRemove...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D Index           S             10I 0
     D @Element        S               *
     D Bytes           S             10I 0
     D @OldElement     S               *
      *�
      /free

         //�Pick up object
            @this= castArray(@) ;

         //�Pick up index
            SELECT ;
            WHEN (%Parms() >= 2) ;
               Index= pIndex ;
            WHEN (this.Size = 0) ;
               Index= 0 ;
            OTHER ;
               Index= this.Size-1 ;
            ENDSL ;

         //�Error if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Calculate the element position
            @Element= this.@Data+(Index*this.ElementSize) ;

         //�Copy exising element
            Utility_MemCpy(%Addr(@OldElement):@Element:this.ElementSize) ;

         //�Decrement the size
            this.Size-= 1 ;

         //�Calculate bytes to move
            Bytes= (this.Size-Index)*this.ElementSize ;

         //�Move existing elements to the left
            IF (Bytes > 0) ;
               Utility_MemCpy(@Element:@Element+this.ElementSize:Bytes) ;
            ENDIF ;

         //�Shrink allocated memory
            IF (this.Size > 0) AND (this.Size = this.Capacity/4)
               AND (this.Capacity/2 >= this.MinCapacity) ;
               this.Capacity= this.Capacity/2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize);
            ENDIF ;

         //�Record the modification
            this.ModCount+= 1 ;

         //�Release
            Object_Release(@OldElement) ;

         //�Finished
            RETURN @OldElement ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Retrieve Element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRtv...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D Index           S             10I 0
     D @Element        S               *
     D Element         S               *   BASED(@Element)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Pass errors back to caller
            MONITOR ;

            //�Use internal routine
               IF (%Parms() >= 2) ;
                  RETURN #ArrayRtv(@this:pIndex) ;
               ELSE ;
                  RETURN #ArrayRtv(@this) ;
               ENDIF ;

            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRtv') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 2) ;
                     RETURN Virtual(@this:pIndex) ;
                  ELSE ;
                     RETURN Virtual(@this) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
     P #ArrayRtv...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D Index           S             10I 0
     D @Element        S               *
     D Element         S               *   BASED(@Element)
      *�
      /free

         //�Pick up object
            @this= castArray(@) ;

         //�Pick up index
            SELECT ;
            WHEN (%Parms() >= 2) ;
               Index= pIndex ;
            WHEN (this.Size = 0) ;
               Index= 0 ;
            OTHER ;
               Index= this.Size-1 ;
            ENDSL ;

         //�Error if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Point at entry
            @Element= this.@Data+(Index*this.ElementSize) ;

         //�Finished
            RETURN Element ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Equals
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayEquals...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @that                          *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @that                          *   CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Must be an implementation of the Set interface
            IF (instanceOfSet(@that) = false) ;
               RETURN false ;
            ENDIF ;

         //�Equal if same instance
            IF (castObject(@this) = castObject(@that)) ;
               RETURN true ;
            ENDIF ;

         //�Not equal if different size
            IF (this.Size <> CollectionSize(@that)) ;
               RETURN false ;
            ENDIF ;

         //�Watch for errors
            MONITOR ;

            //�Confirm the collection contains everything it should
               RETURN ArrayContainsAll(@this:@that) ;

         //�Bring all errors here
            ON-ERROR ;

         //�Handle specific errors
            SELECT ;

         //�Null pointer
            WHEN Catch('DLL0005') ;
               RETURN false ;

         //�Class cast failure
            WHEN Catch('DLL0006') ;
               RETURN false ;
            ENDSL ;

         //�Throw everything else back to caller
            Throw() ;

            ENDMON ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisEquals') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@that) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;


      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: HashCode
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayHashCode...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
     D j               S             10I 0
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *�
     D Hash            DS                  QUALIFIED
     D  All                    1      8I 0
     D  High                   1      4U 0
     D  Low                    5      8I 0
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Initialise
            Hash.All= 0 ;

         //�Point at entry
            @@Element= this.@Data ;

         //�Loop through the elements
            FOR j= 0 TO this.Size-1 ;

            //�Build hash
               Hash.High= 0 ;
               Hash.All*= 31 ;
               Hash.High= 0 ;

            //�Ignore any null values
               IF (@Element <> null) ;
                  Hash.Low+= ObjectHashCode(@Element) ;
               ENDIF ;

            //�Point at next entry
               @@Element+= this.ElementSize ;

         //�Loop with next element
            ENDFOR ;

         //�Finished
            RETURN Hash.Low ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisHashCode') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Change Element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayChg...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D pElement                        *   CONST
     D pIndex                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Element                       *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D Index           S             10I 0
     D @Element        S               *
     D @OldElement     S               *
     D @NewElement     S               *
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Pick up index
            SELECT ;
            WHEN (%Parms() >= 3) ;
               Index= pIndex ;
            WHEN (this.Size = 0) ;
               Index= 0 ;
            OTHER ;
               Index= this.Size-1 ;
            ENDSL ;

         //�Error if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Pick up new element
            @NewElement= pElement ;

         //�Retain new element
            Object_Retain(@NewElement) ;

         //�Calculate the element position
            @Element= this.@Data+(Index*this.ElementSize) ;

         //�Copy out the old element
            Utility_MemCpy(%Addr(@OldElement):@Element:this.ElementSize) ;

         //�Release old element
            Object_Release(@OldElement) ;

         //�Copy in the new element
            Utility_MemCpy(@Element:%Addr(@NewElement):this.ElementSize) ;

         //�Record the modification
            this.ModCount+= 1 ;

         //�Finished
            RETURN @OldElement ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisChg') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 3) ;
                     RETURN Virtual(@this:pElement:pIndex) ;
                  ELSE ;
                     RETURN Virtual(@this:pElement) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Contains
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayContains...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Search                        *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Search                        *   CONST
      *�
     D j               S             10I 0
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Loop through array
            FOR j= 0 TO this.Size-1 ;

            //�Point at entry
               @@Element= this.@Data+(j*this.ElementSize) ;

            //�Quit if the search object has been found
               IF (@Search <> null) AND
                    ObjectEquals(@Search:@Element) ;
                  RETURN true ;
               ELSE ;
                  IF (@Element = null) ;
                     RETURN true ;
                  ENDIF ;
               ENDIF ;

         //�Loop with next element
            ENDFOR ;

         //�Finished
            RETURN false ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisContains') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Search) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Contains All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayContainsAll...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *�
     D @itr            S               *
     D @Element        S               *
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

           //�Iterate through collection
              @itr= CollectionNewIterator(@Collection) ;
              DOW ForEach(@itr:@Element) ;

              //�Quit if the collection element is not present in this array
                 IF (ArrayContains(@this:@Element) = false) ;
                    IteratorDlt(@itr) ;
                    RETURN false ;
                 ENDIF ;

              ENDDO ;

         //�Finished
            RETURN true ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisContainsAll') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Collection) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Index Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayIndexOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @Search                        *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Search                        *   CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            RETURN #ArrayIndexOf(@:@Search) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisIndexOf') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Search) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
     P #ArrayIndexOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @Search                        *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D j               S             10I 0
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *�
      /free

         //�Cast to this type
            @this= castArray(@) ;

         //�Loop through array
            FOR j= 0 TO this.Size-1 ;

            //�Point at entry
               @@Element= this.@Data+(j*this.ElementSize) ;

            //�Quit if the search object has been found
               IF (@Search <> null) ;
                  IF ObjectEquals(@Search:@Element) ;
                     RETURN j ;
                  ENDIF ;
               ELSE ;
                  IF (@Element = null) ;
                     RETURN j ;
                  ENDIF ;
               ENDIF ;

         //�Loop with next element
            ENDFOR ;

         //�Finished
            RETURN -1 ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Last Index Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayLastIndexOf...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
     D  @Search                        *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Search                        *   CONST
      *�
     D j               S             10I 0
     D @@Element       S               *
     D @Element        S               *   BASED(@@Element)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Loop through array
            FOR j= this.Size-1 DOWNTO 0 ;

            //�Point at entry
               @@Element= this.@Data+(j*this.ElementSize) ;

            //�Quit if the search object has been found
               IF (@Search <> null) ;
                  IF ObjectEquals(@Search:@Element) ;
                     RETURN j ;
                  ENDIF ;
               ELSE ;
                  IF (@Element = null) ;
                     RETURN j ;
                  ENDIF ;
               ENDIF ;

         //�Loop with next element
            ENDFOR ;

         //�Finished
            RETURN -1 ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisLastIndexOf') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Search) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New Iterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayNewIterator...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            RETURN newArrayIterator(@this) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisNewIterator') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRemoveAll...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *�
     D @itr            S               *
     D @Element        S               *
     D Changed         S               N   INZ(false)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Iterate through the collection
            @itr= CollectionNewIterator(@Collection) ;
            DOW ForEach(@itr:@Element) ;

            //�Remove object from array
               IF #ArrayRemoveObject(@this:@Element) ;
                  Changed= true ;
               ENDIF ;

         //�Next element
            ENDDO ;

         //�Record the modification
            IF (Changed = true) ;
               this.ModCount+= 1 ;
            ENDIF ;

         //�Finished
            RETURN Changed ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRemoveAll') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Collection) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove Object
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRemoveObject...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Element                       *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Element                       *   CONST
      *�
     D Index           S             10I 0
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            RETURN #ArrayRemoveObject(@this:@Element) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRemoveObject') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Element) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
     P #ArrayRemoveObject...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Element                       *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D Index           S             10I 0
      *�
      /free

         //�Cast to correct type
            @this= castArray(@) ;

         //�Find object in array
            Index= #ArrayIndexOf(@this:@Element) ;

         //�Quit if not found
            IF (Index = -1) ;
               RETURN false ;
            ENDIF ;

         //�Remove entry
            Object_Delete(#ArrayRemove(@this:Index)) ;

         //�Finished
            RETURN true ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Remove Range
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRemoveRange...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Catch any errors
            MONITOR ;

            //�Remove the range
               #ArrayRemoveRange(@this:FromIndex:ToIndex) ;

         //�Pass any errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRemoveRange') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  Virtual(@this:FromIndex:ToIndex) ;
                  RETURN ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
     P #ArrayRemoveRange...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D @Element        S               *
     D Bytes           S             10I 0
     D Count           S             10I 0
      *�
     D @@Entry         S               *
     D @Entry          S               *    BASED(@@Entry)
     D j               S             10I 0
      *�
      /free

         //�Pick up object
            @this= castArray(@) ;

         //�Error if the index is out of range (index < 0 or index > size)
            IF ((FromIndex < 0) OR (FromIndex > this.Size)) ;
               DLL0008.Index= FromIndex ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Error if the index is out of range (index < 0 or index > size)
            IF ((ToIndex < 0) OR (ToIndex > this.Size)) ;
               DLL0008.Index= ToIndex ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Error if the index is out of range (ToIndex < FromIndex)
            IF (ToIndex < FromIndex) ;
               DLL0008.Index= ToIndex ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�If FromIndex = ToIndex this operation has no effect
            IF (ToIndex = FromIndex) ;
               RETURN ;
            ENDIF ;

         //�Point to first entry to be removed
            @@Entry= this.@Data+(FromIndex*this.ElementSize) ;

         //�Process all in range
            FOR j= FromIndex TO ToIndex ;

            //�Delete this entry
               Object_ReleaseDelete(@Entry) ;

            //�Next entry
               @@Entry+= this.ElementSize ;

         //�Loop
            ENDFOR ;

         //�The number of elements to remove
            Count= (ToIndex - FromIndex) ;

         //�Calculate the element position
            @Element= this.@Data+(FromIndex*this.ElementSize) ;

         //�Calculate bytes to move
            Bytes= (this.Size-ToIndex)*this.ElementSize ;

         //�Decrement the size
            this.Size-= Count ;

         //�Move existing elements to the left
            Utility_MemCpy(
              @Element:@Element+(Count*this.ElementSize):Bytes) ;

         //�Shrink allocated memory
            IF (this.Size > 0) AND (this.Size = this.Capacity/4)
               AND (this.Capacity/2 >= this.MinCapacity) ;
               this.Capacity= this.Capacity/2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize);
            ENDIF ;

         //�Record the modification
            this.ModCount+= 1 ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Resize
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayResize...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Size                         10U 0 CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Size                         10U 0 CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Decide what to do
            SELECT ;

         //�Array requires expansion
            WHEN (this.Size < Size) ;
               EXSR Expand ;

         //�Array requires shrinking
            WHEN (this.Size > Size) ;
               EXSR Shrink ;

         //�Exit if the array size is correct
            OTHER ;
               RETURN ;
            ENDSL ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisResize') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass errors back to caller
               MONITOR ;
                  Virtual(@this:Size) ;
                  RETURN ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Expand
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Expand ;

         //�Make sure there is sufficient capacity
            ArrayChgCapacity(@this:Utility_NextHigherPowerOfTwo(Size)) ;

         //�Set size
            this.Size= Size ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�Shrink
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Shrink ;

         //�Remove all unwanted elements
            ArrayRemoveRange(@this:Size+1:this.Size) ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Retain All
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayRetainAll...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              N
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Collection                    *   CONST
      *�
     D j               S             10I 0
     D @Element        S               *
     D Changed         S               N   INZ(false)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Process the entire array
            j= 0 ;
            DOW (j < this.Size) ;

            //�Fetch element
               @Element= #ArrayRtv(@this:j) ;

            //�Check if in the collection
               IF CollectionContains(@Collection:@Element) ;
                  j+= 1 ;
               ELSE ;
                  Object_Delete(#ArrayRemove(@this:j)) ;
                  Changed= true ;
               ENDIF ;

         //�Loop for next element
            ENDDO ;

         //�Finished
            RETURN Changed ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisRetainAll') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:@Collection) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: Retrieve Size
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArraySize...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR            10I 0
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            RETURN this.Size ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisSize') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: To Array
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayToArray...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            RETURN #ArrayClone(@this) ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisToArray') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: SubList
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArraySubList...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  FromIndex                    10I 0 CONST
     D  ToIndex                      10I 0 CONST
      *�
     D @clone          S               *
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Catch any errors
            MONITOR ;

            //�Clone the original array
               @clone= #ArrayClone(@this) ;

            //�Remove the unwanted upper section
               #ArrayRemoveRange(@clone:ToIndex:this.Size) ;

            //�Remove the unwanted lower section
               #ArrayRemoveRange(@clone:0:FromIndex) ;

         //�Pass any errors back to the caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //�Finished
            RETURN @clone ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisSubList') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass errors back to caller
               MONITOR ;
                  RETURN Virtual(@this:FromIndex:ToIndex) ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Array: New ListIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayNewListIterator...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR              *
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Finished
            IF (%Parms() >= 2) ;
               RETURN newArrayListIterator(@this:Index) ;
            ELSE ;
               RETURN newArrayListIterator(@this) ;
            ENDIF ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisNewListIterator') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass any errors back to caller
               MONITOR ;
                  IF (%Parms() >= 2) ;
                     RETURN Virtual(@this:Index) ;
                  ELSE ;
                     RETURN Virtual(@this) ;
                  ENDIF ;
               ON-ERROR ;
                  Throw() ;
               ENDMON ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Class definition
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorClass...
     P                 B
     D                 PI              *
      *�
     D @this           S               *   STATIC INZ(null)
      *
      *�Class Definition Template
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
      *�
      /free

         //�Return pointer if already initialised
            IF (@this <> null) ;
               RETURN @this ;
            ENDIF ;

         //�Build class definition
            @this= extendsObject(#template) ;

         //�Interface
            implementsListIterator(@this) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Extend class ArrayListIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsArrayListIterator...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      /free

         //�Finished
            RETURN ClassExtends(ArrayListIteratorClass:pTemplate) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�cast to ArrayListIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castArrayListIterator...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Cast as an instance of this class
            RETURN ClassCast(ArrayListIteratorClass:@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfArrayListIterator...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *�
      /free

         //�Finished
            RETURN (
              ClassInstanceOf(
                ArrayListIteratorClass():
                @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�new ArrayListIterator
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newArrayListIterator...
     P                 B
     D                 PI              *
     D  @Array                         *   CONST
     D  Index                        10I 0 CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
      /free

         //�Form a new instance of this class
            @this= ClassNewInstance(ArrayListIteratorClass) ;

         //�Must be an array
            castArray(@Array) ;

         //�Initialise
            this.@Subject= @Array ;
            this.Size= ArraySize(this.@Subject) ;
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;
            this.Last= -1 ;

            IF (%Parms() >= 2) ;
               this.Cursor= Index ;
            ELSE ;
               this.Cursor= 0 ;
            ENDIF ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
      /free

         //�Instance be a member of the current class
            ClassInstanceCheck(ArrayListIteratorClass():@) ;

         //�Finished
            RETURN ObjectDlt(@) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Add
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Element                       *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
     D DLL0011         DS                  QUALIFIED
     D  Name                        126A
      *�
      /free

         //�Pick up object
            @this= castArrayListIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Must be a last-used value
            IF (this.Last = -1) ;
               DLL0011.Name= 'Array' ;
               Throw(DLL0011:'DLL0011':'DLLMSGF') ;
            ENDIF ;

         //�This is the insertion point
            this.Last+= 1 ;

         //�Add the element
            ArrayAdd(this.@Subject:@Element:this.Last) ;

         //�Keep the cursor up to date
            this.Cursor= this.Last+1 ;

         //�Keep the size updated
            this.Size= ArraySize(this.@Subject) ;

         //�There is no longer a 'last' index
            this.Last= -1 ;

         //�Save new modification count
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Change
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorChg...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Element                       *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
     D DLL0011         DS                  QUALIFIED
     D  Name                        126A
      *�
      /free

         //�Pick up object
            @this= castArrayListIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Must be a last-used value
            IF (this.Last = -1) ;
               DLL0011.Name= 'Array' ;
               Throw(DLL0011:'DLL0011':'DLLMSGF') ;
            ENDIF ;

         //�Change the element
            ArrayChg(this.@Subject:@Element:this.Last) ;

         //�Keep the size updated
            this.Size= ArraySize(this.@Subject) ;

         //�There is no longer a 'last' index
            this.Last= -1 ;

         //�Save new modification count
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: HasNext
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorHasNext...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
      /free

         //�Pick up object
            @this= castArrayListIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Test against limits of array
            IF (this.Cursor < this.Size) ;
               RETURN true ;
            ENDIF ;

         //�Finished
            RETURN false ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: HasPrevious
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorHasPrevious...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
      /free

         //�Pick up object
            @this= castArrayListIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Test against limits of array
            IF (this.Cursor > 0) ;
               RETURN true ;
            ENDIF ;

         //�Finished
            RETURN false ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Next
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorNext...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Cursor                       10I 0
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
     D @Element        S               *
      *�
      /free

         //�Pick up object
            @this= castArrayListIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Error if the index is out of range
            IF (this.Cursor >= this.Size) ;
               DLL0008.Cursor= this.Cursor ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Pick up element
            @Element= ArrayRtv(this.@Subject:this.Cursor) ;

         //�Record last index number
            this.Last= this.Cursor ;

         //�Increment cursor
            this.Cursor+= 1 ;

         //�Finished
            RETURN @Element ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Next Index
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorNextIndex...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Cursor                       10I 0
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
     D @Element        S               *
      *�
      /free

         //�Pick up object
            @this= castArrayListIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Error if the index is out of range
            IF (this.Cursor >= this.Size) ;
               DLL0008.Cursor= this.Cursor ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Finished
            RETURN this.Cursor ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Previous
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorPrevious...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Cursor                       10I 0
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
     D @Element        S               *
      *�
      /free

         //�Pick up object
            @this= castArrayListIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Error if the index is out of range
            IF (this.Cursor = 0) ;
               DLL0008.Cursor= this.Cursor ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Decrement cursor
            this.Cursor-= 1 ;

         //�Pick up element
            @Element= ArrayRtv(this.@Subject:this.Cursor) ;

         //�Record last index number
            this.Last= this.Cursor ;

         //�Finished
            RETURN @Element ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: PreviousIndex
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorPreviousIndex...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Cursor                       10I 0
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
     D @Element        S               *
      *�
      /free

         //�Pick up object
            @this= castArrayListIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Error if the index is out of range
            IF (this.Cursor = 0) ;
               DLL0008.Cursor= this.Cursor ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Finished
            RETURN this.Cursor-1 ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�ArrayListIterator: Remove
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArrayListIteratorRemove...
     P                 B
     D                 PI
     D  @                              *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(ArrayListIterator_)
     D                                     BASED(@this)
      *�
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      *�
     D DLL0011         DS                  QUALIFIED
     D  Name                        126A
      *�
      /free

         //�Pick up object
            @this= castArrayListIterator(@) ;

         //�Check for concurrent modification
            IF (this.ModCount <> #ArrayRtvModCount(this.@Subject)) ;
               DLL0010.Name= 'Array' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         //�Must be a last-used value
            IF (this.Last = -1) ;
               DLL0011.Name= 'Array' ;
               Throw(DLL0011:'DLL0011':'DLLMSGF') ;
            ENDIF ;

         //�Remove the element
            MONITOR ;
               Object_Delete(
                 #ArrayRemove(this.@Subject:this.Last)) ;
            ON-ERROR ;
               Throw() ;
            ENDMON ;

         //�Keep the size updated
            this.Size= ArraySize(this.@Subject) ;

         //�Adjust cursor
            IF (this.Last < this.Cursor) ;
               this.Cursor-= 1 ;
            ENDIF ;

         //�There is no longer a 'last' index
            this.Last= -1 ;

         //�Save new modification count
            this.ModCount= #ArrayRtvModCount(this.@Subject) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Sort
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ArraySort...
     P                 B
     D                 PI
     D  @                              *   CONST
     D p@Comparator                    *   CONST OPTIONS(*NOPASS)
      *�
     D @this           S               *
     D this            DS                  LIKEDS(Array_) BASED(@this)
      *�
     D @Virtual        S               *   PROCPTR
     D Virtual         PR
     D                                     EXTPROC(@Virtual)
     D  @                              *   CONST
     D  @Comparator                    *   CONST OPTIONS(*NOPASS)
      *�
     D @Comparator     S               *
      *�
      /free

         //�Check for overrides
            EXSR #Override ;

         //�Initialise if not already done
            IF (@IfcComparator.@extendsThis = null) ;
               include(@IfcComparator) ;
            ENDIF ;

         //�Sort using natural ordering by default
            IF (%Parms() = 1) ;
               @Comparator= Comparator_NATURAL_ORDER() ;
            ELSE ;
               @Comparator= p@Comparator ;
            ENDIF ;

         //�Sort
            ComparatorSort(
              @Comparator:
              this.@Data:
              this.Size:
              this.ElementSize) ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Check for overrides
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR #Override ;

            //�Pick up object pointer
               @this= @ ;

            //�Check for overrides
               @Virtual= ClassRtvVirtual(ArrayClass():@this:
                 'thisSort') ;
               IF (@Virtual = null) ;
                  LEAVESR ;
               ENDIF ;

            //�Pass errors back to caller
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

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
