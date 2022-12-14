!*
!     ------------------------------------------------------------------

!     CE COMDECK CONTIENT DEUX GROUPES DE FONCTIONS THERMODYNAMIQUES :

!        * LE PREMIER (RLV,RLS,RLF,ESW,ESS,ES) CORRESPOND A DES
!     FONCTIONS ABSOLUES (OU INTRINSEQUES) QUI DOIVENT ETRE UTILISEES
!     POUR TOUT CE QUI CONCERNE LE MONDE REEL (DONNEES OBSERVEES ET
!     SORTIES DESTINEES A ETRE COMPAREES A DE TELLES DONNEES).

!        * LE SECOND (FOEW,FODLEW,FOQS,FODQS,FOLH) CORRESPOND AU MONDE
!     DE LA PHYSIQUE DU MODELE (ET PAR CONSEQUENT DE TOUTE LES PARTIES
!     DU CODE QUI DOIVENT ETRE COMPATIBLES AVEC CETTE PHYSIQUE :
!     ANALYSE/DYNAMIQUE/POST-PROCESSING ... ). LES DIFFERENCES ENTRE LES
!     DEUX GROUPES VIENNENT, DANS LA CONFIGURATION ACTUELLE DE LA
!     PHYSIQUE, DES POINTS SUIVANTS :
!         - CALCULS RELATIFS A LA VARIABLE Q DU MODELE
!         - CALCULS DE DERIVATION PAR RAPPORT A LA TEMPERATURE
!         - ABSENCE D'ETATS HORS-EQUILIBRE = UNE SEULE CHALEUR LATENTE
!           DE FUSION
!         - POSSIBILITE DE TRAVAILLER SANS LA PHASE GLACE = INDICE DE
!           TEST BINAIRE.

!     ------------------------------------------------------------------
!     ABSOLUTE THERMODYNAMICAL FUNCTIONS .


!     RLV : LATENT HEAT OF VAPOURISATION
!     RLS : LATENT HEAT OF SUBLIMATION
!     RLF : LATENT HEAT OF FUSION
!     ESW : SATURATION IN PRESENCE OF WATER
!     ESS : SATURATION IN PRESENCE OF ICE
!     ES  : SATURATION (IF T>YDCST%RTT THEN WATER ; IF T<YDCST%RTT THEN ICE)
!        INPUT (FOR ALL SIX FUNCTIONS) : PTARG = TEMPERATURE .
REAL(KIND=JPRB) :: RLV,RLS,RLF,ESW,ESS,ES
REAL(KIND=JPRB) :: PTARG

RLV(PTARG)=YDCST%RLVTT+(YDCST%RCPV-YDCST%RCW)*(PTARG-YDCST%RTT)
RLS(PTARG)=YDCST%RLSTT+(YDCST%RCPV-YDCST%RCS)*(PTARG-YDCST%RTT)
RLF(PTARG)=RLS(PTARG)-RLV(PTARG)
ESW(PTARG)=EXP(YDCST%RALPW-YDCST%RBETW/PTARG-YDCST%RGAMW*LOG(PTARG))
ESS(PTARG)=EXP(YDCST%RALPS-YDCST%RBETS/PTARG-YDCST%RGAMS*LOG(PTARG))
ES (PTARG)=EXP(&
          &(YDCST%RALPW+YDCST%RALPD*MAX(0.0_JPRB,SIGN(1.0_JPRB,YDCST%RTT-PTARG)))&
         &-(YDCST%RBETW+YDCST%RBETD*MAX(0.0_JPRB,SIGN(1.0_JPRB,YDCST%RTT-PTARG)))/PTARG &
         &-(YDCST%RGAMW+YDCST%RGAMD*MAX(0.0_JPRB,SIGN(1.0_JPRB,YDCST%RTT-PTARG)))*LOG(PTARG))

!     ------------------------------------------------------------------
!     FONCTIONS THERMODYNAMIQUES : FONCTIONS DEFINIES DE LA PHYSIQUE .


