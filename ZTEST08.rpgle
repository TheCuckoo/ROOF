     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*NEW)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO:*SHOWCPY)
     H BNDDIR('QC2LE')
      *À
      *À____________________________________________________________________________________________
      *ÀProcedures
      *À--------------------------------------------------------------------------------------------
      *À
      *ÀCopy in required prototypes
     D/COPY RAYLIB/QDLLSRCV20,PKGLANG
     D/COPY RAYLIB/QDLLSRCV20,PKGCOLLECT
      *À
     D b               S               N
     D @a              S               *
     D @b              S               *
     D @e              S               *
     D @i              S               *
     D @t              S               *
     D @u              S               *
     D @v              S               *
     D @w              S               *
     D @x              S               *
     D @y              S               *
     D @z              S               *
     D j               S             10I 0
     D x               S             10I 0
     D y               S             10I 0
     D z               S             10I 0
     D v               S             30A   VARYING DIM(10)
     D u               S             30A   VARYING DIM(10)
      *
      /free

         //ÀThis program uses automatic initialisation
         //ÀEXSR *INZSR ;

            @a= newArrayWithSize(4) ;

            @w= newString('Andy') ;
            @x= newString('cHaRlIe') ;
            @y= newString('Carol') ;
            @z= newString('carol') ;

            ArrayChg(@a:@w:2) ;
            ArrayChg(@a:@x:1) ;
            ArrayChg(@a:@y:0) ;
            ArrayChg(@a:@z:3) ;

            ArraySort(@a) ;

            @i= ArrayNewIterator(@a) ;
            j=0 ;
            DOW ForEach(@i:@e) ;
              j+= 1 ;
              v(j)= ObjectToVarying(@e) ;
            ENDDO ;

            ArraySort(@a:String_CASE_INSENSITIVE_ORDER) ;

            @i= ArrayNewIterator(@a) ;
            j=0 ;
            DOW ForEach(@i:@e) ;
              j+= 1 ;
              u(j)= ObjectToVarying(@e) ;
            ENDDO ;

         //ÀFinished
            *INLR= *ON ;
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀAutomatic Initialisation
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR *INZSR ;

            //ÀUse Linker in utility program
               DLLUtility(@DLLUtility) ;

            //ÀIncludes
               include(@PkgLang) ;
               include(@PkgCollections) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
