MODULE UTIL_TSRFTLAD_MOD

USE YOMSRFTLAD, ONLY : TSRFTLAD

INTERFACE SAVE
MODULE PROCEDURE SAVE_TSRFTLAD
END INTERFACE

INTERFACE LOAD
MODULE PROCEDURE LOAD_TSRFTLAD
END INTERFACE

INTERFACE COPY
MODULE PROCEDURE COPY_TSRFTLAD
END INTERFACE



CONTAINS

SUBROUTINE SAVE_TSRFTLAD (KLUN, YD)

IMPLICIT NONE
INTEGER, INTENT (IN) :: KLUN
TYPE (TSRFTLAD), INTENT (IN), TARGET :: YD
LOGICAL :: LGPTSKIN0, LGPTSKIN9
LGPTSKIN0 = ALLOCATED (YD%GPTSKIN0)
WRITE (KLUN) LGPTSKIN0
IF (LGPTSKIN0) THEN
  WRITE (KLUN) LBOUND (YD%GPTSKIN0)
  WRITE (KLUN) UBOUND (YD%GPTSKIN0)
  WRITE (KLUN) YD%GPTSKIN0
ENDIF
LGPTSKIN9 = ALLOCATED (YD%GPTSKIN9)
WRITE (KLUN) LGPTSKIN9
IF (LGPTSKIN9) THEN
  WRITE (KLUN) LBOUND (YD%GPTSKIN9)
  WRITE (KLUN) UBOUND (YD%GPTSKIN9)
  WRITE (KLUN) YD%GPTSKIN9
ENDIF
WRITE (KLUN) YD%NGSKIN
WRITE (KLUN) YD%LREGSF
END SUBROUTINE

SUBROUTINE LOAD_TSRFTLAD (KLUN, YD)

IMPLICIT NONE
INTEGER, INTENT (IN) :: KLUN
TYPE (TSRFTLAD), INTENT (OUT), TARGET :: YD
INTEGER :: IL3(3), IU3(3)
LOGICAL :: LGPTSKIN0, LGPTSKIN9
READ (KLUN) LGPTSKIN0
IF (LGPTSKIN0) THEN
  READ (KLUN) IL3
  READ (KLUN) IU3
  ALLOCATE (YD%GPTSKIN0 (IL3(1):IU3(1), IL3(2):IU3(2), IL3(3):IU3(3)))
  READ (KLUN) YD%GPTSKIN0
ENDIF
READ (KLUN) LGPTSKIN9
IF (LGPTSKIN9) THEN
  READ (KLUN) IL3
  READ (KLUN) IU3
  ALLOCATE (YD%GPTSKIN9 (IL3(1):IU3(1), IL3(2):IU3(2), IL3(3):IU3(3)))
  READ (KLUN) YD%GPTSKIN9
ENDIF
READ (KLUN) YD%NGSKIN
READ (KLUN) YD%LREGSF
END SUBROUTINE


SUBROUTINE COPY_TSRFTLAD (YD, LDCREATED)

IMPLICIT NONE
TYPE (TSRFTLAD), INTENT (IN), TARGET :: YD
LOGICAL, OPTIONAL, INTENT (IN) :: LDCREATED
LOGICAL :: LLCREATED
LOGICAL :: LGPTSKIN0, LGPTSKIN9

LLCREATED = .FALSE.
IF (PRESENT (LDCREATED)) THEN
  LLCREATED = LDCREATED
ENDIF
IF (.NOT. LLCREATED) THEN
  !$acc enter data create (YD)
  !$acc update device (YD)
ENDIF
LGPTSKIN0 = ALLOCATED (YD%GPTSKIN0)
IF (LGPTSKIN0) THEN
  !$acc enter data create (YD%GPTSKIN0)
  !$acc update device (YD%GPTSKIN0)
  !$acc enter data attach (YD%GPTSKIN0)
ENDIF

LGPTSKIN9 = ALLOCATED (YD%GPTSKIN9)
IF (LGPTSKIN9) THEN
  !$acc enter data create (YD%GPTSKIN9)
  !$acc update device (YD%GPTSKIN9)
  !$acc enter data attach (YD%GPTSKIN9)
ENDIF



END SUBROUTINE



END MODULE
