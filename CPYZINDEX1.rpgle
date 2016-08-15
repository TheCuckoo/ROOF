      *�
      *�Name
     D ZIndexName      C                   'ZIndex'
      *�
      *�Structure
     D ZIndex_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  @Data                          *
     D  @Comparison                    *   PROCPTR
     D  Size                         10I 0
     D  Capacity                     10I 0
     D  ElementSize                  10I 0
     D                                4A
      *�
     D #ZIndexElement...
     D                 S               *   BASED(@NULL)
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Signature
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexSignature...
     D                 PR            16A
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexSignatureCheck...
     D                 PR              *
     D  @ZIndex                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Create
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexCrt...
     D                 PR              *
     D  @Comparison                    *   PROCPTR CONST
     D  Capacity                     10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexDlt...
     D                 PR              *
     D  @ZIndex                        *
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Number of elements (cardinality)
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexSize...
     D                 PR            10I 0
     D  @ZIndex                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Size of a single element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexElementSize...
     D                 PR            10I 0
     D  @ZIndex                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Test if empty
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexIsEmpty...
     D                 PR              N
     D  @ZIndex                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Clear
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexClr...
     D                 PR
     D  @ZIndex                        *   CONST
     D  @Visit                         *   PROCPTR CONST OPTIONS(*NOPASS)
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Change Capacity
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexChgCapacity...
     D                 PR
     D  @ZIndex                        *   CONST
     D  Capacity                     10I 0 CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Add element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexAdd...
     D                 PR                  LIKE(#ZIndexElement)
     D  @ZIndex                        *   CONST
     D  @Element                           LIKE(#ZIndexElement) VALUE
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Retrieve element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexRtv...
     D                 PR                  LIKE(#ZIndexElement)
     D  @ZIndex                        *   CONST
     D  @Element                           LIKE(#ZIndexElement) VALUE
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Remove element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexRmv...
     D                 PR                  LIKE(#ZIndexElement)
     D  @ZIndex                        *   CONST
     D  @Element                           LIKE(#ZIndexElement) VALUE
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Has element
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexHas...
     D                 PR              N
     D  @ZIndex                        *   CONST
     D  @Element                           LIKE(#ZIndexElement) VALUE
      *�
      *�--------------------------------------------------------------------------------------------
      *�ZIndex: Retrieve Element At Index
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexElementAtIndex...
     D                 PR                  LIKE(#ZIndexElement)
     D  @ZIndex                        *   CONST
     D  Index                        10I 0 CONST
      *�
