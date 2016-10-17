      *À
      *À--------------------------------------------------------------------------------------------
      *ÀPackage: Language elements
      *À - Object Class
      *À - Class Class
      *À - Interface Class
      *À - Comparable Interface
      *À- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
     D @PkgLang...
     D                 DS                  QUALIFIED
     D                               16A   INZ(PackageSignature)
     D                               10I 0 INZ(%Size(@PkgLang))
     D                               12A
     D                                 *   INZ(%Addr(@ClsObject))
     D                                 *   INZ(%Addr(@ClsClass))
     D                                 *   INZ(%Addr(@ClsInterface))
     D                                 *   INZ(%Addr(@IfcComparable))
     D                                 *   INZ(%Addr(@ClsArray))
     D                                 *   INZ(%Addr(@ClsString))
      *À
     D/COPY RAYLIB/QDLLSRCV20,CPYUTILV20
     D/COPY RAYLIB/QDLLSRCV20,CPYOBJECT
     D/COPY RAYLIB/QDLLSRCV20,CPYARRAY
     D/COPY RAYLIB/QDLLSRCV20,CPYSTRING
      *À
