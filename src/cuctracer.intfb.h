INTERFACE
SUBROUTINE CUCTRACER &
& (YDCST, YDCUMFS, YDECUMF2, YDECUMF,&
& KIDIA,    KFDIA,    KLON,     KLEV,  KTRAC,&
& KCTOP,    KDTOP,    KTYPE,&
& LDCUM,    LDDRAF,   PTSPHY,   PAPH,  PAP,&
& PMFU,     PMFD,     PMFUO,    PMFDO, PUDRATE,  PDDRATE,&
& PDMFUP,   PDMFDP,&
& PCEN,     PTENC,    PSCAV  )
USE PARKIND1 , ONLY : JPIM     ,JPRB
USE YOMHOOK  , ONLY : LHOOK,   DR_HOOK
USE YOMCST   , ONLY : TCST
USE YOECUMF  , ONLY : TECUMF
USE YOECUMF2 , ONLY : TECUMF2
USE YOMCUMFS , ONLY : TCUMFS
TYPE(TCST)        ,INTENT(IN)    :: YDCST
TYPE(TCUMFS)      ,INTENT(IN)    :: YDCUMFS
TYPE(TECUMF)      ,INTENT(IN)    :: YDECUMF
TYPE(TECUMF2)     ,INTENT(IN)    :: YDECUMF2
INTEGER(KIND=JPIM),INTENT(IN)    :: KLON
INTEGER(KIND=JPIM),INTENT(IN)    :: KLEV
INTEGER(KIND=JPIM),INTENT(IN)    :: KTRAC
INTEGER(KIND=JPIM),INTENT(IN)    :: KIDIA
INTEGER(KIND=JPIM),INTENT(IN)    :: KFDIA
INTEGER(KIND=JPIM),INTENT(IN)    :: KCTOP(KLON)
INTEGER(KIND=JPIM),INTENT(IN)    :: KDTOP(KLON)
INTEGER(KIND=JPIM),INTENT(IN)    :: KTYPE(KLON)
LOGICAL           ,INTENT(IN)    :: LDCUM(KLON)
LOGICAL           ,INTENT(IN)    :: LDDRAF(KLON)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PTSPHY
REAL(KIND=JPRB)   ,INTENT(IN)    :: PAPH(KLON,KLEV+1)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PAP(KLON,KLEV)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PMFU(KLON,KLEV)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PMFD(KLON,KLEV)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PMFUO(KLON,KLEV)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PMFDO(KLON,KLEV)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PUDRATE(KLON,KLEV)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PDDRATE(KLON,KLEV)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PDMFUP(KLON,KLEV)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PDMFDP(KLON,KLEV)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PCEN(KLON,KLEV,KTRAC)
REAL(KIND=JPRB)   ,INTENT(IN)    :: PSCAV(KTRAC)
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PTENC(KLON,KLEV,KTRAC)
END SUBROUTINE CUCTRACER

END INTERFACE
