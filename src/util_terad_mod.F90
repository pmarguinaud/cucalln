MODULE UTIL_TERAD_MOD

USE YOERAD, ONLY : TERAD

INTERFACE SAVE
MODULE PROCEDURE SAVE_TERAD
END INTERFACE

INTERFACE LOAD
MODULE PROCEDURE LOAD_TERAD
END INTERFACE

INTERFACE COPY
MODULE PROCEDURE COPY_TERAD
END INTERFACE



CONTAINS

SUBROUTINE SAVE_TERAD (KLUN, YD)
USE UTIL_TSPECTRALPLANCK_MOD
IMPLICIT NONE
INTEGER, INTENT (IN) :: KLUN
TYPE (TERAD), INTENT (IN), TARGET :: YD
LOGICAL :: LCVDAEBC, LCVDAEDU, LCVDAEOM, LCVDAESS, LCVDAESU
WRITE (KLUN) YD%NAER
WRITE (KLUN) YD%NMODE
WRITE (KLUN) YD%NOZOCL
WRITE (KLUN) YD%NRADFR
WRITE (KLUN) YD%NRADPFR
WRITE (KLUN) YD%NRADPLA
WRITE (KLUN) YD%NRADINT
WRITE (KLUN) YD%NRADRES
WRITE (KLUN) YD%NRADNFR
WRITE (KLUN) YD%NRADSFR
WRITE (KLUN) YD%NRADE1H
WRITE (KLUN) YD%NRADE3H
WRITE (KLUN) YD%NRADELG
WRITE (KLUN) YD%NOVLP
WRITE (KLUN) YD%NRPROMA
WRITE (KLUN) YD%NSW
WRITE (KLUN) YD%NSWNL
WRITE (KLUN) YD%NSWTL
WRITE (KLUN) YD%NLWEMISS
WRITE (KLUN) YD%NLWOUT
WRITE (KLUN) YD%NTSW
WRITE (KLUN) YD%NUV
WRITE (KLUN) YD%NCSRADF
WRITE (KLUN) YD%NICEOPT
WRITE (KLUN) YD%NLIQOPT
WRITE (KLUN) YD%NSWICEOPT
WRITE (KLUN) YD%NSWLIQOPT
WRITE (KLUN) YD%NLWICEOPT
WRITE (KLUN) YD%NLWLIQOPT
WRITE (KLUN) YD%NRADIP
WRITE (KLUN) YD%NRADLP
WRITE (KLUN) YD%NINHOM
WRITE (KLUN) YD%NLAYINH
WRITE (KLUN) YD%NLNGR1H
WRITE (KLUN) YD%NPERTAER
WRITE (KLUN) YD%NPERTOZ
WRITE (KLUN) YD%NSCEN
WRITE (KLUN) YD%NHINCSOL
WRITE (KLUN) YD%NMCICA
WRITE (KLUN) YD%NGHGRAD
WRITE (KLUN) YD%NDECOLAT
WRITE (KLUN) YD%NMINICE
WRITE (KLUN) YD%NVOLCVERT
WRITE (KLUN) YD%NREDGLW
WRITE (KLUN) YD%NREDGSW
WRITE (KLUN) YD%NAERMACC
WRITE (KLUN) YD%NMCLAT
WRITE (KLUN) YD%NMCLON
WRITE (KLUN) YD%NMCLEV
WRITE (KLUN) YD%NMCVAR
WRITE (KLUN) YD%NSPMAPL
WRITE (KLUN) YD%NSPMAPS
WRITE (KLUN) YD%NLWSCATTERING
WRITE (KLUN) YD%NSWSOLVER
WRITE (KLUN) YD%NLWSOLVER
WRITE (KLUN) YD%KMODTS
WRITE (KLUN) YD%NSOLARSPECTRUM
WRITE (KLUN) YD%NSWWVCONTINUUM
WRITE (KLUN) YD%NDUMPBADINPUTS
WRITE (KLUN) YD%NDUMPINPUTS
WRITE (KLUN) YD%NCLOUDOVERLAP
WRITE (KLUN) YD%RCLOUD_FRAC_STD
WRITE (KLUN) YD%RCLOUD_SEPARATION_SCALE_TOA
WRITE (KLUN) YD%RCLOUD_SEPARATION_SCALE_SURF
WRITE (KLUN) YD%LFU_LW_ICE_OPTICS_BUG
WRITE (KLUN) YD%LINTERPINCLOUDMEAN
WRITE (KLUN) YD%LERAD1H
WRITE (KLUN) YD%LEPO3RA
WRITE (KLUN) YD%LONEWSW
WRITE (KLUN) YD%LECSRAD
WRITE (KLUN) YD%LRRTM
WRITE (KLUN) YD%LSRTM
WRITE (KLUN) YD%LDIFFC
WRITE (KLUN) YD%LHVOLCA
WRITE (KLUN) YD%LNEWAER
WRITE (KLUN) YD%LNOTROAER
WRITE (KLUN) YD%LRAYL
WRITE (KLUN) YD%LOPTRPROMA
WRITE (KLUN) YD%LECO2VAR
WRITE (KLUN) YD%LHGHG
WRITE (KLUN) YD%LESO4HIS
WRITE (KLUN) YD%LETRACGMS
WRITE (KLUN) YD%LAERCLIM
WRITE (KLUN) YD%LAERVISI
WRITE (KLUN) YD%LAER3D
WRITE (KLUN) YD%LVOLCSPEC
WRITE (KLUN) YD%LVOLCDAMP
WRITE (KLUN) YD%LDIAGFORCING
WRITE (KLUN) YD%LAERADCLI
WRITE (KLUN) YD%LAERADJDU
WRITE (KLUN) YD%LAPPROXLWUPDATE
WRITE (KLUN) YD%LAPPROXSWUPDATE
WRITE (KLUN) YD%LMANNERSSWUPDATE
WRITE (KLUN) YD%LCENTREDTIMESZA
WRITE (KLUN) YD%LAVERAGESZA
WRITE (KLUN) YD%LECOMPGRID
WRITE (KLUN) YD%LUSEPRE2017RAD
WRITE (KLUN) YD%LDUSEASON
WRITE (KLUN) YD%LCCNL
WRITE (KLUN) YD%LCCNO
WRITE (KLUN) YD%LPERPET
WRITE (KLUN) YD%RAOVLP
WRITE (KLUN) YD%RBOVLP
WRITE (KLUN) YD%RCCNLND
WRITE (KLUN) YD%RCCNSEA
WRITE (KLUN) YD%LEDBUG
WRITE (KLUN) YD%RPERTOZ
WRITE (KLUN) YD%RRE2DE
WRITE (KLUN) YD%RLWINHF
WRITE (KLUN) YD%RSWINHF
WRITE (KLUN) YD%RMINICE
WRITE (KLUN) YD%RVOLCSPEC
WRITE (KLUN) YD%RNS
WRITE (KLUN) YD%RSIGAIR
WRITE (KLUN) YD%RAESHSS
WRITE (KLUN) YD%RAESHDU
WRITE (KLUN) YD%RAESHOM
WRITE (KLUN) YD%RAESHBC
WRITE (KLUN) YD%RAESHSU
WRITE (KLUN) YD%TRBKG
WRITE (KLUN) YD%STBKG
WRITE (KLUN) YD%CGHGCLIMFILE
WRITE (KLUN) YD%CGHGTIMESERIESFILE
WRITE (KLUN) YD%CSOLARIRRADIANCEFILE
WRITE (KLUN) YD%RRATSEA
WRITE (KLUN) YD%RRATLAND
WRITE (KLUN) YD%RRATDRI
WRITE (KLUN) YD%RCADECOR
WRITE (KLUN) YD%RCBDECOR
WRITE (KLUN) YD%RFACDICE
LCVDAESS = ALLOCATED (YD%CVDAESS)
WRITE (KLUN) LCVDAESS
IF (LCVDAESS) THEN
  WRITE (KLUN) LBOUND (YD%CVDAESS)
  WRITE (KLUN) UBOUND (YD%CVDAESS)
  WRITE (KLUN) YD%CVDAESS