!     FONCTION DE LA TENSION DE VAPEUR SATURANTE .
!        INPUT : PTARG = TEMPERATURE
!                PDELARG = 0 SI EAU (QUELQUE SOIT PTARG)
!                          1 SI GLACE (QUELQUE SOIT PTARG).
REAL(KIND=JPRB) :: FOEW
REAL(KIND=JPRB) :: PDELARG
FOEW ( PTARG,PDELARG ) = EXP (&
    &( YDCST%RALPW+PDELARG*YDCST%RALPD )&
  &- ( YDCST%RBETW+PDELARG*YDCST%RBETD ) / PTARG &
  &- ( YDCST%RGAMW+PDELARG*YDCST%RGAMD ) * LOG(PTARG) )

!     FONCTION DERIVEE DU LOGARITHME NEPERIEN DE LA PRECEDENTE (FOEW) .
!        INPUT : PTARG = TEMPERATURE
!                PDELARG = 0 SI EAU (QUELQUE SOIT PTARG)
!                          1 SI GLACE (QUELQUE SOIT PTARG).
REAL(KIND=JPRB) :: FODLEW
FODLEW ( PTARG,PDELARG ) = (&
      &( YDCST%RBETW+PDELARG*YDCST%RBETD )&
    &- ( YDCST%RGAMW+PDELARG*YDCST%RGAMD ) * PTARG )&
    &/ ( PTARG*PTARG )

!     FONCTION HUMIDITE SPECIFIQUE SATURANTE .
!        INPUT : PESPFAR = RAPPORT FOEW SUR PRESSION.
REAL(KIND=JPRB) :: FOQS
REAL(KIND=JPRB) :: PESPFAR
FOQS ( PESPFAR ) = PESPFAR / ( 1.0_JPRB+YDCST%RETV*MAX(0.0_JPRB,&
    &(1.0_JPRB-PESPFAR)) )

!     FONCTION HUMIDITE SPECIFIQUE SATURANTE, COMME FONCTION DIRECTE DE T ET P.
!        INPUT : PTARG  = TEMPERATURE.
!                PPRESS = PRESSION.
REAL(KIND=JPRB) :: FOQSTP
REAL(KIND=JPRB) :: PPRESS
FOQSTP(PTARG,PPRESS)=FOQS(FOEW(PTARG,MAX(0.0_JPRB,SIGN(1.0_JPRB,YDCST%RTT-PTARG)))/PPRESS)

!     FONCTION DERIVEE EN TEMPERATURE DE LA PRECEDENTE (FOQS) .
!        INPUT : PQSFARG = FOQS
!                PESPFAR = RAPPORT FOEW SUR PRESSION
!                PDLEFAR = FODLEW.
REAL(KIND=JPRB) :: FODQS 
REAL(KIND=JPRB) :: PQSFARG,PDLEFAR 
FODQS ( PQSFARG,PESPFAR,PDLEFAR ) = ( PQSFARG &
   &* (1.0_JPRB-PQSFARG)*PDLEFAR ) / (1.0_JPRB-PESPFAR)

!     FONCTION COMPOSE DE FODQS ET FOQS AVEC SIMPLIFICATION DU TERME (1-PESPFAR) POUR EVITER LES OVERFLOWS
!     FDQW (PESPFAR, PDLEFAR) = FODQS (FOQS (PESPFAR), PESPFAR, PDLEFAR)
!        INPUT : PESPFAR = RAPPORT FOEW SUR PRESSION
!                PDLEFAR = FODLEW
REAL(KIND=JPRB) :: FDQW
FDQW (PESPFAR, PDLEFAR) = PDLEFAR * PESPFAR * (1.0_JPRB+YDCST%RETV) / ( 1.0_JPRB+YDCST%RETV*MAX(0.0_JPRB,(1.0_JPRB-PESPFAR)) ) ** 2._JPRB
!     FONCTION CHALEUR LATENTE .
!        INPUT : PTARG = TEMPERATURE
!                PDELARG = 0 SI EAU (QUELQUE SOIT PTARG)
!                          1 SI GLACE (QUELQUE SOIT PTARG).
REAL(KIND=JPRB) :: FOLH
FOLH ( PTARG,PDELARG ) =  YDCST%RV * (&
    &( YDCST%RBETW+PDELARG*YDCST%RBETD )&
  &- ( YDCST%RGAMW+PDELARG*YDCST%RGAMD ) * PTARG )
!     ------------------------------------------------------------------

