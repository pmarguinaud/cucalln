#!/bin/bash

export PATH=/home/gmap/mrpm/marguina/fxtran-acdc/bin:$PATH

for f in \
  model_physics_ecmwf_mod.F90 model_physics_simplinear_mod.F90 \
  yoecld.F90 yoecldp.F90 yoecnd.F90 yoe_cuconvca.F90 yoecumf2.F90 yoecumf.F90   \
  yoegwd.F90 yoegwdwms.F90 yoegwwms.F90 yoephli.F90 yoephy.F90 yoerad.F90   \
  yoe_spectral_planck.F90 yoethf.F90 yomcst.F90 yomcumfs.F90 yomncl.F90   \
  yomsphyhist.F90 yomsrftlad.F90 yom_ygfl.F90 yophlc.F90 yophnc.F90
do 
  generateStructureMethods.pl \
  --skip-components=TEPHY%YSURF,TYPE_GFL_COMP%PREVIOUS,TYPE_GFLD%YCRM_NL,TYPE_GFLD%YAERO_WVL_DIAG_NL \
  --dir support --save --load --copy --wipe  support/$f
done