ENDIF
LCVDAEDU = ALLOCATED (YD%CVDAEDU)
WRITE (KLUN) LCVDAEDU
IF (LCVDAEDU) THEN
  WRITE (KLUN) LBOUND (YD%CVDAEDU)
  WRITE (KLUN) UBOUND (YD%CVDAEDU)
  WRITE (KLUN) YD%CVDAEDU
ENDIF
LCVDAEOM = ALLOCATED (YD%CVDAEOM)
WRITE (KLUN) LCVDAEOM
IF (LCVDAEOM) THEN
  WRITE (KLUN) LBOUND (YD%CVDAEOM)
  WRITE (KLUN) UBOUND (YD%CVDAEOM)
  WRITE (KLUN) YD%CVDAEOM
ENDIF
LCVDAEBC = ALLOCATED (YD%CVDAEBC)
WRITE (KLUN) LCVDAEBC
IF (LCVDAEBC) THEN
  WRITE (KLUN) LBOUND (YD%CVDAEBC)
  WRITE (KLUN) UBOUND (YD%CVDAEBC)
  WRITE (KLUN) YD%CVDAEBC
ENDIF
LCVDAESU = ALLOCATED (YD%CVDAESU)
WRITE (KLUN) LCVDAESU
IF (LCVDAESU) THEN
  WRITE (KLUN) LBOUND (YD%CVDAESU)
  WRITE (KLUN) UBOUND (YD%CVDAESU)
  WRITE (KLUN) YD%CVDAESU
