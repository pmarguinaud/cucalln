MODULE YOMSPHYHIST

USE PARKIND1  ,ONLY : JPRB

IMPLICIT NONE

SAVE

! ------ INTER TIMESTEP MEMORY FOR TRAJECTORIES AND PERTURBATIONS IN TL/AD PHYSICS
!   The intention is to keep all such variables in one module 
!   It is also aimed to be done in a style similar with the other trajectories
!   passed between different models (NL/TL/AD)


TYPE SPHYS_HIST_TYPE
  REAL (KIND=JPRB), DIMENSION (:,:), POINTER :: YA5=>NULL(), YL5=>NULL(), YI5=>NULL() ! cloud variables for trajectory in TL
  REAL (KIND=JPRB), DIMENSION (:,:), POINTER :: RADLWM=>NULL(), RADLWM5=>NULL() ! downward longwave emmissivity (0:KLEV)
  REAL (KIND=JPRB), DIMENSION (:,:), POINTER :: TGWDWMSU=>NULL(), TGWDWMSU5=>NULL() ! u-tendencies from non-orographic GWD
  REAL (KIND=JPRB), DIMENSION (:,:), POINTER :: TGWDWMSV=>NULL(), TGWDWMSV5=>NULL() ! v-tendencies from non-orographic GWD
END TYPE SPHYS_HIST_TYPE

!!TYPE(SPHYS_HIST_TYPE), POINTER :: GPHIST(:) => NULL()


!     ------------------------------------------------------------------

END MODULE YOMSPHYHIST
