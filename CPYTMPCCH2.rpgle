      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTmpCch: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TmpCchDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@this)
      *À
      /free

         //ÀPick up parameter
            @this= @ ;

         //ÀTrash internals
            Utility_MemSet(this.@Data:x'FF':this.Size) ;
            DEALLOC(N) this.@Data ;

         //ÀTrash the object itself
            Utility_MemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         //ÀFinished
            RETURN @ ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Compare Entries
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TmpCchCompare...
     P                 B
     D                 PI            10I 0
     D p@A                             *   CONST
     D p@B                             *   CONST
      *À
     D @A              S               *
     D A               DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@A)
      *À
     D @B              S               *
     D B               DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@B)
      *À
      /free

            @A= p@A ;
            @B= p@B ;

         //ÀDecide what to do
            SELECT ;

         //ÀLess than
            WHEN (A.Hash < B.Hash) ;
               RETURN -1 ;

         //ÀGreater than
            WHEN (A.Hash > B.Hash) ;
               RETURN +1 ;

            ENDSL ;

         //ÀFinished
            RETURN 0 ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀFinished
            RETURN Utility_SignatureCheck(@:
                     TemplateCacheSignature:'TemplateCache') ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Create
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheCrt...
     P                 B
     D                 PI              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *À
      /free

         //ÀAllocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= TemplateCacheSignature ;

         //ÀInitialise
            this.@Cache= ZIndexCrt(%pAddr(TmpCchCompare)) ;

         //ÀFinished
            RETURN @this ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *À
      /free

         //ÀPick up object
            @this= TemplateCacheSignatureCheck(@) ;

         //ÀTrash internals
            ZIndexClr(this.@Cache:%pAddr(TmpCchDlt)) ;
            ZIndexDlt(this.@Cache) ;

         //ÀTrash the object itself
            Utility_MemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         //ÀFinished
            RETURN @ ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Has
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheHas...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D p@Header                        *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *À
     D @Header         S               *
     D Header          DS                  LIKEDS(TemplateHeader_)
     D                                     BASED(@Header)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(TmpCchEntry_)
      *À
      /free

         //ÀPick up object
            @this= TemplateCacheSignatureCheck(@) ;
            @Header= p@Header ;

         //ÀMust be a template
            Utility_TemplateName(@Header) ;

         //ÀHash the template
            Search.Hash= Utility_MD5Hash(@Header:Header.Size) ;

         //ÀFinished
            RETURN ZIndexHas(this.@Cache:@Search) ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D p@Header                        *   CONST
     D  Hash                         16A   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *À
     D @Header         S               *
     D Header          DS                  LIKEDS(TemplateHeader_)
     D                                     BASED(@Header)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(TmpCchEntry_)
      *À
     D @TmpCch         S               *
     D TmpCch          DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@TmpCch)
      *À
      /free

         //ÀPick up object
            @this= TemplateCacheSignatureCheck(@) ;
            @Header= p@Header ;

         //ÀMust be a template
            Utility_TemplateName(@Header) ;

         //ÀSearch for existing template
            Search.Hash= Hash ;

         //ÀExit if already cached
            IF (ZIndexHas(this.@Cache:@Search) = true) ;
               RETURN ;
            ENDIF ;

         //ÀBuild new entry
            @TmpCch= %Alloc(%Size(TmpCch)) ;
            TmpCch.Hash= Hash ;
            TmpCch.@Data= %Alloc(Header.Size) ;
            TmpCch.Size= Header.Size ;
            Utility_MemCpy(TmpCch.@Data:@Header:Header.Size) ;

         //ÀAdd entry to cache
            ZIndexAdd(this.@Cache:@TmpCch) ;

         //ÀFinished
            RETURN ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Rtv
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheRtv...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D p@Header                        *   CONST
      *À
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *À
     D @Header         S               *
     D Header          DS                  LIKEDS(TemplateHeader_)
     D                                     BASED(@Header)
      *À
     D @Entry          S               *
     D Entry           DS                  LIKEDS(TemplateEntry_)
     D                                     BASED(@Entry)
      *À
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(TmpCchEntry_)
      *À
     D @TmpCch         S               *
     D TmpCch          DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@TmpCch)
      *À
     D j               S             10I 0
     D EntryCount      S             10I 0
      *À
     D @DataEntry      S               *
     D DataEntry       DS                  LIKEDS(TemplateEntry_)
     D                                     BASED(@DataEntry)
      *À
      /free

         //ÀPick up object
            @this= TemplateCacheSignatureCheck(@) ;

         //ÀPick up address
            @Header= p@Header ;

         //ÀMust be a template
            Utility_TemplateName(@Header) ;

         //ÀHash the template
            Search.Hash= Utility_MD5Hash(@Header:Header.Size) ;

         //ÀExit if not cached
            @TmpCch= ZIndexRtv(this.@Cache:@Search) ;
            IF (@TmpCch = null) ;
               RETURN false ;
            ENDIF ;

         //ÀFailed
            IF (TmpCch.Size <> Header.Size) ;
               Throw('Template Cache Size Mismatch') ;
            ENDIF ;

         //ÀParanoid!
         // EXSR Paranoid ;

         //ÀCopy existing entry
            Utility_MemCpy(@Header:TmpCch.@Data:TmpCch.Size) ;

         //ÀFinished
            RETURN true ;

         //À----------------------------------------------------------------------------------------
         //ÀParanoid!
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Paranoid ;

         //ÀConvert size to an entry count
            EntryCount= (Header.Size-%Size(Header))/%Size(Entry) ;

         //ÀPoint at first entries
            @Entry= @Header+%Size(Header) ;
            @DataEntry= TmpCch.@Data+%Size(Header) ;

         //ÀProcess all entries
            FOR j= 1 TO EntryCount ;

               IF (Entry.Name <> DataEntry.Name) ;
                  Throw('Template Cache Name Mismatch') ;
               ENDIF ;

            //ÀPoint at next entries
               @Entry+= %Size(Entry) ;
               @DataEntry+= %Size(DataEntry) ;

         //ÀLoop
            ENDFOR ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