ENDIF
CALL SAVE (KLUN, YD%YSPECTPLANCK)
END SUBROUTINE

SUBROUTINE LOAD_TERAD (KLUN, YD)
USE UTIL_TSPECTRALPLANCK_MOD

IMPLICIT NONE
INTEGER, INTENT (IN) :: KLUN
TYPE (TERAD), INTENT (OUT), TARGET :: YD
INTEGER :: IL1(1), IU1(1)
LOGICAL :: LCVDAEBC, LCVDAEDU, LCVDAEOM, LCVDAESS, LCVDAESU
READ (KLUN) YD%NAER
READ (KLUN) YD%NMODE
READ (KLUN) YD%NOZOCL
READ (KLUN) YD%NRADFR
READ (KLUN) YD%NRADPFR
READ (KLUN) YD%NRADPLA
READ (KLUN) YD%NRADINT
READ (KLUN) YD%NRADRES
READ (KLUN) YD%NRADNFR
READ (KLUN) YD%NRADSFR
READ (KLUN) YD%NRADE1H
READ (KLUN) YD%NRADE3H
READ (KLUN) YD%NRADELG
READ (KLUN) YD%NOVLP
READ (KLUN) YD%NRPROMA
READ (KLUN) YD%NSW
READ (KLUN) YD%NSWNL
READ (KLUN) YD%NSWTL
READ (KLUN) YD%NLWEMISS
READ (KLUN) YD%NLWOUT
READ (KLUN) YD%NTSW
READ (KLUN) YD%NUV
READ (KLUN) YD%NCSRADF
READ (KLUN) YD%NICEOPT
READ (KLUN) YD%NLIQOPT
READ (KLUN) YD%NSWICEOPT
READ (KLUN) YD%NSWLIQOPT
READ (KLUN) YD%NLWICEOPT
READ (KLUN) YD%NLWLIQOPT
READ (KLUN) YD%NRADIP
READ (KLUN) YD%NRADLP
READ (KLUN) YD%NINHOM
READ (KLUN) YD%NLAYINH
READ (KLUN) YD%NLNGR1H
READ (KLUN) YD%NPERTAER
READ (KLUN) YD%NPERTOZ
READ (KLUN) YD%NSCEN
READ (KLUN) YD%NHINCSOL
READ (KLUN) YD%NMCICA
READ (KLUN) YD%NGHGRAD
READ (KLUN) YD%NDECOLAT
READ (KLUN) YD%NMINICE
READ (KLUN) YD%NVOLCVERT
READ (KLUN) YD%NREDGLW
READ (KLUN) YD%NREDGSW
READ (KLUN) YD%NAERMACC
READ (KLUN) YD%NMCLAT
READ (KLUN) YD%NMCLON
READ (KLUN) YD%NMCLEV
READ (KLUN) YD%NMCVAR
READ (KLUN) YD%NSPMAPL
READ (KLUN) YD%NSPMAPS
READ (KLUN) YD%NLWSCATTERING
READ (KLUN) YD%NSWSOLVER
READ (KLUN) YD%NLWSOLVER
READ (KLUN) YD%KMODTS
READ (KLUN) YD%NSOLARSPECTRUM
READ (KLUN) YD%NSWWVCONTINUUM
READ (KLUN) YD%NDUMPBADINPUTS
READ (KLUN) YD%NDUMPINPUTS
READ (KLUN) YD%NCLOUDOVERLAP
READ (KLUN) YD%RCLOUD_FRAC_STD
READ (KLUN) YD%RCLOUD_SEPARATION_SCALE_TOA
READ (KLUN) YD%RCLOUD_SEPARATION_SCALE_SURF
READ (KLUN) YD%LFU_LW_ICE_OPTICS_BUG
READ (KLUN) YD%LINTERPINCLOUDMEAN
READ (KLUN) YD%LERAD1H
READ (KLUN) YD%LEPO3RA
READ (KLUN) YD%LONEWSW
READ (KLUN) YD%LECSRAD
READ (KLUN) YD%LRRTM
READ (KLUN) YD%LSRTM
READ (KLUN) YD%LDIFFC
READ (KLUN) YD%LHVOLCA
READ (KLUN) YD%LNEWAER
READ (KLUN) YD%LNOTROAER
READ (KLUN) YD%LRAYL
READ (KLUN) YD%LOPTRPROMA
READ (KLUN) YD%LECO2VAR
READ (KLUN) YD%LHGHG
READ (KLUN) YD%LESO4HIS
READ (KLUN) YD%LETRACGMS
READ (KLUN) YD%LAERCLIM
READ (KLUN) YD%LAERVISI
READ (KLUN) YD%LAER3D
READ (KLUN) YD%LVOLCSPEC
READ (KLUN) YD%LVOLCDAMP
READ (KLUN) YD%LDIAGFORCING
READ (KLUN) YD%LAERADCLI
READ (KLUN) YD%LAERADJDU
READ (KLUN) YD%LAPPROXLWUPDATE
READ (KLUN) YD%LAPPROXSWUPDATE
READ (KLUN) YD%LMANNERSSWUPDATE
READ (KLUN) YD%LCENTREDTIMESZA
READ (KLUN) YD%LAVERAGESZA
READ (KLUN) YD%LECOMPGRID
READ (KLUN) YD%LUSEPRE2017RAD
READ (KLUN) YD%LDUSEASON
READ (KLUN) YD%LCCNL
READ (KLUN) YD%LCCNO
READ (KLUN) YD%LPERPET
READ (KLUN) YD%RAOVLP
READ (KLUN) YD%RBOVLP
READ (KLUN) YD%RCCNLND
READ (KLUN) YD%RCCNSEA
READ (KLUN) YD%LEDBUG
READ (KLUN) YD%RPERTOZ
READ (KLUN) YD%RRE2DE
READ (KLUN) YD%RLWINHF
READ (KLUN) YD%RSWINHF
READ (KLUN) YD%RMINICE
READ (KLUN) YD%RVOLCSPEC
READ (KLUN) YD%RNS
READ (KLUN) YD%RSIGAIR
READ (KLUN) YD%RAESHSS
READ (KLUN) YD%RAESHDU
READ (KLUN) YD%RAESHOM
READ (KLUN) YD%RAESHBC
READ (KLUN) YD%RAESHSU
READ (KLUN) YD%TRBKG
READ (KLUN) YD%STBKG
READ (KLUN) YD%CGHGCLIMFILE
READ (KLUN) YD%CGHGTIMESERIESFILE
READ (KLUN) YD%CSOLARIRRADIANCEFILE
READ (KLUN) YD%RRATSEA
READ (KLUN) YD%RRATLAND
READ (KLUN) YD%RRATDRI
READ (KLUN) YD%RCADECOR
READ (KLUN) YD%RCBDECOR
READ (KLUN) YD%RFACDICE
READ (KLUN) LCVDAESS
IF (LCVDAESS) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%CVDAESS (IL1(1):IU1(1)))
  READ (KLUN) YD%CVDAESS
