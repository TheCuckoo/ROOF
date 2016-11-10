     H NOMAIN
     H DATFMT(*ISO)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO:*SHOWCPY)
     H CCSID(*CHAR:*JOBRUN)
     H BNDDIR('QC2LE')
     H BNDDIR('SRVCMPFND')
     H BNDDIR('SRVZARRAY')
     H BNDDIR('SRVZITERAT')
     H BNDDIR('SRVZCOLLCT')
     H BNDDIR('SRVQOOMTH')
      * 
      * Required prototypes
     D/COPY RAYLIB/QDLLSRCV30,CPYCMPFND
     D/COPY RAYLIB/QDLLSRCV30,CPYZARRAY
     D/COPY RAYLIB/QDLLSRCV30,CPYZITERAT
     D/COPY RAYLIB/QDLLSRCV30,CPYZCOLLCT
      * 
      * --------------------------------------------------------------------------------------------
      * Structures
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      * 
      * Instance Structure
     D ZHashMap_...
     D                 DS                  QUALIFIED ALIGN BASED(@NULL)
     D  Signature                    16A
     D  @Table                         *
     D  @ProcHash                      *   PROCPTR
     D  @ProcCompare                   *   PROCPTR
     D  @ProcPreDlt                    *   PROCPTR
     D  Size                         10I 0
     D  LoadFactor                    4F
     D  Threshold                    10I 0
     D                                4A
      * 
      * Instance Structure
     D ZHashMapEntry_...
     D                 DS                  QUALIFIED ALIGN BASED(@NULL)
     D  Signature                    16A
     D  @Key                           *
     D  @Value                         *
     D  @Next                          *
     D  @ProcPreDlt                    *   PROCPTR
     D  Hash                         10I 0
     D                               12A
      * 
      * Instance Structure for ZHashIterator
     D ZHashIterator_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  @Subject                       *
     D  @Next                          *
     D  @Current                       *
     D  @ProcNext                      *   PROCPTR
     D  Index                        10I 0
     D  ModCount                     10I 0
      * 
      * Constants
     D ZHASHMAP_DFTCAP...
     D                 C                   CONST(16)
      * 
     D ZHASHMAP_MAXCAP...
     D                 C                   CONST(1073741824)
      * 
     D ZHASHMAP_DFTFCT...
     D                 C                   CONST(0.75)
      * 
      * --------------------------------------------------------------------------------------------
      * Find Next Higher Power Of Two
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D NextHigherPowerOfTwo...
     D                 PR            10U 0 EXTPROC('qoo_nextHigherPowerOfTwo')
     D  Value                        10U 0 VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * Supplemental Hash Function
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapSuplHash...
     D                 PR            10I 0 EXTPROC('qoo_hash')
     D  Hash                         10I 0 VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * Calculate Index For Hash
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapIndexFor...
     D                 PR            10I 0 EXTPROC('qoo_indexFor')
     D  Hash                         10I 0 VALUE
     D  Length                       10I 0 VALUE
      * 
      * 
      * ============================================================================================
      * ============================================================================================
      * 
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Signature
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapEntrySignature...
     D                 PR            16A
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapEntrySignatureCheck...
     D                 PR              *
     D  @ZHashMapEnt                   *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Create
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapEntryCrt...
     D                 PR              *
     D  Hash                         10I 0 CONST
     D  @Key                           *   CONST
     D  @Value                         *   CONST
     D  @Next                          *   CONST
     D  @ProcPreDlt                    *   PROCPTR CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Delete
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapEntryDlt...
     D                 PR              *
     D  @ZHashMapEnt                   *
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Get Key
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapEntryGetKey...
     D                 PR              *
     D  @ZHashMapEnt                   *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Get Value
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapEntryGetValue...
     D                 PR              *
     D  @ZHashMapEnt                   *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Pre-Delete Default
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapEntryPreDlt...
     D                 PR
     D  @ZHashMapEnt                   *   CONST
      * 
      * 
      * ============================================================================================
      * ============================================================================================
      * 
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Hash
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapHash...
     D                 PR            10I 0
     D  @HashMap                       *   CONST
     D  @Thing                         *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Initialisation
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMap_Inz...
     D                 PR
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Signature
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapSignature...
     D                 PR            16A
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapSignatureCheck...
     D                 PR              *
     D  @ZHashMap                      *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Create
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapCrt...
     D                 PR              *
     D oCapacity                     10U 0 CONST OPTIONS(*NOPASS)
     D oLoadFactor                    4F   CONST OPTIONS(*NOPASS)
     D o@ProcHash                      *   PROCPTR CONST OPTIONS(*NOPASS)
     D o@ProcCompare                   *   PROCPTR CONST OPTIONS(*NOPASS)
     D o@ProcPreDlt                    *   PROCPTR CONST OPTIONS(*NOPASS)
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Delete
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapDlt...
     D                 PR              *
     D  @ZHashMap                      *
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Clear
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapClr...
     D                 PR
     D  @ZHashMap                      *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Contains Key
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapContainsKey...
     D                 PR              N
     D  @ZHashMap                      *   CONST
     D  @Key                           *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Contains Value
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapContainsValue...
     D                 PR              N
     D  @ZHashMap                      *   CONST
     D  @Value                         *   CONST
     D  @ProcCompare                   *   PROCPTR CONST OPTIONS(*NOPASS)
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Get
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapGet...
     D                 PR              *
     D  @ZHashMap                      *   CONST
     D  @Key                           *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Is Empty
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapIsEmpty...
     D                 PR              N
     D  @ZHashMap                      *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Get Modification Count
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapModCount...
     D                 PR            10I 0
     D  @this                          *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Put
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapPut...
     D                 PR              *
     D  @ZHashMap                      *   CONST
     D  @Key                           *   CONST
     D  @Value                         *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Put Entry
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapPutEntry...
     D                 PR
     D  @ZHashMap                      *   CONST
     D  hash                         10I 0 CONST
     D  @Key                           *   CONST
     D  @Value                         *   CONST
     D  index                        10I 0 CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Resize
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapResize...
     D                 PR
     D  @ZHashMap                      *   CONST
     D  NewCapacity                  10I 0 CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Remove (and delete) entry
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapRemove...
     D                 PR
     D  @ZHashMap                      *   CONST
     D  @Key                           *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Remove (and return) entry for key
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapRemoveEntryForKey...
     D                 PR              *
     D  @ZHashMap                      *   CONST
     D  @Key                           *   VALUE
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Size
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapSize...
     D                 PR            10I 0
     D  @ZHashMap                      *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Transfer
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapTransfer...
     D                 PR
     D  @ZHashMap                      *   CONST
     D  @NewTable                      *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Visit
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapVisit...
     D                 PR
     D  @ZHashMap                      *   CONST
     D  @Visit                         *   PROCPTR CONST
      * 
      * 
      * ============================================================================================
      * ============================================================================================
      * 
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Initialisation
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashIterator_Inz...
     D                 PR
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Signature
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashIteratorSignature...
     D                 PR            16A
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashIteratorSignatureCheck...
     D                 PR              *
     D  @this                          *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Create
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashIteratorCrt...
     D                 PR              *
     D  @Subject                       *   CONST
     D  @ProcNext                      *   PROCPTR CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Delete
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashIteratorDlt...
     D                 PR              *
     D  @this                          *
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Has Next
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashIteratorHasNext...
     D                 PR              N
     D  @this                          *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Next
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashIteratorNext...
     D                 PR              *
     D  @this                          *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Remove
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashIteratorRemove...
     D                 PR
     D  @this                          *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Next Entry
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashIteratorNextEntry...
     D                 PR              *
     D  @this                          *   CONST
      * 
      * 
      * --------------------------------------------------------------------------------------------
      * KeyIterator: Next
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D KeyIteratorNext...
     D                 PR              *
     D  @this                          *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ValueIterator: Next
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ValueIteratorNext...
     D                 PR              *
     D  @this                          *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Entry Iterator
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapEntryIterator...
     D                 PR              *
     D  @Subject                       *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Key Iterator
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapKeyIterator...
     D                 PR              *
     D  @Subject                       *   CONST
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Value Iterator
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D ZHashMapValueIterator...
     D                 PR              *
     D  @Subject                       *   CONST
      * 
      * ============================================================================================
      * ============================================================================================
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Signature
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapEntrySignature...
     P                 B
     D                 PI            16A
      * 
     D Signature       S             16A   STATIC INZ
      * 
      /free

         // Exit if already generated
            IF (Signature <> *BLANKS) ;
               RETURN Signature ;
            ENDIF ;

         // Generate new signature
            Signature= QSignatureGen() ;

         // Finished
            RETURN Signature ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapEntrySignatureCheck...
     P                 B                   EXPORT
     D                 PI              *
     D  @                              *   CONST
      * 
      /free

         // Watch for errors
            MONITOR ;

            // Return the value or fail in the attempt
               RETURN QSignatureCheck(@:
                 ZHashMapEntrySignature:'ZHashMapEntry') ;

         // Percolate the error
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMapEntry: Create
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapEntryCrt...
     P                 B
     D                 PI              *
     D  Hash                         10I 0 CONST
     D  @Key                           *   CONST
     D  @Value                         *   CONST
     D  @Next                          *   CONST
     D  @ProcPreDlt                    *   PROCPTR CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMapEntry_) BASED(@this)
      * 
      /free

         // Initialise
            @this= QAlloc(%Size(this)) ;

            this.Signature= ZHashMapEntrySignature ;
            this.Hash= Hash ;
            this.@Key= @Key ;
            this.@Value= @Value ;
            this.@Next= @Next ;
            this.@ProcPreDlt= @ProcPreDlt ;

         // Finished
            RETURN @this ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashEntry: Delete
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapEntryDlt...
     P                 B
     D                 PI              *
     D  @                              *
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMapEntry_) BASED(@this)
      * 
     D PreDlt          PR                  EXTPROC(this.@ProcPreDlt)
     D  @                              *   CONST
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapEntrySignatureCheck(@) ;

         // Run Pre-Delete
            PreDlt(@this) ;

         // Trash the component
            QMemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         // Finished
            RETURN @ ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashEntry: Get Key
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapEntryGetKey...
     P                 B                   EXPORT
     D                 PI              *
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMapEntry_) BASED(@this)
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapEntrySignatureCheck(@) ;

         // Finished
            RETURN this.@Key ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashEntry: Get Value
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapEntryGetValue...
     P                 B                   EXPORT
     D                 PI              *
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMapEntry_) BASED(@this)
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapEntrySignatureCheck(@) ;

         // Finished
            RETURN this.@Value ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashEntry: Pre-Delete Default
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapEntryPreDlt...
     P                 B                   EXPORT
     D                 PI
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMapEntry_) BASED(@this)
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapEntrySignatureCheck(@) ;

         // Decide what to do
            SELECT ;

         // Both null
            WHEN (this.@Key = null) AND (this.@Value = null) ;

         // null value
            WHEN (this.@Key <> null) AND (this.@Value = null) ;
               ZCollectableDlt(this.@Key) ;

         // null key
            WHEN (this.@Key = null) AND (this.@Value <> null) ;
               ZCollectableDlt(this.@Value) ;

         // Single component
            WHEN (this.@Key = this.@Value) ;
               this.@Value= ZCollectableDlt(this.@Key) ;

         // Two seperate components
            OTHER ;
               ZCollectableDlt(this.@Key) ;
               ZCollectableDlt(this.@Value) ;
            ENDSL ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Initialisation
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMap_Inz...
     P                 B
     D                 PI
      * 
      /free

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Signature
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapSignature...
     P                 B                   EXPORT
     D                 PI            16A
      * 
     D Signature       S             16A   STATIC INZ
      * 
      /free

         // Exit if already generated
            IF (Signature <> *BLANKS) ;
               RETURN Signature ;
            ENDIF ;

         // Generate new signature
            Signature= QSignatureGen() ;

         // Initialise
            ZHashMap_Inz() ;

         // Finished
            RETURN Signature ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapSignatureCheck...
     P                 B                   EXPORT
     D                 PI              *
     D  @                              *   CONST
      * 
      /free

         // Watch for errors
            MONITOR ;

            // Return the value or fail in the attempt
               RETURN QSignatureCheck(@:
                 ZHashMapSignature:'ZHashMap') ;

         // Percolate the error
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Create
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapCrt...
     P                 B                   EXPORT
     D                 PI              *
     D oCapacity                     10U 0 CONST OPTIONS(*NOPASS)
     D oLoadFactor                    4F   CONST OPTIONS(*NOPASS)
     D o@ProcHash                      *   PROCPTR CONST OPTIONS(*NOPASS)
     D o@ProcCompare                   *   PROCPTR CONST OPTIONS(*NOPASS)
     D o@ProcPreDlt                    *   PROCPTR CONST OPTIONS(*NOPASS)
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D Capacity        S             10U 0 INZ(ZHASHMAP_DFTCAP)
     D LoadFactor      S              4F   INZ(ZHASHMAP_DFTFCT)
     D @ProcHash       S               *   PROCPTR INZ(%pAddr(
     D                                     ZCollectableHashCode))
     D @ProcCompare    S               *   PROCPTR INZ(%pAddr(
     D                                     ZCollectableCompareTo))
     D @ProcPreDlt     S               *   PROCPTR INZ(%pAddr(
     D                                     ZHashMapEntryPreDlt))
      * 
      /free

         // Optional Initial Capacity
            IF (%Parms() >= 1) AND (oCapacity > Capacity) ;
               Capacity= oCapacity ;
            ENDIF ;

         // Optional Loadfactor
            IF (%Parms() >= 2) ;
               LoadFactor= oLoadFactor ;
            ENDIF ;

         // Optional HashCode function
            IF (%Parms() >= 3) ;
               @ProcHash= o@ProcHash ;
            ENDIF ;

         // Optional CompareTo function
            IF (%Parms() >= 4) ;
               @ProcCompare= o@ProcCompare ;
            ENDIF ;

         // Optional PreDlt function
            IF (%Parms() >= 5) ;
               @ProcPreDlt= o@ProcPreDlt ;
            ENDIF ;

         // Stay within limits
            IF (Capacity > ZHASHMAP_MAXCAP) ;
               Capacity= ZHASHMAP_MAXCAP ;
            ENDIF ;

         // Stay within limits
            IF (LoadFactor <= 0) ;
               LoadFactor= ZHASHMAP_DFTFCT ;
            ENDIF ;

         // Must be a power of two
            Capacity= NextHigherPowerOfTwo(Capacity) ;

         // Allocate storage
            @this= QAlloc(%Size(this)) ;
            this.Signature= ZHashMapSignature ;

         // Initialise
            this.Size= 0 ;
            this.LoadFactor= LoadFactor ;
            this.Threshold= %Int(Capacity*LoadFactor) ;
            this.@Table= ZArrayCrt(Capacity) ;
            this.@ProcHash= @ProcHash ;
            this.@ProcCompare= @ProcCompare ;
            this.@ProcPreDlt= @ProcPreDlt ;

         // Finished
            RETURN @this ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Delete
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapDlt...
     P                 B                   EXPORT
     D                 PI              *
     D  @                              *
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Clear all entries
            ZHashMapClr(@this) ;

         // Delete the main table
            ZArrayDlt(this.@Table) ;

         // Trash the component
            QMemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         // Finished
            RETURN @ ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Clear
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapClr...
     P                 B                   EXPORT
     D                 PI
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D j               S             10I 0
     D Size            S             10I 0
     D @Entry          S               *
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Delete all entries
            ZHashMapVisit(@this:%pAddr(ZHashMapEntryDlt)) ;

         // Reset size
            this.Size= 0 ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Contains Key
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapContainsKey...
     P                 B                   EXPORT
     D                 PI              N
     D  @                              *   CONST
     D  @Key                           *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D #CompareTo      PR            10I 0 EXTPROC(this.@ProcCompare)
     D  @Key1                          *   CONST
     D  @Key2                          *   CONST
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
     D hash            S             10I 0
     D i               S             10I 0
     D j               S             10I 0
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Deal with null keys seperately
            IF (@Key = null) ;
               EXSR GetForNullKey ;
            ENDIF ;

         // Find hash of key
            hash= ZHashMapSuplHash(ZHashMapHash(@this:@Key)) ;

         // Index for hash
            i= ZHashMapIndexFor(hash:ZArraySize(this.@Table)) ;

         // Find entry
            @Entry= ZArrayGet(this.@Table:i) ;

         // Check entry if it is not null
            DOW (@Entry <> null) ;

            // Check if this is the correct entry
               IF (Entry.Hash = hash) AND
                  ((Entry.@Key = @Key) OR
                   (#CompareTo(@Key:Entry.@Key)=0)) ;

               // Finished
                  RETURN true ;
               ENDIF ;

            // Move to next entry and loop
               @Entry= Entry.@Next ;
            ENDDO ;

         // Finished
            RETURN false ;

         // ----------------------------------------------------------------------------------------
         // Get For Null Key
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR GetForNullKey ;

         // Null is at index 0
            @Entry= ZArrayGet(this.@Table:0) ;

         // Check entry if it is not null
            DOW (@Entry <> null) ;

            // Exit if this is the correct entry
               IF (Entry.@Key = null) ;

               // Finished
                  RETURN true ;
               ENDIF ;

            // Move to next entry and loop
               @Entry= Entry.@Next ;
            ENDDO ;

         // Finished
            RETURN false ;
            ENDSR ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Entry Iterator
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapEntryIterator...
     P                 B                   EXPORT
     D                 PI              *
     D  @Subject                       *   CONST
      * 
      /free

         // Finished
            RETURN ZHashIteratorCrt(@Subject:
              %pAddr(ZHashIteratorNextEntry)) ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Get
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapGet...
     P                 B                   EXPORT
     D                 PI              *
     D  @                              *   CONST
     D  @Key                           *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D #CompareTo      PR            10I 0 EXTPROC(this.@ProcCompare)
     D  @Key1                          *   CONST
     D  @Key2                          *   CONST
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
     D hash            S             10I 0
     D i               S             10I 0
     D j               S             10I 0
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Deal with null keys seperately
            IF (@Key = null) ;
               EXSR GetForNullKey ;
            ENDIF ;

         // Find hash of key
            hash= ZHashMapSuplHash(ZHashMapHash(@this:@Key)) ;

         // Index for hash
            i= ZHashMapIndexFor(hash:ZArraySize(this.@Table)) ;

         // Find entry
            @Entry= ZArrayGet(this.@Table:i) ;

         // Check entry if it is not null
            DOW (@Entry <> null) ;

            // Check if this is the correct entry
               IF (Entry.Hash = hash) AND
                  ((Entry.@Key = @Key) OR
                   (#CompareTo(@Key:Entry.@Key)=0)) ;

               // Finished
                  RETURN Entry.@Value ;
               ENDIF ;

            // Move to next entry and loop
               @Entry= Entry.@Next ;
            ENDDO ;

         // Finished
            RETURN null ;

         // ----------------------------------------------------------------------------------------
         // Get For Null Key
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR GetForNullKey ;

         // Null is at index 0
            @Entry= ZArrayGet(this.@Table:0) ;

         // Check entry if it is not null
            DOW (@Entry <> null) ;

            // Exit if this is the correct entry
               IF (Entry.@Key = null) ;

               // Finished
                  RETURN Entry.@Value ;
               ENDIF ;

            // Move to next entry and loop
               @Entry= Entry.@Next ;
            ENDDO ;

         // Finished
            RETURN null ;
            ENDSR ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Contains Value
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapContainsValue...
     P                 B                   EXPORT
     D                 PI              N
     D  @                              *   CONST
     D  @Value                         *   CONST
     D o@ProcCompare                   *   PROCPTR CONST OPTIONS(*NOPASS)
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
      * 
     D @ProcCompare    S               *   PROCPTR INZ(%pAddr(
     D                                     ZCollectableCompareTo))
      * 
     D #CompareTo      PR            10I 0 EXTPROC(@ProcCompare)
     D  @Value                         *   CONST
     D  @Value                         *   CONST
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
     D j               S             10I 0
     D Size            S             10I 0
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Pick up optional parameter
            IF (%Parms() >= 3) ;
               @ProcCompare= o@ProcCompare ;
            ENDIF ;

         // Deal with null keys seperately
            IF (@Value = null) ;
               EXSR ContainsNullValue ;
            ENDIF ;

         // Process all table entries
            Size= ZArraySize(this.@Table) ;
            FOR j= 0 TO Size-1 ;

            // Fetch entry
               @Entry= ZArrayGet(this.@Table:j) ;
               DOW (@Entry <> null) ;

                   IF (#CompareTo(@Value:Entry.@Value)=0) ;
                      RETURN true ;
                   ENDIF ;

               // Point at next entry
                  @Entry= Entry.@Next ;

            // Loop
               ENDDO ;

         // Loop
            ENDFOR ;

         // Finished
            RETURN false ;

         // ----------------------------------------------------------------------------------------
         // Contains Null Value
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR ContainsNullValue ;

         // Process all table entries
            Size= ZArraySize(this.@Table) ;
            FOR j= 0 TO Size-1 ;

            // Fetch entry
               @Entry= ZArrayGet(this.@Table:j) ;
               DOW (@Entry <> null) ;

                   IF (Entry.@Value = null) ;
                      RETURN true ;
                   ENDIF ;

               // Point at next entry
                  @Entry= Entry.@Next ;

            // Loop
               ENDDO ;

         // Loop
            ENDFOR ;

         // Finished
            RETURN false ;
            ENDSR ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Hash
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapHash...
     P                 B                   EXPORT
     D                 PI            10I 0
     D  @                              *   CONST
     D  @Thing                         *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D #Hash           PR            10I 0 EXTPROC(this.@ProcHash)
     D  @Thing                         *   CONST
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Return zero for null pointers
            IF (@Thing = null) ;
               RETURN 0 ;
            ENDIF ;

         // Finished
            RETURN #Hash(@Thing) ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Is Empty
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapIsEmpty...
     P                 B                   EXPORT
     D                 PI              N
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Finished
            RETURN (this.Size = 0) ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Key Iterator
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapKeyIterator...
     P                 B                   EXPORT
     D                 PI              *
     D  @Subject                       *   CONST
      * 
      /free

         // Finished
            RETURN ZHashIteratorCrt(@Subject:
              %pAddr(KeyIteratorNext)) ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Get Modification Count
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapModCount...
     P                 B
     D                 PI            10I 0
     D  @                              *   CONST
      * 
      * Work fields
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D @QArray         S               *
     D QArray          DS                  LIKEDS(QArray_) BASED(@QArray)
      * 
      /free

         // Pick up the component
            @this= ZHashMapSignatureCheck(@) ;

         // Get public fields
            ZArrayGetFields(this.@Table:@QArray) ;

         // Finished
            RETURN QArray.ModCount ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Put
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapPut...
     P                 B                   EXPORT
     D                 PI              *
     D  @                              *   CONST
     D  @Key                           *   CONST
     D  @Value                         *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D #CompareTo      PR            10I 0 EXTPROC(this.@ProcCompare)
     D  @Key1                          *   CONST
     D  @Key2                          *   CONST
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
     D hash            S             10I 0
     D i               S             10I 0
     D j               S             10I 0
     D @OldValue       S               *
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Deal with null keys seperately
            IF (@Key = null) ;
               EXSR PutForNullKey ;
            ENDIF ;

         // Find hash of key
            hash= ZHashMapSuplHash(ZHashMapHash(@this:@Key)) ;

         // Index for hash
            i= ZHashMapIndexFor(hash:ZArraySize(this.@Table)) ;

         // Find entry
            @Entry= ZArrayGet(this.@Table:i) ;

         // Check entry if it is not null
            DOW (@Entry <> null) ;

            // Check if this is the correct entry
               IF (Entry.Hash = hash) AND
                  ((Entry.@Key = @Key) OR
                   (#CompareTo(@Key:Entry.@Key)=0)) ;

               // Pick up old value
                  @OldValue= Entry.@Value ;

               // Copy in new value
                  Entry.@Value= @Value ;

               // Finished
                  RETURN @OldValue ;
               ENDIF ;

            // Move to next entry and loop
               @Entry= Entry.@Next ;
            ENDDO ;

            ZHashMapPutEntry(@this:hash:@Key:@Value:i) ;

         // Finished
            RETURN null ;

         // ----------------------------------------------------------------------------------------
         // Put For Null Key
         // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR PutForNullKey ;

         // Null is at index 0
            @Entry= ZArrayGet(this.@Table:0) ;

         // Check entry if it is not null
            DOW (@Entry <> null) ;

            // Exit if this is the correct entry
               IF (Entry.@Key = null) ;

               // This is now the 'old' value
                  @OldValue= Entry.@Value ;

               // Copy in new value
                  Entry.@Value= @Value ;

               // Finished
                  RETURN @OldValue ;
               ENDIF ;

            // Move to next entry and loop
               @Entry= Entry.@Next ;
            ENDDO ;

         // Add new entry
            ZHashMapPutEntry(@this:0:null:@Value:0) ;

         // Finished
            RETURN null ;
            ENDSR ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Put Entry
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapPutEntry...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  hash                         10I 0 CONST
     D  @Key                           *   CONST
     D  @Value                         *   CONST
     D  index                        10I 0 CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D @Entry          S               *
     D @NewEntry       S               *
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Fetch current entry
            @Entry= ZArrayGet(this.@Table:index) ;

         // Construct a new entry
            @NewEntry=
              ZHashMapEntryCrt(hash:@Key:@Value:@Entry:this.@ProcPreDlt) ;

         // Replace old entry with new one
            ZArrayPut(this.@Table:index:@NewEntry) ;

         // Increase size
            this.Size+= 1 ;

         // Resize if required
            IF (this.Size >= this.Threshold) ;
               ZHashMapResize(@this:2*ZArraySize(this.@Table)) ;
            ENDIF ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Resize
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapResize...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  NewCapacity                  10I 0 CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D @NewTable       S               *
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Exit if already at maximum capacity
            IF (ZArraySize(this.@Table) = ZHASHMAP_MAXCAP) ;
               this.Threshold= *HIVAL ;
               RETURN ;
            ENDIF ;

         // Create new table
            @NewTable= ZArrayCrt(NewCapacity) ;

         // Transfer entries into new table
            ZHashMapTransfer(@this:@NewTable) ;

         // Delete old table
            ZArrayDlt(this.@Table) ;

         // Replace with new table
            this.@Table= @NewTable ;

         // Calculate new threshold
            this.Threshold= %Int(NewCapacity*this.LoadFactor) ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Remove
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapRemove...
     P                 B                   EXPORT
     D                 PI
     D  @                              *   CONST
     D  @Key                           *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Remove entry
            @Entry= ZHashMapRemoveEntryForKey(@this:@Key) ;

         // Exit if null
            IF (@Entry = null) ;
               RETURN ;
            ENDIF ;

         // Trash entry
            ZHashMapEntryDlt(@Entry) ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Remove Entry For Key
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapRemoveEntryForKey...
     P                 B                   EXPORT
     D                 PI              *
     D  @                              *   CONST
     D  @Key                           *   VALUE
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D #CompareTo      PR            10I 0 EXTPROC(this.@ProcCompare)
     D  @Key1                          *   CONST
     D  @Key2                          *   CONST
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
     D @Prev           S               *
     D Prev            DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Prev)
      * 
     D hash            S             10I 0
     D i               S             10I 0
     D @Next           S               *
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Find hash of key
            hash= ZHashMapSuplHash(ZHashMapHash(@this:@Key)) ;

         // Index for hash
            i= ZHashMapIndexFor(hash:ZArraySize(this.@Table)) ;

         // Find entry
            @Prev= ZArrayGet(this.@Table:i) ;
            @Entry= @Prev ;

         // Check entry if it is not null
            DOW (@Entry <> null) ;

               @Next= Entry.@Next ;

            // Check if this is the correct entry
               IF (Entry.Hash = hash) AND
                  ((Entry.@Key = @Key) OR
                   (#CompareTo(@Key:Entry.@Key)=0)) ;

               // Reduce the number of entries by 1
                  this.Size-= 1 ;

               // If this was the first entry, swap it for the next
                  IF (@Prev = @Entry) ;
                     ZArrayPut(this.@Table:i:@Next) ;
                  ELSE ;
                     Prev.@Next= @Next ;
                  ENDIF ;

               // Finished
                  RETURN @Entry ;
               ENDIF ;

            // Move to next entry
               @Prev= @Entry ;
               @Entry= @Next ;

         // Loop
            ENDDO ;

         // Finished
            RETURN @Entry ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Size
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapSize...
     P                 B                   EXPORT
     D                 PI            10I 0
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Finished
            RETURN this.Size ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Transfer
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapTransfer...
     P                 B
     D                 PI
     D  @                              *   CONST
     D  @NewTable                      *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
     D @Src            S               *
     D SrcSize         S             10I 0
     D NewCapacity     S             10I 0
     D j               S             10I 0
     D i               S             10I 0
     D @Next           S               *
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Source table is the current table
            @Src= this.@Table ;

         // Get size of source table
            SrcSize= ZArraySize(@Src) ;

         // The new capacity is the size of the new table
            NewCapacity= ZArraySize(@NewTable) ;

         // Process all possible source table entries
            FOR j= 0 TO SrcSize-1 ;

            // Fetch source entry
               @Entry= ZArrayGet(@Src:j) ;

            // Ignore null entries
               DOW (@Entry <> null) ;

               // Remove reference in source table
                  ZArrayPut(@Src:j:null) ;

               // Keep hold of the next chained entry
                  @Next= Entry.@Next ;

               // Calculate new index based on new capacity
                  i= ZHashMapIndexFor(Entry.Hash:NewCapacity) ;

               // Chain to existing entry
                  Entry.@Next= ZArrayGet(@NewTable:i) ;

               // Put the entry into the new table
                  ZArrayPut(@NewTable:i:@Entry) ;

               // Move on to chained entry
                  @Entry= @Next ;

            // Loop
               ENDDO ;

         // Loop
            ENDFOR ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Value Iterator
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapValueIterator...
     P                 B                   EXPORT
     D                 PI              *
     D  @Subject                       *   CONST
      * 
      /free

         // Finished
            RETURN ZHashIteratorCrt(@Subject:
              %pAddr(ValueIteratorNext)) ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashMap: Visit
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashMapVisit...
     P                 B                   EXPORT
     D                 PI
     D  @                              *   CONST
     D  @Visit                         *   PROCPTR CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashMap_) BASED(@this)
      * 
     D Visit           PR              *   EXTPROC(@Visit)
     D  @                              *   CONST
      * 
     D j               S             10I 0
     D Size            S             10I 0
     D @Entry          S               *
      * 
      /free

         // Pick up object pointer
            @this= ZHashMapSignatureCheck(@) ;

         // Do not attempt if null address
            IF (@Visit = null) ;
               RETURN ;
            ENDIF ;

         // Fetch array size
            Size= ZArraySize(this.@Table) ;

         // Visit all elements
            FOR j= 0 TO Size-1 ;

            // Fetch element
               @Entry= ZArrayGet(this.@Table:j) ;

            // Process non-null entries
               IF (@Entry <> null) ;

               // Run visit
                  Visit(@Entry) ;

               ENDIF ;

         // Loop
            ENDFOR ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of Procedure
     P                 E
      * 
      * ============================================================================================
      * ============================================================================================
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Initialisation
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashIterator_Inz...
     P                 B
     D                 PI
      * 
     D Defn            DS                  QUALIFIED
     D  Signature                    16A
     D  @Dlt                           *   PROCPTR INZ(%pAddr(
     D                                     ZHashIteratorDlt))
     D  @Next                          *   PROCPTR INZ(%pAddr(
     D                                     ZHashIteratorNext))
     D  @HasNext                       *   PROCPTR INZ(%pAddr(
     D                                     ZHashIteratorHasNext))
     D  @Remove                        *   PROCPTR INZ(%pAddr(
     D                                     ZHashIteratorRemove))
      * 
      /free

         // Implementation definition
            Defn.Signature= ZHashIteratorSignature ;

         // Copy to implementation definition
            EVAL-CORR #ZIteratorInterface= Defn ;

         // Implement the interface
            implementsZIterator(
              %Addr(#ZIteratorInterface):
              %Size(#ZIteratorInterface)) ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Signature
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashIteratorSignature...
     P                 B
     D                 PI            16A
      * 
     D Signature       S             16A   STATIC INZ
      * 
      /free

         // Exit if already generated
            IF (Signature <> *BLANKS) ;
               RETURN Signature ;
            ENDIF ;

         // Generate new signature
            Signature= QSignatureGen() ;

         // Initialisation
            ZHashIterator_Inz() ;

         // Finished
            RETURN Signature ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Signature Check
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashIteratorSignatureCheck...
     P                 B                   EXPORT
     D                 PI              *
     D  @                              *   CONST
      * 
      /free

         // Watch for errors
            MONITOR ;

            // Return the value or fail in the attempt
               RETURN QSignatureCheck(@:
                 ZHashIteratorSignature:'ZHashIterator') ;

         // Percolate the error
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Create
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashIteratorCrt...
     P                 B
     D                 PI              *
     D  @                              *   CONST
     D  @ProcNext                      *   PROCPTR CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashIterator_)
     D                                     BASED(@this)
      * 
     D @Subject        S               *
     D Subject         DS                  LIKEDS(ZHashMap_)
     D                                     BASED(@Subject)
      * 
     D Count           S             10I 0
      * 
      /free

         // Form a new instance of this class
            @this= QAlloc(%Size(this)) ;

         // Must be a HashMap
            @Subject= ZHashMapSignatureCheck(@) ;
            this.Signature= ZHashIteratorSignature ;

         // Initialise
            this.@Subject= @Subject ;
            this.@Next= null ;
            this.@Current= null ;
            this.@ProcNext= @ProcNext ;
            this.Index= 0 ;
            this.ModCount= ZHashMapModCount(@Subject) ;

         // Advance to first entry
            IF (Subject.Size > 0) ;
               Count= ZArraySize(Subject.@Table) ;
               DOW (this.Index < Count) ;
                  this.@Next= ZArrayGet(Subject.@Table:this.Index) ;
                  this.Index+= 1 ;
                  IF (this.@Next <> null) ;
                     LEAVE ;
                  ENDIF ;
               ENDDO ;
            ENDIF ;

         // Finished
            RETURN @this ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Dlt
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashIteratorDlt...
     P                 B
     D                 PI              *
     D  @                              *
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashIterator_)
     D                                     BASED(@this)
      * 
      /free

         // Must be correct type
            @this= ZHashIteratorSignatureCheck(@) ;

         // Trash component
            QMemSet(@this:x'FF':%Size(this)) ;

         // Deallocate the component memory
            DEALLOC(N) @ ;

         // Finished
            RETURN @ ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: HasNext
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashIteratorHasNext...
     P                 B
     D                 PI              N
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashIterator_)
     D                                     BASED(@this)
      * 
      /free

         // Must be correct type
            @this= ZHashIteratorSignatureCheck(@) ;

         // Finished
            RETURN (this.@Next <> null) ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Next
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashIteratorNext...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashIterator_)
     D                                     BASED(@this)
      * 
     D #ProcNext       PR              *   EXTPROC(this.@ProcNext)
     D  @                              *   CONST
      * 
      /free

         // Must be correct type
            @this= ZHashIteratorSignatureCheck(@) ;

         // Finished
            RETURN #ProcNext(@) ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Remove
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashIteratorRemove...
     P                 B
     D                 PI
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashIterator_)
     D                                     BASED(@this)
      * 
     D Subject         DS                  LIKEDS(ZHashMap_)
     D                                     BASED(this.@Subject)
      * 
     D Current         DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(this.@Current)
      * 
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      * 
     D DLL0011         DS                  QUALIFIED
     D  Name                        126A
      * 
     D @Entry          S               *
     D @Key            S               *
      * 
      /free

         // Must be correct type
            @this= ZHashIteratorSignatureCheck(@) ;

         // No current entry
            IF (this.@Current = null) ;
               DLL0011.Name= 'ZHashMap' ;
               Throw(DLL0011:'DLL0011':'DLLMSGF') ;
            ENDIF ;

         // Check for concurrent modification
            IF (this.ModCount <> ZHashMapModCount(this.@Subject)) ;
               DLL0010.Name= 'ZArray' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         // Prepare to delete current entry
            @Key= Current.@Key ;
            Current.@Key= null ;

         // Remove entry
            @Entry= ZHashMapRemoveEntryForKey(this.@Subject:@Key) ;

         // Trash entry
            ZHashMapEntryDlt(@Entry) ;

         // Keep modification count up to date
            this.ModCount= ZHashMapModCount(this.@Subject) ;

         // Finished
            RETURN ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ZHashIterator: Next Entry
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ZHashIteratorNextEntry...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      * 
     D @this           S               *
     D this            DS                  LIKEDS(ZHashIterator_)
     D                                     BASED(@this)
      * 
     D Subject         DS                  LIKEDS(ZHashMap_)
     D                                     BASED(this.@Subject)
      * 
     D DLL0010         DS                  QUALIFIED
     D  Name                        126A
      * 
     D DLL0023         DS                  QUALIFIED
     D  Name                        126A
     D  Operation                   126A
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
     D Count           S             10I 0
      * 
      /free

         // Pick up object
            @this= ZHashIteratorSignatureCheck(@) ;

         // Check for concurrent modification
            IF (this.ModCount <> ZHashMapModCount(this.@Subject)) ;
               DLL0010.Name= 'ZHashMap' ;
               Throw(DLL0010:'DLL0010':'DLLMSGF') ;
            ENDIF ;

         // Pick up entry
            @Entry= this.@Next ;

         // No such element
            IF (@Entry = null) ;
               DLL0023.Name= 'ZHashMap' ;
               DLL0023.Operation= 'Next' ;
               Throw(DLL0023:'DLL0023':'DLLMSGF') ;
            ENDIF ;

         // Set next entry
            this.@Next= Entry.@Next ;

         // Advance to next 'real' entry
            IF (this.@Next = null) ;
               Count= ZArraySize(Subject.@Table) ;
               DOW (this.Index < Count) ;
                  this.@Next= ZArrayGet(Subject.@Table:this.Index) ;
                  this.Index+= 1 ;
                  IF (this.@Next <> null) ;
                     LEAVE ;
                  ENDIF ;
               ENDDO ;
            ENDIF ;

         // Set current
            this.@Current= @Entry ;

         // Finished
            RETURN @Entry ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * KeyIterator: Next
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P KeyIteratorNext...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
      /free

         // Fetch next entry
            @Entry= ZHashIteratorNextEntry(@) ;

         // Finished
            RETURN Entry.@Key ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
      * --------------------------------------------------------------------------------------------
      * ValueIterator: Next
      * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P ValueIteratorNext...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      * 
     D @Entry          S               *
     D Entry           DS                  LIKEDS(ZHashMapEntry_)
     D                                     BASED(@Entry)
      * 
      /free

         // Fetch next entry
            @Entry= ZHashIteratorNextEntry(@) ;

         // Finished
            RETURN Entry.@Value ;

      /end-free
      * 
      * End of procedure
     P                 E
      * 
