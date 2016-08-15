      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *ÀTemplate Cache Structure
     D TemplateCache_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  @Cache                         *
      *À
      *ÀTemplate Cache Entry Structure
     D TmpCchEntry_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Hash                         16A
     D  @Data                          *
     D  Size                         10I 0
     D                               12A
      *À
     D TemplateCacheSignature...
     D                 C                   x'-
     D                                     5CC65E73871022A9-
     D                                     1266479E0DC933F1'
      *À
     D TemplateHeader_...
     D                 DS                  QUALIFIED BASED(@NULL)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      *À
     D TemplateEntry_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTmpCch: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TmpCchDlt...
     D                 PR              *
     D  @                              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTmpCch: Compare
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TmpCchCompare...
     D                 PR            10I 0
     D  @A                             *   CONST
     D  @B                             *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Signature Check
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Create
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheCrt...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Delete
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheDlt...
     D                 PR              *
     D  @                              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Has
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheHas...
     D                 PR              N
     D  @                              *   CONST
     D  @Header                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Add
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheAdd...
     D                 PR
     D  @                              *   CONST
     D  @Header                        *   CONST
     D  Hash                         16A   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀTemplateCache: Retrieve
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheRtv...
     D                 PR              N
     D  @                              *   CONST
     D  @Header                        *   CONST
      *À