ENDIF
READ (KLUN) LCVDAEDU
IF (LCVDAEDU) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%CVDAEDU (IL1(1):IU1(1)))
  READ (KLUN) YD%CVDAEDU
ENDIF
READ (KLUN) LCVDAEOM
IF (LCVDAEOM) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%CVDAEOM (IL1(1):IU1(1)))
  READ (KLUN) YD%CVDAEOM
ENDIF
READ (KLUN) LCVDAEBC
IF (LCVDAEBC) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%CVDAEBC (IL1(1):IU1(1)))
  READ (KLUN) YD%CVDAEBC
ENDIF
READ (KLUN) LCVDAESU
IF (LCVDAESU) THEN
  READ (KLUN) IL1
  READ (KLUN) IU1
  ALLOCATE (YD%CVDAESU (IL1(1):IU1(1)))
  READ (KLUN) YD%CVDAESU
ENDIF
CALL LOAD (KLUN, YD%YSPECTPLANCK)
END SUBROUTINE


SUBROUTINE COPY_TERAD (YD, LDCREATED)
USE UTIL_TSPECTRALPLANCK_MOD
IMPLICIT NONE
TYPE (TERAD), INTENT (IN), TARGET :: YD
LOGICAL, OPTIONAL, INTENT (IN) :: LDCREATED
LOGICAL :: LLCREATED
LOGICAL :: LCVDAEBC, LCVDAEDU, LCVDAEOM, LCVDAESS, LCVDAESU

