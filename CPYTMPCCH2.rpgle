      *�
      *�--------------------------------------------------------------------------------------------
      *�TmpCch: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TmpCchDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
     D @this           S               *
     D this            DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@this)
      *�
      /free

         //�Pick up parameter
            @this= @ ;

         //�Trash internals
            Utility_MemSet(this.@Data:x'FF':this.Size) ;
            DEALLOC(N) this.@Data ;

         //�Trash the object itself
            Utility_MemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         //�Finished
            RETURN @ ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Compare Entries
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TmpCchCompare...
     P                 B
     D                 PI            10I 0
     D p@A                             *   CONST
     D p@B                             *   CONST
      *�
     D @A              S               *
     D A               DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@A)
      *�
     D @B              S               *
     D B               DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@B)
      *�
      /free

            @A= p@A ;
            @B= p@B ;

         //�Decide what to do
            SELECT ;

         //�Less than
            WHEN (A.Hash < B.Hash) ;
               RETURN -1 ;

         //�Greater than
            WHEN (A.Hash > B.Hash) ;
               RETURN +1 ;

            ENDSL ;

         //�Finished
            RETURN 0 ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheSignatureCheck...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Finished
            RETURN Utility_SignatureCheck(@:
                     TemplateCacheSignature:'TemplateCache') ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Create
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheCrt...
     P                 B
     D                 PI              *
      *�
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *�
      /free

         //�Allocate memory
            @this= %Alloc(%Size(this)) ;
            this.Signature= TemplateCacheSignature ;

         //�Initialise
            this.@Cache= ZIndexCrt(%pAddr(TmpCchCompare)) ;

         //�Finished
            RETURN @this ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *�
      /free

         //�Pick up object
            @this= TemplateCacheSignatureCheck(@) ;

         //�Trash internals
            ZIndexClr(this.@Cache:%pAddr(TmpCchDlt)) ;
            ZIndexDlt(this.@Cache) ;

         //�Trash the object itself
            Utility_MemSet(@this:x'FF':%Size(this)) ;
            DEALLOC(N) @ ;

         //�Finished
            RETURN @ ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Has
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheHas...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D p@Header                        *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *�
     D @Header         S               *
     D Header          DS                  LIKEDS(TemplateHeader_)
     D                                     BASED(@Header)
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(TmpCchEntry_)
      *�
      /free

         //�Pick up object
            @this= TemplateCacheSignatureCheck(@) ;
            @Header= p@Header ;

         //�Must be a template
            Utility_TemplateName(@Header) ;

         //�Hash the template
            Search.Hash= Utility_MD5Hash(@Header:Header.Size) ;

         //�Finished
            RETURN ZIndexHas(this.@Cache:@Search) ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Add
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheAdd...
     P                 B
     D                 PI
     D  @                              *   CONST
     D p@Header                        *   CONST
     D  Hash                         16A   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *�
     D @Header         S               *
     D Header          DS                  LIKEDS(TemplateHeader_)
     D                                     BASED(@Header)
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(TmpCchEntry_)
      *�
     D @TmpCch         S               *
     D TmpCch          DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@TmpCch)
      *�
      /free

         //�Pick up object
            @this= TemplateCacheSignatureCheck(@) ;
            @Header= p@Header ;

         //�Must be a template
            Utility_TemplateName(@Header) ;

         //�Search for existing template
            Search.Hash= Hash ;

         //�Exit if already cached
            IF (ZIndexHas(this.@Cache:@Search) = true) ;
               RETURN ;
            ENDIF ;

         //�Build new entry
            @TmpCch= %Alloc(%Size(TmpCch)) ;
            TmpCch.Hash= Hash ;
            TmpCch.@Data= %Alloc(Header.Size) ;
            TmpCch.Size= Header.Size ;
            Utility_MemCpy(TmpCch.@Data:@Header:Header.Size) ;

         //�Add entry to cache
            ZIndexAdd(this.@Cache:@TmpCch) ;

         //�Finished
            RETURN ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Rtv
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P TemplateCacheRtv...
     P                 B
     D                 PI              N
     D  @                              *   CONST
     D p@Header                        *   CONST
      *�
     D @this           S               *
     D this            DS                  LIKEDS(TemplateCache_)
     D                                     BASED(@this)
      *�
     D @Header         S               *
     D Header          DS                  LIKEDS(TemplateHeader_)
     D                                     BASED(@Header)
      *�
     D @Entry          S               *
     D Entry           DS                  LIKEDS(TemplateEntry_)
     D                                     BASED(@Entry)
      *�
     D @Search         S               *   INZ(%Addr(Search))
     D Search          DS                  LIKEDS(TmpCchEntry_)
      *�
     D @TmpCch         S               *
     D TmpCch          DS                  LIKEDS(TmpCchEntry_)
     D                                     BASED(@TmpCch)
      *�
     D j               S             10I 0
     D EntryCount      S             10I 0
      *�
     D @DataEntry      S               *
     D DataEntry       DS                  LIKEDS(TemplateEntry_)
     D                                     BASED(@DataEntry)
      *�
      /free

         //�Pick up object
            @this= TemplateCacheSignatureCheck(@) ;

         //�Pick up address
            @Header= p@Header ;

         //�Must be a template
            Utility_TemplateName(@Header) ;

         //�Hash the template
            Search.Hash= Utility_MD5Hash(@Header:Header.Size) ;

         //�Exit if not cached
            @TmpCch= ZIndexRtv(this.@Cache:@Search) ;
            IF (@TmpCch = null) ;
               RETURN false ;
            ENDIF ;

         //�Failed
            IF (TmpCch.Size <> Header.Size) ;
               Throw('Template Cache Size Mismatch') ;
            ENDIF ;

         //�Paranoid!
         // EXSR Paranoid ;

         //�Copy existing entry
            Utility_MemCpy(@Header:TmpCch.@Data:TmpCch.Size) ;

         //�Finished
            RETURN true ;

         //�----------------------------------------------------------------------------------------
         //�Paranoid!
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR Paranoid ;

         //�Convert size to an entry count
            EntryCount= (Header.Size-%Size(Header))/%Size(Entry) ;

         //�Point at first entries
            @Entry= @Header+%Size(Header) ;
            @DataEntry= TmpCch.@Data+%Size(Header) ;

         //�Process all entries
            FOR j= 1 TO EntryCount ;

               IF (Entry.Name <> DataEntry.Name) ;
                  Throw('Template Cache Name Mismatch') ;
               ENDIF ;

            //�Point at next entries
               @Entry+= %Size(Entry) ;
               @DataEntry+= %Size(DataEntry) ;

         //�Loop
            ENDFOR ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
