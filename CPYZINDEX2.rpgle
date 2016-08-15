      *À
      *À____________________________________________________________________________________________
      *ÀZIndex: Signature
      *À--------------------------------------------------------------------------------------------
     P ZIndexSignature...
     P                 B
     D                 PI            16A
      *À
     D Signature       S             16A   STATIC INZ
      *À
     D Seed            DS
     D  TimeStamp                      Z
     D  Pointer                        *   INZ(%Addr(Seed))
      *À
      /free

         //ÀExit if already generated
            IF (Signature <> *BLANKS) ;
               RETURN Signature ;
            ENDIF ;

         //ÀGenerate new signature
            TimeStamp= %TimeStamp() ;
            Signature= Utility_MD5Hash(%Addr(Seed):%Size(Seed)) ;

         //ÀFinished
            RETURN Signature ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À____________________________________________________________________________________________
      *ÀZIndex: Signature Check
      *À--------------------------------------------------------------------------------------------
     P ZIndexSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀWatch for errors
            MONITOR ;

            //ÀReturn the value or fail in the attempt
               RETURN Utility_SignatureCheck(@:
                 ZIndexSignature:ZIndexName) ;

         //ÀPercolate the error
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Create
      *À--------------------------------------------------------------------------------------------
     P ZIndexCrt...
     P                 B
     D                 PI              *
     D  @Comparison                    *   PROCPTR CONST
     D  Capacity                     10I 0 CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
      /free

         //ÀForm the basic structure
            @this= %Alloc(%Size(this)) ;
            this.Signature= ZIndexSignature ;

         //ÀInitialise
            this.@Comparison= @Comparison ;
            this.ElementSize= %Size(#ZIndexElement) ;
            this.Size= 0 ;
            this.Capacity= 32 ;
            IF (%Parms() >= 2) AND (Capacity > 32) ;
               this.Capacity= Capacity ;
            ENDIF ;
            this.@Data= %Alloc(this.Capacity*this.ElementSize) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Delete
      *À--------------------------------------------------------------------------------------------
     P ZIndexDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀDeallocate the data memory
            DEALLOC(N) this.@Data ;

         //ÀTrash memory
            Utility_MemSet(@this:x'FF':%Size(this)) ;

         //ÀDeallocate the object itself
            DEALLOC(N) @ ;

         //ÀFinished
            RETURN @ ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Retrieve Size
      *À--------------------------------------------------------------------------------------------
     P ZIndexSize...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀFinished
            RETURN this.Size ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Retrieve Element Size
      *À--------------------------------------------------------------------------------------------
     P ZIndexElementSize...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀFinished
            RETURN this.ElementSize ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Test if empty
      *À--------------------------------------------------------------------------------------------
     P ZIndexIsEmpty...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀFinished
            RETURN (this.Size = 0) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Change Capacity
      *À--------------------------------------------------------------------------------------------
     P ZIndexChgCapacity...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Capacity                     10I 0 CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀQuit if new capacity would be too small
            IF (Capacity < this.Capacity) ;
               RETURN ;
            ENDIF ;

         //ÀReallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:Capacity*this.ElementSize) ;

         //ÀSet the new capacity value
            this.Capacity= Capacity ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Clear
      *À--------------------------------------------------------------------------------------------
     P ZIndexClr...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Visit                         *   PROCPTR CONST OPTIONS(*NOPASS)
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
     D @Element        S               *
     D Element         S                   LIKE(#ZIndexElement)
     D                                     BASED(@Element)
      *À
     D j               S             10I 0
      *À
     D Visit           PR                  EXTPROC(@Visit)
     D  @Element                       *
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀRun the Visit procedure on each element if specified
            IF (%Parms() >= 2) AND (@Visit <> null) ;
               EXSR RunVisit ;
            ENDIF ;

         //ÀReset the size
            this.Size= 0 ;

         //ÀReset capacity
            this.Capacity= 32 ;

         //ÀReallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity*this.ElementSize);

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀVisit each Element
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR RunVisit ;

            //ÀKeep track of element locations
               @Element= this.@Data ;

            //ÀVisit each element
               FOR j= 1 TO this.Size ;

               //ÀRun the procedure
                  Visit(Element) ;

               //ÀPoint at next element
                  @Element+= this.ElementSize ;

            //ÀLoop
               ENDFOR ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Add
      *À--------------------------------------------------------------------------------------------
     P ZIndexAdd...
     P                 B
     D                 PI                  LIKE(#ZIndexElement)
     D  @                              *   CONST
     D  Element                            LIKE(#ZIndexElement) VALUE
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
     D Found           S               N
     D @Element        S               *
     D Index           S             10I 0
      *À
     D Bytes           S             10I 0
      *À
     D OldElement      S                   LIKE(#ZIndexElement) INZ
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀSearch for existing entry
            Found=
              Utility_BinarySearch(
                %Addr(Element):
                this.@Data:
                this.Size:
                this.ElementSize:
                this.@Comparison:
                @Element:
                Index) ;

         //ÀFound existing element, so replace
            IF (Found = true) ;
               EXSR ElementReplace ;
            ELSE ;
               EXSR ElementNew ;
            ENDIF ;

         //ÀFinished
            RETURN OldElement ;

         //À----------------------------------------------------------------------------------------
         //ÀReplace Element
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR ElementReplace ;

         //ÀCopy out old element
            Utility_MemCpy(%Addr(OldElement):@Element:this.ElementSize) ;

         //ÀAdd the element
            Utility_MemCpy(@Element:%Addr(Element):this.ElementSize) ;

         //ÀFinished
            ENDSR ;

         //À----------------------------------------------------------------------------------------
         //ÀNew Element
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR ElementNew ;

         //ÀReallocate storage if required
            IF (this.Size = this.Capacity) ;
               this.Capacity*= 2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize) ;
            ENDIF ;

         //ÀFind insertion point
            @Element= this.@Data+(Index*this.ElementSize) ;

         //ÀCalculate bytes to move
            Bytes= (this.Size-Index)*this.ElementSize ;

         //ÀMove existing elements to the right
            Utility_MemCpy(@Element+this.ElementSize:@Element:Bytes) ;

         //ÀInsert the element
            Utility_MemCpy(@Element:%Addr(Element):this.ElementSize) ;

         //ÀIncrement the size value
            this.Size+= 1 ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Retrieve Element
      *À--------------------------------------------------------------------------------------------
     P ZIndexRtv...
     P                 B
     D                 PI                  LIKE(#ZIndexElement)
     D  @                              *   CONST
     D  Search                             LIKE(#ZIndexElement) VALUE
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
     D Found           S               N
     D Index           S             10I 0
     D @Element        S               *
     D Element         S                   LIKE(#ZIndexElement)
     D                                     BASED(@Element)
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀSearch for existing entry
            @Element=
              Utility_BSearch(
                %Addr(Search):
                this.@Data:
                this.Size:
                this.ElementSize:
                this.@Comparison) ;

         //ÀReturn value if found
            IF (@Element <> null) ;
               RETURN Element ;
            ENDIF ;

         //ÀFinished
            RETURN null ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Remove Element
      *À--------------------------------------------------------------------------------------------
     P ZIndexRmv...
     P                 B
     D                 PI                  LIKE(#ZIndexElement)
     D  @                              *   CONST
     D  Search                             LIKE(#ZIndexElement) VALUE
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
     D Found           S               N
     D Index           S             10I 0
     D @Element        S               *
     D Element         S                   LIKE(#ZIndexElement)
      *À
     D Bytes           S             10I 0
     D NotFound        S                   LIKE(#ZIndexElement) INZ
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀSearch for existing entry
            Found=
              Utility_BinarySearch(
                %Addr(Search):
                this.@Data:
                this.Size:
                this.ElementSize:
                this.@Comparison:
                @Element:
                Index) ;

         //ÀQuit if not found
            IF (Found = false) ;
               RETURN NotFound ;
            ENDIF ;

         //ÀCopy exising element
            Utility_MemCpy(%Addr(Element):@Element:this.ElementSize) ;

         //ÀDecrement the size
            this.Size-= 1 ;

         //ÀCalculate bytes to move
            Bytes= (this.Size-Index)*this.ElementSize ;

         //ÀMove existing elements to the left
            IF (Bytes > 0) ;
               Utility_MemCpy(@Element:@Element+this.ElementSize:Bytes) ;
            ENDIF ;

         //ÀShrink allocated memory
            IF (this.Size > 0) AND (this.Size = this.Capacity/4) ;
               this.Capacity= this.Capacity/2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize);
            ENDIF ;

         //ÀFinished
            RETURN Element ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Has Element
      *À--------------------------------------------------------------------------------------------
     P ZIndexHas...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  Search                             LIKE(#ZIndexElement) VALUE
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
     D Found           S               N
     D Index           S             10I 0
     D @Element        S               *
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀSearch for existing entry
            RETURN
              (Utility_BSearch(
                %Addr(Search):
                this.@Data:
                this.Size:
                this.ElementSize:
                this.@Comparison) <> null) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À________________________________________________________________________
      *ÀZIndex: Retrieve Element At Index
      *À--------------------------------------------------------------------------------------------
     P ZIndexElementAtIndex...
     P                 B
     D                 PI                  LIKE(#ZIndexElement)
     D  @                              *   CONST
     D  Index                        10I 0 CONST
      *À
      *ÀWork fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *À
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *À
     D @Element        S               *
     D Element         S                   LIKE(#ZIndexElement)
     D                                     BASED(@Element)
      *À
      /free

         //ÀPick up this object
            @this= ZIndexSignatureCheck(@) ;

         //ÀError if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //ÀPoint at element
            @Element= this.@Data+(Index*this.ElementSize) ;

         //ÀFinished
            RETURN Element ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