LLCREATED = .FALSE.
IF (PRESENT (LDCREATED)) THEN
  LLCREATED = LDCREATED
ENDIF
IF (.NOT. LLCREATED) THEN
  !$acc enter data create (YD)
  !$acc update device (YD)
ENDIF


































































































































LCVDAESS = ALLOCATED (YD%CVDAESS)
IF (LCVDAESS) THEN
  !$acc enter data create (YD%CVDAESS)
  !$acc update device (YD%CVDAESS)
  !$acc enter data attach (YD%CVDAESS)
ENDIF

LCVDAEDU = ALLOCATED (YD%CVDAEDU)
IF (LCVDAEDU) THEN
  !$acc enter data create (YD%CVDAEDU)
  !$acc update device (YD%CVDAEDU)
  !$acc enter data attach (YD%CVDAEDU)
ENDIF

LCVDAEOM = ALLOCATED (YD%CVDAEOM)
IF (LCVDAEOM) THEN
  !$acc enter data create (YD%CVDAEOM)
  !$acc update device (YD%CVDAEOM)
  !$acc enter data attach (YD%CVDAEOM)
ENDIF

LCVDAEBC = ALLOCATED (YD%CVDAEBC)
IF (LCVDAEBC) THEN
  !$acc enter data create (YD%CVDAEBC)
  !$acc update device (YD%CVDAEBC)
  !$acc enter data attach (YD%CVDAEBC)
ENDIF

LCVDAESU = ALLOCATED (YD%CVDAESU)
IF (LCVDAESU) THEN
  !$acc enter data create (YD%CVDAESU)
  !$acc update device (YD%CVDAESU)
  !$acc enter data attach (YD%CVDAESU)
ENDIF

CALL COPY (YD%YSPECTPLANCK, LDCREATED=.TRUE.)

END SUBROUTINE



END MODULE
