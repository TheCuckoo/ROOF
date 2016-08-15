      *�
      *�____________________________________________________________________________________________
      *�ZIndex: Signature
      *�--------------------------------------------------------------------------------------------
     P ZIndexSignature...
     P                 B
     D                 PI            16A
      *�
     D Signature       S             16A   STATIC INZ
      *�
     D Seed            DS
     D  TimeStamp                      Z
     D  Pointer                        *   INZ(%Addr(Seed))
      *�
      /free

         //�Exit if already generated
            IF (Signature <> *BLANKS) ;
               RETURN Signature ;
            ENDIF ;

         //�Generate new signature
            TimeStamp= %TimeStamp() ;
            Signature= Utility_MD5Hash(%Addr(Seed):%Size(Seed)) ;

         //�Finished
            RETURN Signature ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�____________________________________________________________________________________________
      *�ZIndex: Signature Check
      *�--------------------------------------------------------------------------------------------
     P ZIndexSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Watch for errors
            MONITOR ;

            //�Return the value or fail in the attempt
               RETURN Utility_SignatureCheck(@:
                 ZIndexSignature:ZIndexName) ;

         //�Percolate the error
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Create
      *�--------------------------------------------------------------------------------------------
     P ZIndexCrt...
     P                 B
     D                 PI              *
     D  @Comparison                    *   PROCPTR CONST
     D  Capacity                     10I 0 CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
      /free

         //�Form the basic structure
            @this= %Alloc(%Size(this)) ;
            this.Signature= ZIndexSignature ;

         //�Initialise
            this.@Comparison= @Comparison ;
            this.ElementSize= %Size(#ZIndexElement) ;
            this.Size= 0 ;
            this.Capacity= 32 ;
            IF (%Parms() >= 2) AND (Capacity > 32) ;
               this.Capacity= Capacity ;
            ENDIF ;
            this.@Data= %Alloc(this.Capacity*this.ElementSize) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Delete
      *�--------------------------------------------------------------------------------------------
     P ZIndexDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Deallocate the data memory
            DEALLOC(N) this.@Data ;

         //�Trash memory
            Utility_MemSet(@this:x'FF':%Size(this)) ;

         //�Deallocate the object itself
            DEALLOC(N) @ ;

         //�Finished
            RETURN @ ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Retrieve Size
      *�--------------------------------------------------------------------------------------------
     P ZIndexSize...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Finished
            RETURN this.Size ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Retrieve Element Size
      *�--------------------------------------------------------------------------------------------
     P ZIndexElementSize...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Finished
            RETURN this.ElementSize ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Test if empty
      *�--------------------------------------------------------------------------------------------
     P ZIndexIsEmpty...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Finished
            RETURN (this.Size = 0) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Change Capacity
      *�--------------------------------------------------------------------------------------------
     P ZIndexChgCapacity...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  Capacity                     10I 0 CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Quit if new capacity would be too small
            IF (Capacity < this.Capacity) ;
               RETURN ;
            ENDIF ;

         //�Reallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:Capacity*this.ElementSize) ;

         //�Set the new capacity value
            this.Capacity= Capacity ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Clear
      *�--------------------------------------------------------------------------------------------
     P ZIndexClr...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @Visit                         *   PROCPTR CONST OPTIONS(*NOPASS)
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
     D @Element        S               *
     D Element         S                   LIKE(#ZIndexElement)
     D                                     BASED(@Element)
      *�
     D j               S             10I 0
      *�
     D Visit           PR                  EXTPROC(@Visit)
     D  @Element                       *
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Run the Visit procedure on each element if specified
            IF (%Parms() >= 2) AND (@Visit <> null) ;
               EXSR RunVisit ;
            ENDIF ;

         //�Reset the size
            this.Size= 0 ;

         //�Reset capacity
            this.Capacity= 32 ;

         //�Reallocate the data memory based on the new capacity
            this.@Data= %ReAlloc(this.@Data:this.Capacity*this.ElementSize);

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Visit each Element
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR RunVisit ;

            //�Keep track of element locations
               @Element= this.@Data ;

            //�Visit each element
               FOR j= 1 TO this.Size ;

               //�Run the procedure
                  Visit(Element) ;

               //�Point at next element
                  @Element+= this.ElementSize ;

            //�Loop
               ENDFOR ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Add
      *�--------------------------------------------------------------------------------------------
     P ZIndexAdd...
     P                 B
     D                 PI                  LIKE(#ZIndexElement)
     D  @                              *   CONST
     D  Element                            LIKE(#ZIndexElement) VALUE
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
     D Found           S               N
     D @Element        S               *
     D Index           S             10I 0
      *�
     D Bytes           S             10I 0
      *�
     D OldElement      S                   LIKE(#ZIndexElement) INZ
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Search for existing entry
            Found=
              Utility_BinarySearch(
                %Addr(Element):
                this.@Data:
                this.Size:
                this.ElementSize:
                this.@Comparison:
                @Element:
                Index) ;

         //�Found existing element, so replace
            IF (Found = true) ;
               EXSR ElementReplace ;
            ELSE ;
               EXSR ElementNew ;
            ENDIF ;

         //�Finished
            RETURN OldElement ;

         //�----------------------------------------------------------------------------------------
         //�Replace Element
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR ElementReplace ;

         //�Copy out old element
            Utility_MemCpy(%Addr(OldElement):@Element:this.ElementSize) ;

         //�Add the element
            Utility_MemCpy(@Element:%Addr(Element):this.ElementSize) ;

         //�Finished
            ENDSR ;

         //�----------------------------------------------------------------------------------------
         //�New Element
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR ElementNew ;

         //�Reallocate storage if required
            IF (this.Size = this.Capacity) ;
               this.Capacity*= 2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize) ;
            ENDIF ;

         //�Find insertion point
            @Element= this.@Data+(Index*this.ElementSize) ;

         //�Calculate bytes to move
            Bytes= (this.Size-Index)*this.ElementSize ;

         //�Move existing elements to the right
            Utility_MemCpy(@Element+this.ElementSize:@Element:Bytes) ;

         //�Insert the element
            Utility_MemCpy(@Element:%Addr(Element):this.ElementSize) ;

         //�Increment the size value
            this.Size+= 1 ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Retrieve Element
      *�--------------------------------------------------------------------------------------------
     P ZIndexRtv...
     P                 B
     D                 PI                  LIKE(#ZIndexElement)
     D  @                              *   CONST
     D  Search                             LIKE(#ZIndexElement) VALUE
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
     D Found           S               N
     D Index           S             10I 0
     D @Element        S               *
     D Element         S                   LIKE(#ZIndexElement)
     D                                     BASED(@Element)
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Search for existing entry
            @Element=
              Utility_BSearch(
                %Addr(Search):
                this.@Data:
                this.Size:
                this.ElementSize:
                this.@Comparison) ;

         //�Return value if found
            IF (@Element <> null) ;
               RETURN Element ;
            ENDIF ;

         //�Finished
            RETURN null ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Remove Element
      *�--------------------------------------------------------------------------------------------
     P ZIndexRmv...
     P                 B
     D                 PI                  LIKE(#ZIndexElement)
     D  @                              *   CONST
     D  Search                             LIKE(#ZIndexElement) VALUE
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
     D Found           S               N
     D Index           S             10I 0
     D @Element        S               *
     D Element         S                   LIKE(#ZIndexElement)
      *�
     D Bytes           S             10I 0
     D NotFound        S                   LIKE(#ZIndexElement) INZ
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Search for existing entry
            Found=
              Utility_BinarySearch(
                %Addr(Search):
                this.@Data:
                this.Size:
                this.ElementSize:
                this.@Comparison:
                @Element:
                Index) ;

         //�Quit if not found
            IF (Found = false) ;
               RETURN NotFound ;
            ENDIF ;

         //�Copy exising element
            Utility_MemCpy(%Addr(Element):@Element:this.ElementSize) ;

         //�Decrement the size
            this.Size-= 1 ;

         //�Calculate bytes to move
            Bytes= (this.Size-Index)*this.ElementSize ;

         //�Move existing elements to the left
            IF (Bytes > 0) ;
               Utility_MemCpy(@Element:@Element+this.ElementSize:Bytes) ;
            ENDIF ;

         //�Shrink allocated memory
            IF (this.Size > 0) AND (this.Size = this.Capacity/4) ;
               this.Capacity= this.Capacity/2 ;
               this.@Data=
                 %ReAlloc(this.@Data:this.Capacity*this.ElementSize);
            ENDIF ;

         //�Finished
            RETURN Element ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Has Element
      *�--------------------------------------------------------------------------------------------
     P ZIndexHas...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D  Search                             LIKE(#ZIndexElement) VALUE
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
     D Found           S               N
     D Index           S             10I 0
     D @Element        S               *
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Search for existing entry
            RETURN
              (Utility_BSearch(
                %Addr(Search):
                this.@Data:
                this.Size:
                this.ElementSize:
                this.@Comparison) <> null) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�________________________________________________________________________
      *�ZIndex: Retrieve Element At Index
      *�--------------------------------------------------------------------------------------------
     P ZIndexElementAtIndex...
     P                 B
     D                 PI                  LIKE(#ZIndexElement)
     D  @                              *   CONST
     D  Index                        10I 0 CONST
      *�
      *�Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZIndex_) BASED(@this)
      *�
     D DLL0008         DS                  QUALIFIED
     D  Index                        10I 0
      *�
     D @Element        S               *
     D Element         S                   LIKE(#ZIndexElement)
     D                                     BASED(@Element)
      *�
      /free

         //�Pick up this object
            @this= ZIndexSignatureCheck(@) ;

         //�Error if the index is out of range (index < 0 or index >= size)
            IF ((Index < 0) OR (Index >= this.Size)) ;
               DLL0008.Index= Index ;
               Throw(DLL0008:'DLL0008':'DLLMSGF') ;
            ENDIF ;

         //�Point at element
            @Element= this.@Data+(Index*this.ElementSize) ;

         //�Finished
            RETURN Element ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
