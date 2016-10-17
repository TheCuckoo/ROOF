     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO)
     H BNDDIR('QC2LE')
     H COPYRIGHT('(c) 2016 Ray Gillies-Jones. All rights reserved.')
      *À
      *ÀCopyright details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      *À
      *ÀCopy in required prototypes
     D/COPY RAYLIB/QDLLSRCV20,CPYUTILV20
     D/COPY RAYLIB/QDLLSRCV20,CPYOBJECT
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀProcedures
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀcastThis
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castThis...
     D                 PR              *
     D  @this                          *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInstance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfThis...
     D                 PR              N
     D  @Object                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀextendsThis
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsThis...
     D                 PR              *
     D  template                  65535A   OPTIONS(*VARSIZE)
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀnewThis
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newThis...
     D                 PR              *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀthisDlt
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D thisDlt...
     D                 PR              *
     D  @this                          *
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀConstants and Work Fields
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D @this           S               *
      *À
     D Common          DS                  QUALIFIED BASED(@Common)
     D  @cast                          *   PROCPTR
     D  @instanceOf                    *   PROCPTR
     D  @extends                       *   PROCPTR
     D  @new                           *   PROCPTR
     D  @dlt                           *   PROCPTR
      *À
      *À--------------------------------------------------------------------------------------------
      *À*ENTRY PLIST Parameters
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('QOO#000000')
     D  @Class                         *   CONST
     D  @Common                        *   CONST
      *À
     D Main            PI
     D  @Class                         *   CONST
     D  @Common                        *   CONST
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀStart of executable
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *
      /free

         //ÀThis program uses automatic initialisation
         //ÀEXSR *INZSR ;

         //ÀShut down requested
            IF (@Class = null) ;
               *INLR= *ON ;
               RETURN ;
            ENDIF ;

         //ÀSet class
            @this= @Class ;

         //ÀSet addresses
            Common.@cast= %pAddr(castThis) ;
            Common.@instanceOf= %pAddr(instanceOfThis) ;
            Common.@extends= %pAddr(extendsThis) ;
            Common.@new= %pAddr(newThis) ;
            Common.@dlt= %pAddr(thisDlt) ;

         //ÀFinished
            RETURN ;

         //À----------------------------------------------------------------------------------------
         //ÀAutomatic Initialisation
         //À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR *INZSR ;

            //ÀUse Linker in utility program
               DLLUtility(@DLLUtility) ;

            //ÀIncludes
               include(@ClsObject) ;
               include(@ClsClass) ;

         //ÀFinished
            ENDSR ;

      /end-free
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀcastThis
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castThis...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *À
      /free

         //ÀWatch for errors
            MONITOR ;

            //ÀCast as an instance of this class
               RETURN ClassCast(@this:@) ;

         //ÀPass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀInstance Of
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfThis...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *À
      /free

         //ÀWatch for errors
            MONITOR ;

            //ÀFinished
               RETURN (
                 ClassInstanceOf(
                   @this:
                   @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

         //ÀPass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀExtend class
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsThis...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *À
      /free

         //ÀWatch for errors
            MONITOR ;

            //ÀFinished
               RETURN ClassExtends(@this:pTemplate) ;

         //ÀPass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀNew
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newThis...
     P                 B
     D                 PI              *
      *À
      /free

         //ÀWatch for errors
            MONITOR ;

            //ÀFinished
               RETURN ClassNewInstance(@this) ;

         //ÀPass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
      *À--------------------------------------------------------------------------------------------
      *ÀthisDlt
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P thisDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *À
      /free

         //ÀWatch for errors
            MONITOR ;

            //ÀInstance must be a member of this class
               ClassInstanceCheck(@this:@) ;

            //ÀFinished
               RETURN ObjectDlt(@) ;

         //ÀPass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *À
      *ÀEnd of procedure
     P                 E
      *À
