      *À
      *ÀName
     D ZIndexName      C                   'ZIndex'
      *À
      *ÀStructure
     D ZIndex_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  @Data                          *
     D  @Comparison                    *   PROCPTR
     D  Size                         10I 0
     D  Capacity                     10I 0
     D  ElementSize                  10I 0
     D                                4A
      *À
     D #ZIndexElement...
     D                 S               *   BASED(@NULL)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Signature
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexSignature...
     D                 PR            16A
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexSignatureCheck...
     D                 PR              *
     D  @ZIndex                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Create
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexCrt...
     D                 PR              *
     D  @Comparison                    *   PROCPTR CONST
     D  Capacity                     10I 0 CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexDlt...
     D                 PR              *
     D  @ZIndex                        *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Number of elements (cardinality)
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexSize...
     D                 PR            10I 0
     D  @ZIndex                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Size of a single element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexElementSize...
     D                 PR            10I 0
     D  @ZIndex                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Test if empty
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexIsEmpty...
     D                 PR              N
     D  @ZIndex                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Clear
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexClr...
     D                 PR
     D  @ZIndex                        *   CONST
     D  @Visit                         *   PROCPTR CONST OPTIONS(*NOPASS)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Change Capacity
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexChgCapacity...
     D                 PR
     D  @ZIndex                        *   CONST
     D  Capacity                     10I 0 CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Add element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexAdd...
     D                 PR                  LIKE(#ZIndexElement)
     D  @ZIndex                        *   CONST
     D  @Element                           LIKE(#ZIndexElement) VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Retrieve element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexRtv...
     D                 PR                  LIKE(#ZIndexElement)
     D  @ZIndex                        *   CONST
     D  @Element                           LIKE(#ZIndexElement) VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Remove element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexRmv...
     D                 PR                  LIKE(#ZIndexElement)
     D  @ZIndex                        *   CONST
     D  @Element                           LIKE(#ZIndexElement) VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Has element
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexHas...
     D                 PR              N
     D  @ZIndex                        *   CONST
     D  @Element                           LIKE(#ZIndexElement) VALUE
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀZIndex: Retrieve Element At Index
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZIndexElementAtIndex...
     D                 PR                  LIKE(#ZIndexElement)
     D  @ZIndex                        *   CONST
     D  Index                        10I 0 CONST
      *À
