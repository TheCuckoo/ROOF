     H DATFMT(*ISO)
     H DFTACTGRP(*NO)
     H ACTGRP(*CALLER)
     H DEBUG(*YES)
     H OPTION(*SRCSTMT:*NODEBUGIO)
     H BNDDIR('QC2LE')
     H COPYRIGHT('(c) 2016 Ray Gillies-Jones. All rights reserved.')
      *�
      *�Copyright details here:
     D/COPY RAYLIB/QDLLSRCV20,CPYCOPYRGT
      *�
      *�Copy in required prototypes
     D/COPY RAYLIB/QDLLSRCV20,CPYUTILV20
     D/COPY RAYLIB/QDLLSRCV20,CPYOBJECT
      *�
      *�--------------------------------------------------------------------------------------------
      *�Procedures
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *�
      *�--------------------------------------------------------------------------------------------
      *�castThis
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D castThis...
     D                 PR              *
     D  @this                          *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D instanceOfThis...
     D                 PR              N
     D  @Object                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�extendsThis
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D extendsThis...
     D                 PR              *
     D  template                  65535A   OPTIONS(*VARSIZE)
      *�
      *�--------------------------------------------------------------------------------------------
      *�newThis
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D newThis...
     D                 PR              *
      *�
      *�--------------------------------------------------------------------------------------------
      *�thisDlt
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D thisDlt...
     D                 PR              *
     D  @this                          *
      *�
      *�--------------------------------------------------------------------------------------------
      *�Constants and Work Fields
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D @this           S               *
      *�
     D Common          DS                  QUALIFIED BASED(@Common)
     D  @cast                          *   PROCPTR
     D  @instanceOf                    *   PROCPTR
     D  @extends                       *   PROCPTR
     D  @new                           *   PROCPTR
     D  @dlt                           *   PROCPTR
      *�
      *�--------------------------------------------------------------------------------------------
      *�*ENTRY PLIST Parameters
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D Main            PR                  EXTPGM('QOO#000000')
     D  @Class                         *   CONST
     D  @Common                        *   CONST
      *�
     D Main            PI
     D  @Class                         *   CONST
     D  @Common                        *   CONST
      *�
      *�--------------------------------------------------------------------------------------------
      *�Start of executable
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      *
      /free

         //�This program uses automatic initialisation
         //�EXSR *INZSR ;

         //�Shut down requested
            IF (@Class = null) ;
               *INLR= *ON ;
               RETURN ;
            ENDIF ;

         //�Set class
            @this= @Class ;

         //�Set addresses
            Common.@cast= %pAddr(castThis) ;
            Common.@instanceOf= %pAddr(instanceOfThis) ;
            Common.@extends= %pAddr(extendsThis) ;
            Common.@new= %pAddr(newThis) ;
            Common.@dlt= %pAddr(thisDlt) ;

         //�Finished
            RETURN ;

         //�----------------------------------------------------------------------------------------
         //�Automatic Initialisation
         //�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            BEGSR *INZSR ;

            //�Use Linker in utility program
               DLLUtility(@DLLUtility) ;

            //�Includes
               include(@ClsObject) ;
               include(@ClsClass) ;

         //�Finished
            ENDSR ;

      /end-free
      *�
      *�--------------------------------------------------------------------------------------------
      *�castThis
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P castThis...
     P                 B
     D                 PI              *
     D  @                              *   CONST
      *�
      /free

         //�Watch for errors
            MONITOR ;

            //�Cast as an instance of this class
               RETURN ClassCast(@this:@) ;

         //�Pass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Instance Of
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P instanceOfThis...
     P                 B
     D                 PI              N
     D  @Object                        *   CONST
      *�
      /free

         //�Watch for errors
            MONITOR ;

            //�Finished
               RETURN (
                 ClassInstanceOf(
                   @this:
                   @Object) >= CLASS_INSTANCE_EXACT_MATCH) ;

         //�Pass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�Extend class
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P extendsThis...
     P                 B
     D                 PI              *
     D pTemplate                  65535A   OPTIONS(*VARSIZE)
      *�
      /free

         //�Watch for errors
            MONITOR ;

            //�Finished
               RETURN ClassExtends(@this:pTemplate) ;

         //�Pass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�New
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P newThis...
     P                 B
     D                 PI              *
      *�
      /free

         //�Watch for errors
            MONITOR ;

            //�Finished
               RETURN ClassNewInstance(@this) ;

         //�Pass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
      *�--------------------------------------------------------------------------------------------
      *�thisDlt
      *�- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     P thisDlt...
     P                 B
     D                 PI              *
     D  @                              *
      *�
      /free

         //�Watch for errors
            MONITOR ;

            //�Instance must be a member of this class
               ClassInstanceCheck(@this:@) ;

            //�Finished
               RETURN ObjectDlt(@) ;

         //�Pass errors back to caller
            ON-ERROR ;
               Throw() ;
            ENDMON ;

      /end-free
      *�
      *�End of procedure
     P                 E
      *�
