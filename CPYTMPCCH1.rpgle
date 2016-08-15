      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�Template Cache Structure
     D TemplateCache_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Signature                    16A
     D  @Cache                         *
      *�
      *�Template Cache Entry Structure
     D TmpCchEntry_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  Hash                         16A
     D  @Data                          *
     D  Size                         10I 0
     D                               12A
      *�
     D TemplateCacheSignature...
     D                 C                   x'-
     D                                     5CC65E73871022A9-
     D                                     1266479E0DC933F1'
      *�
     D TemplateHeader_...
     D                 DS                  QUALIFIED BASED(@NULL)
     D  Signature                    16A
     D  LibPgm                       21A
     D  Size                         10I 0
     D  Name                        126A   VARYING
     D                                7A
      *�
     D TemplateEntry_...
     D                 DS                  QUALIFIED BASED(@NULL) ALIGN
     D  @Addr                          *   PROCPTR
     D  Name                        126A   VARYING
      *�
      *�--------------------------------------------------------------------------------------------
      *�TmpCch: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TmpCchDlt...
     D                 PR              *
     D  @                              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�TmpCch: Compare
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TmpCchCompare...
     D                 PR            10I 0
     D  @A                             *   CONST
     D  @B                             *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Signature Check
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheSignatureCheck...
     D                 PR              *
     D  @                              *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Create
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheCrt...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Delete
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheDlt...
     D                 PR              *
     D  @                              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Has
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheHas...
     D                 PR              N
     D  @                              *   CONST
     D  @Header                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Add
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheAdd...
     D                 PR
     D  @                              *   CONST
     D  @Header                        *   CONST
     D  Hash                         16A   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�TemplateCache: Retrieve
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D TemplateCacheRtv...
     D                 PR              N
     D  @                              *   CONST
     D  @Header                        *   CONST
      *�
