INTERFACE
USE MODEL_PHYSICS_ECMWF_MOD      , ONLY : MODEL_PHYSICS_ECMWF_TYPE
USE MODEL_PHYSICS_SIMPLINEAR_MOD , ONLY : MODEL_PHYSICS_SIMPLINEAR_TYPE
USE YOERAD                       , ONLY : TERAD
USE YOM_YGFL                     , ONLY : TYPE_GFLD
USE PARKIND1                     , ONLY : JPIM     ,JPRB
USE YOMHOOK                      , ONLY : LHOOK,   DR_HOOK
USE YOMCST                       , ONLY : TCST
USE YOETHF                       , ONLY : TTHF
USE UTIL_MODEL_PHYSICS_ECMWF_TYPE_MOD
USE UTIL_MODEL_PHYSICS_SIMPLINEAR_TYPE_MOD
USE UTIL_TERAD_MOD
USE UTIL_TYPE_GFLD_MOD
USE UTIL_TCST_MOD
USE UTIL_TTHF_MOD
USE YOMIBL
USE YOMMP0
IMPLICIT NONE
REAL(KIND=JPRB)       :: PPLDARE
REAL(KIND=JPRB)       :: PPLRG
INTEGER(KIND=JPIM)    :: KSTEP
TYPE(TTHF)                          :: YDTHF
TYPE(TCST)                          :: YDCST
TYPE(TERAD)                         :: YDERAD
TYPE(MODEL_PHYSICS_ECMWF_TYPE)      :: YDML_PHY_EC
TYPE(MODEL_PHYSICS_SIMPLINEAR_TYPE) :: YDML_PHY_SLIN
TYPE(TYPE_GFLD)       :: YGFL
INTEGER(KIND=JPIM)    :: KLON
INTEGER(KIND=JPIM)    :: KSMAX
INTEGER(KIND=JPIM)    :: KLEV
INTEGER(KIND=JPIM)    :: KSPPN2D
INTEGER(KIND=JPIM)    :: KTRAC
INTEGER(KIND=JPIM)    :: KIDIA
INTEGER(KIND=JPIM)    :: KFDIA
LOGICAL               :: LDSLPHY
REAL(KIND=JPRB)       :: PTSPHY
REAL(KIND=JPRB)       :: PVDIFTS
REAL(KIND=JPRB)   , ALLOCATABLE   :: PSCAV(:)
LOGICAL           , ALLOCATABLE   :: LDLAND(:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PLCRIT_AER(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTM1(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PQM1(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PUM1(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PVM1(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PCM1(:,:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PLITOT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PVERVEL(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PQHFL(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PAHFS(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PAPHM1(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PAP(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PAPH(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PGEO(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PGEOH(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENQ(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENU(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENV(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENT_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENQ_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENU_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENV_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PGAW(:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PCUCONVCA(:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PGP2DSPP(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PDX(:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENC(:,:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PTENC_OUT(:,:,:)
LOGICAL           , ALLOCATABLE   :: LDSHCV(:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PARPRC(:)        , PARPRC_OUT(:)
INTEGER(KIND=JPIM), ALLOCATABLE   :: KTOPC(:)         , KTOPC_OUT(:)
INTEGER(KIND=JPIM), ALLOCATABLE   :: KBASEC(:)        , KBASEC_OUT(:)
INTEGER(KIND=JPIM), ALLOCATABLE   :: KTYPE(:)         , KTYPE_OUT(:)
INTEGER(KIND=JPIM), ALLOCATABLE   :: KCBOT(:)         , KCBOT_OUT(:)
INTEGER(KIND=JPIM), ALLOCATABLE   :: KCTOP(:)         , KCTOP_OUT(:)
INTEGER(KIND=JPIM), ALLOCATABLE   :: KBOTSC(:)        , KBOTSC_OUT(:)
LOGICAL           , ALLOCATABLE   :: LDCUM(:)         , LDCUM_OUT(:)
LOGICAL           , ALLOCATABLE   :: LDSC(:)          , LDSC_OUT(:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PLU(:,:)         , PLU_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PLUDE(:,:)       , PLUDE_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PLUDELI(:,:,:)   , PLUDELI_OUT(:,:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PSNDE(:,:,:)     , PSNDE_OUT(:,:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PMFU(:,:)        , PMFU_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PMFD(:,:)        , PMFD_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PDIFCQ(:,:)      , PDIFCQ_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PDIFCS(:,:)      , PDIFCS_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PFHPCL(:,:)      , PFHPCL_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PFHPCN(:,:)      , PFHPCN_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PFPLCL(:,:)      , PFPLCL_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PFPLCN(:,:)      , PFPLCN_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PLRAIN(:,:)      , PLRAIN_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PRSUD(:,:,:)     , PRSUD_OUT(:,:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PSTRCU(:,:)      , PSTRCU_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PSTRCV(:,:)      , PSTRCV_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PFCQLF(:,:)      , PFCQLF_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PFCQIF(:,:)      , PFCQIF_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PMFUDE_RATE(:,:) , PMFUDE_RATE_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PMFDDE_RATE(:,:) , PMFDDE_RATE_OUT(:,:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PCAPE(:)         , PCAPE_OUT(:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PWMEAN(:)        , PWMEAN_OUT(:)
REAL(KIND=JPRB)   , ALLOCATABLE   :: PDISS(:,:)       , PDISS_OUT(:,:)
INTEGER (KIND=JPIM) :: ILUN
CHARACTER*18 :: CLBLOCK
REAL(KIND=JPRB) :: ZHOOK_HANDLE
IF (LHOOK) CALL DR_HOOK('MAIN_CUCALLN_MF',0,ZHOOK_HANDLE)
ILUN = 70 + IBLOCK
WRITE (CLBLOCK, '(".",I8.8,".",I8.8)') 1, 1
OPEN (ILUN, FILE="CUCALLN_MF.CONST"//TRIM(CLBLOCK)//".dat", FORM="UNFORMATTED", STATUS="OLD")
CALL LOAD (ILUN, YDTHF)
CALL LOAD (ILUN, YDCST)
CALL LOAD (ILUN, YDERAD)
CALL LOAD (ILUN, YDML_PHY_EC)
CALL LOAD (ILUN, YDML_PHY_SLIN)
CALL LOAD (ILUN, YGFL)
CLOSE (ILUN)
OPEN (ILUN, FILE="CUCALLN_MF.DIMS"//TRIM(CLBLOCK)//".dat", FORM="UNFORMATTED", STATUS="OLD")
READ (ILUN) PPLDARE
READ (ILUN) PPLRG
READ (ILUN) KSTEP
READ (ILUN) KLON
READ (ILUN) KSMAX
READ (ILUN) KLEV
READ (ILUN) KSPPN2D
READ (ILUN) KTRAC
READ (ILUN) KIDIA
READ (ILUN) KFDIA
READ (ILUN) LDSLPHY
READ (ILUN) PTSPHY
READ (ILUN) PVDIFTS
ALLOCATE (PSCAV(KTRAC))
READ (ILUN) PSCAV
CLOSE (ILUN)
ALLOCATE (LDLAND(KLON))
ALLOCATE (PLCRIT_AER(KLON,KLEV))
ALLOCATE (PTM1(KLON,KLEV))
ALLOCATE (PQM1(KLON,KLEV))
ALLOCATE (PUM1(KLON,KLEV))
ALLOCATE (PVM1(KLON,KLEV))
ALLOCATE (PCM1(KLON,KLEV,KTRAC))
ALLOCATE (PLITOT(KLON,KLEV))
ALLOCATE (PVERVEL(KLON,KLEV))
ALLOCATE (PQHFL(KLON,KLEV+1))
ALLOCATE (PAHFS(KLON,KLEV+1))
ALLOCATE (PAPHM1(KLON,KLEV+1))
ALLOCATE (PAP(KLON,KLEV))
ALLOCATE (PAPH(KLON,KLEV+1))
ALLOCATE (PGEO(KLON,KLEV))
ALLOCATE (PGEOH(KLON,KLEV+1))
ALLOCATE (PTENT(KLON,KLEV))
ALLOCATE (PTENQ(KLON,KLEV))
ALLOCATE (PTENU(KLON,KLEV))
ALLOCATE (PTENV(KLON,KLEV))
ALLOCATE (PGAW(KLON))
ALLOCATE (PCUCONVCA(KLON))
ALLOCATE (PGP2DSPP(KLON,KSPPN2D))
ALLOCATE (PDX(KLON))
ALLOCATE (PTENC(KLON,KLEV,KTRAC))
ALLOCATE (LDSHCV(KLON))
ALLOCATE (PARPRC(KLON))
ALLOCATE (KTOPC(KLON))
ALLOCATE (KBASEC(KLON))
ALLOCATE (KTYPE(KLON))
ALLOCATE (KCBOT(KLON))
ALLOCATE (KCTOP(KLON))
ALLOCATE (KBOTSC(KLON))
ALLOCATE (LDCUM(KLON))
ALLOCATE (LDSC(KLON))
ALLOCATE (PLU(KLON,KLEV))
ALLOCATE (PLUDE(KLON,KLEV))
ALLOCATE (PLUDELI(KLON,KLEV,4))
ALLOCATE (PSNDE(KLON,KLEV,2))
ALLOCATE (PMFU(KLON,KLEV))
ALLOCATE (PMFD(KLON,KLEV))
ALLOCATE (PDIFCQ(KLON,KLEV+1))
ALLOCATE (PDIFCS(KLON,KLEV+1))
ALLOCATE (PFHPCL(KLON,KLEV+1))
ALLOCATE (PFHPCN(KLON,KLEV+1))
ALLOCATE (PFPLCL(KLON,KLEV+1))
ALLOCATE (PFPLCN(KLON,KLEV+1))
ALLOCATE (PLRAIN(KLON,KLEV))
ALLOCATE (PRSUD(KLON,KLEV,2))
ALLOCATE (PSTRCU(KLON,KLEV+1))
ALLOCATE (PSTRCV(KLON,KLEV+1))
ALLOCATE (PFCQLF(KLON,KLEV+1))
ALLOCATE (PFCQIF(KLON,KLEV+1))
ALLOCATE (PMFUDE_RATE(KLON,KLEV))
ALLOCATE (PMFDDE_RATE(KLON,KLEV))
ALLOCATE (PCAPE(KLON))
ALLOCATE (PWMEAN(KLON))
ALLOCATE (PDISS(KLON,KLEV))
OPEN (ILUN, FILE="CUCALLN_MF.IN"//TRIM(CLBLOCK)//".dat", FORM="UNFORMATTED", STATUS="OLD")
READ (ILUN) LDLAND
READ (ILUN) PLCRIT_AER
READ (ILUN) PTM1
READ (ILUN) PQM1
READ (ILUN) PUM1
READ (ILUN) PVM1
READ (ILUN) PCM1
READ (ILUN) PLITOT
READ (ILUN) PVERVEL
READ (ILUN) PQHFL
READ (ILUN) PAHFS
READ (ILUN) PAPHM1
READ (ILUN) PAP
READ (ILUN) PAPH
READ (ILUN) PGEO
READ (ILUN) PGEOH
READ (ILUN) PTENT
READ (ILUN) PTENQ
READ (ILUN) PTENU
READ (ILUN) PTENV
READ (ILUN) PGAW
READ (ILUN) PCUCONVCA
READ (ILUN) PGP2DSPP
READ (ILUN) PDX
READ (ILUN) PTENC
READ (ILUN) LDSHCV
CLOSE (ILUN)
WRITE (0, *) " KLON = ", KLON, " KLEV = ", KLEV
CALL CUCALLN_MF    (PPLDARE, PPLRG, KSTEP, YDTHF, YDCST, YDERAD, YDML_PHY_SLIN,  YDML_PHY_EC, YGFL,   &
& KIDIA, KFDIA, KLON, KSMAX, KLEV, PDX, KSPPN2D, LDLAND, LDSLPHY, PTSPHY,  PVDIFTS, PTM1, PQM1, PUM1, &
& PVM1, PLITOT, PVERVEL, PQHFL, PAHFS, PAPHM1, PAP, PAPH, PGEO,  PGEOH, PGAW, PCUCONVCA, PGP2DSPP,    &
& PTENT, PTENQ, PTENU, PTENV, PARPRC, KTOPC, KBASEC, KTYPE,    KCBOT, KCTOP, KBOTSC, LDCUM, LDSC,     &
& LDSHCV, PLCRIT_AER, PLU, PLUDE, PLUDELI, PSNDE, PMFU,  PMFD, PDIFCQ, PDIFCS, PFHPCL, PFHPCN,        &
& PFPLCL, PFPLCN, PLRAIN, PRSUD, PSTRCU, PSTRCV, PFCQLF,  PFCQIF, PMFUDE_RATE, PMFDDE_RATE, PCAPE,    &
& PWMEAN, PDISS, KTRAC, PCM1, PTENC, PSCAV )
ALLOCATE (PTENT_OUT(KLON,KLEV))
ALLOCATE (PTENQ_OUT(KLON,KLEV))
ALLOCATE (PTENU_OUT(KLON,KLEV))
ALLOCATE (PTENV_OUT(KLON,KLEV))
ALLOCATE (PTENC_OUT(KLON,KLEV,KTRAC))
ALLOCATE (PARPRC_OUT(KLON))
ALLOCATE (KTOPC_OUT(KLON))
ALLOCATE (KBASEC_OUT(KLON))
ALLOCATE (KTYPE_OUT(KLON))
ALLOCATE (KCBOT_OUT(KLON))
ALLOCATE (KCTOP_OUT(KLON))
ALLOCATE (KBOTSC_OUT(KLON))
ALLOCATE (LDCUM_OUT(KLON))
ALLOCATE (LDSC_OUT(KLON))
ALLOCATE (PLU_OUT(KLON,KLEV))
ALLOCATE (PLUDE_OUT(KLON,KLEV))
ALLOCATE (PLUDELI_OUT(KLON,KLEV,4))
ALLOCATE (PSNDE_OUT(KLON,KLEV,2))
ALLOCATE (PMFU_OUT(KLON,KLEV))
ALLOCATE (PMFD_OUT(KLON,KLEV))
ALLOCATE (PDIFCQ_OUT(KLON,KLEV+1))
ALLOCATE (PDIFCS_OUT(KLON,KLEV+1))
ALLOCATE (PFHPCL_OUT(KLON,KLEV+1))
ALLOCATE (PFHPCN_OUT(KLON,KLEV+1))
ALLOCATE (PFPLCL_OUT(KLON,KLEV+1))
ALLOCATE (PFPLCN_OUT(KLON,KLEV+1))
ALLOCATE (PLRAIN_OUT(KLON,KLEV))
ALLOCATE (PRSUD_OUT(KLON,KLEV,2))
ALLOCATE (PSTRCU_OUT(KLON,KLEV+1))
ALLOCATE (PSTRCV_OUT(KLON,KLEV+1))
ALLOCATE (PFCQLF_OUT(KLON,KLEV+1))
ALLOCATE (PFCQIF_OUT(KLON,KLEV+1))
ALLOCATE (PMFUDE_RATE_OUT(KLON,KLEV))
ALLOCATE (PMFDDE_RATE_OUT(KLON,KLEV))
ALLOCATE (PCAPE_OUT(KLON))
ALLOCATE (PWMEAN_OUT(KLON))
ALLOCATE (PDISS_OUT(KLON,KLEV))
OPEN (ILUN, FILE="CUCALLN_MF.OUT"//TRIM(CLBLOCK)//".dat", FORM="UNFORMATTED", STATUS="OLD")
READ (ILUN) PTENT_OUT
READ (ILUN) PTENQ_OUT
READ (ILUN) PTENU_OUT
READ (ILUN) PTENV_OUT
READ (ILUN) PTENC_OUT
READ (ILUN) PARPRC_OUT
READ (ILUN) KTOPC_OUT
READ (ILUN) KBASEC_OUT
READ (ILUN) KTYPE_OUT
READ (ILUN) KCBOT_OUT
READ (ILUN) KCTOP_OUT
READ (ILUN) KBOTSC_OUT
READ (ILUN) LDCUM_OUT
READ (ILUN) LDSC_OUT
READ (ILUN) PLU_OUT
READ (ILUN) PLUDE_OUT
READ (ILUN) PLUDELI_OUT
READ (ILUN) PSNDE_OUT
READ (ILUN) PMFU_OUT
READ (ILUN) PMFD_OUT
READ (ILUN) PDIFCQ_OUT
READ (ILUN) PDIFCS_OUT
READ (ILUN) PFHPCL_OUT
READ (ILUN) PFHPCN_OUT
READ (ILUN) PFPLCL_OUT
READ (ILUN) PFPLCN_OUT
READ (ILUN) PLRAIN_OUT
READ (ILUN) PRSUD_OUT
READ (ILUN) PSTRCU_OUT
READ (ILUN) PSTRCV_OUT
READ (ILUN) PFCQLF_OUT
READ (ILUN) PFCQIF_OUT
READ (ILUN) PMFUDE_RATE_OUT
READ (ILUN) PMFDDE_RATE_OUT
READ (ILUN) PCAPE_OUT
READ (ILUN) PWMEAN_OUT
READ (ILUN) PDISS_OUT
CLOSE (ILUN)
CALL DIFF ("PTENT",       PTENT,        PTENT_OUT)
CALL DIFF ("PTENQ",       PTENQ,        PTENQ_OUT)
CALL DIFF ("PTENU",       PTENU,        PTENU_OUT)
CALL DIFF ("PTENV",       PTENV,        PTENV_OUT)
CALL DIFF ("PTENC",       PTENC,        PTENC_OUT)
CALL DIFF ("PARPRC",      PARPRC,       PARPRC_OUT)
CALL DIFF ("KTYPE",       KTYPE,        KTYPE_OUT)
CALL DIFF ("KCBOT",       KCBOT,        KCBOT_OUT)
CALL DIFF ("KCTOP",       KCTOP,        KCTOP_OUT)
CALL DIFF ("KBOTSC",      KBOTSC,       KBOTSC_OUT)
CALL DIFF ("LDCUM",       LDCUM,        LDCUM_OUT)
CALL DIFF ("LDSC",        LDSC,         LDSC_OUT)
CALL DIFF ("PLU",         PLU,          PLU_OUT)
CALL DIFF ("PLUDE",       PLUDE,        PLUDE_OUT)
CALL DIFF ("PLUDELI",     PLUDELI,      PLUDELI_OUT)
CALL DIFF ("PSNDE",       PSNDE,        PSNDE_OUT)
CALL DIFF ("PMFU",        PMFU,         PMFU_OUT)
CALL DIFF ("PMFD",        PMFD,         PMFD_OUT)
CALL DIFF ("PDIFCQ",      PDIFCQ,       PDIFCQ_OUT)
CALL DIFF ("PDIFCS",      PDIFCS,       PDIFCS_OUT)
CALL DIFF ("PFHPCL",      PFHPCL,       PFHPCL_OUT)
CALL DIFF ("PFHPCN",      PFHPCN,       PFHPCN_OUT)
CALL DIFF ("PFPLCL",      PFPLCL,       PFPLCL_OUT)
CALL DIFF ("PFPLCN",      PFPLCN,       PFPLCN_OUT)
CALL DIFF ("PLRAIN",      PLRAIN,       PLRAIN_OUT)
CALL DIFF ("PRSUD",       PRSUD,        PRSUD_OUT)
CALL DIFF ("PSTRCU",      PSTRCU,       PSTRCU_OUT)
CALL DIFF ("PSTRCV",      PSTRCV,       PSTRCV_OUT)
CALL DIFF ("PFCQLF",      PFCQLF,       PFCQLF_OUT)
CALL DIFF ("PFCQIF",      PFCQIF,       PFCQIF_OUT)
CALL DIFF ("PMFUDE_RATE", PMFUDE_RATE,  PMFUDE_RATE_OUT)
CALL DIFF ("PMFDDE_RATE", PMFDDE_RATE,  PMFDDE_RATE_OUT)
CALL DIFF ("PCAPE",       PCAPE,        PCAPE_OUT)
CALL DIFF ("PWMEAN",      PWMEAN,       PWMEAN_OUT)
CALL DIFF ("PDISS",       PDISS,        PDISS_OUT)
IF (LHOOK) CALL DR_HOOK('MAIN_CUCALLN_MF',1,ZHOOK_HANDLE)
CONTAINS
SUBROUTINE DIFFR1 (CDN, PA, PB)
CHARACTER (LEN=*) :: CDN
REAL (KIND=JPRB) :: PA (:), PB (:)
END SUBROUTINE
SUBROUTINE DIFFR2 (CDN, PA, PB)
CHARACTER (LEN=*) :: CDN
REAL (KIND=JPRB) :: PA (:,:), PB (:,:)
END SUBROUTINE
SUBROUTINE DIFFR3 (CDN, PA, PB)
CHARACTER (LEN=*) :: CDN
REAL (KIND=JPRB) :: PA (:,:,:), PB (:,:,:)
END SUBROUTINE
SUBROUTINE DIFFI1 (CDN, KA, KB)
CHARACTER (LEN=*) :: CDN
INTEGER (KIND=JPIM) :: KA (:), KB (:)
END SUBROUTINE
SUBROUTINE DIFFL1 (CDN, LDA, LDB)
CHARACTER (LEN=*) :: CDN
LOGICAL :: LDA (:), LDB (:)
END SUBROUTINE
END

END INTERFACE
