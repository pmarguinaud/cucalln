include Makefile.inc

./cuadjtq.intfb.ok: ./cuadjtq.intfb.h parkind1.o yomcst.o yoethf.o yoephli.o
	touch ./cuadjtq.intfb.ok

./cuadjtqs.intfb.ok: ./cuadjtqs.intfb.h parkind1.o yomcst.o yoethf.o
	touch ./cuadjtqs.intfb.ok

./cuascn.intfb.ok: ./cuascn.intfb.h parkind1.o yomcst.o yoethf.o yoecumf.o yoephli.o yoecldp.o yom_ygfl.o spp_mod.o
	touch ./cuascn.intfb.ok

./cubasen.intfb.ok: ./cubasen.intfb.h yoephli.o parkind1.o yomcst.o parphy.o yoecumf.o yoecldp.o yoethf.o spp_mod.o
	touch ./cubasen.intfb.ok

./cubasmcn.intfb.ok: ./cubasmcn.intfb.h parkind1.o yomcst.o yoecumf.o
	touch ./cubasmcn.intfb.ok

./cubidiag.intfb.ok: ./cubidiag.intfb.h parkind1.o
	touch ./cubidiag.intfb.ok

./cucalln_mf.intfb.ok: ./cucalln_mf.intfb.h model_physics_ecmwf_mod.o model_physics_simplinear_mod.o yoerad.o yom_ygfl.o parkind1.o yomcst.o yoethf.o
	touch ./cucalln_mf.intfb.ok

./cuccdia.intfb.ok: ./cuccdia.intfb.h parkind1.o yoephy.o yoerad.o yoephli.o
	touch ./cuccdia.intfb.ok

./cuctracer.intfb.ok: ./cuctracer.intfb.h parkind1.o yomcst.o yoecumf.o yoecumf2.o yomcumfs.o
	touch ./cuctracer.intfb.ok

./cuddrafn.intfb.ok: ./cuddrafn.intfb.h yoephli.o parkind1.o yomcst.o yoethf.o yoecumf.o
	touch ./cuddrafn.intfb.ok

./cudlfsn.intfb.ok: ./cudlfsn.intfb.h parkind1.o yomcst.o yoethf.o yoecumf.o yoephli.o
	touch ./cudlfsn.intfb.ok

./cudtdqn.intfb.ok: ./cudtdqn.intfb.h parkind1.o yomcst.o yoethf.o yoecumf.o yoephy.o yoephli.o yophnc.o
	touch ./cudtdqn.intfb.ok

./cududv.intfb.ok: ./cududv.intfb.h parkind1.o yomcst.o yoecumf.o spp_mod.o yompertpar.o
	touch ./cududv.intfb.ok

./cuentr.intfb.ok: ./cuentr.intfb.h parkind1.o yomcst.o yoecumf.o spp_mod.o
	touch ./cuentr.intfb.ok

./cuflxn.intfb.ok: ./cuflxn.intfb.h parkind1.o yomcst.o yoethf.o yoephli.o yoecumf.o
	touch ./cuflxn.intfb.ok

./cuinin.intfb.ok: ./cuinin.intfb.h parkind1.o yomcst.o yoethf.o yoecumf.o yoephli.o
	touch ./cuinin.intfb.ok

./cumastrn.intfb.ok: ./cumastrn.intfb.h model_physics_ecmwf_mod.o model_physics_simplinear_mod.o yom_ygfl.o parkind1.o yomcst.o yoethf.o spp_mod.o yomcape.o
	touch ./cumastrn.intfb.ok

./satur.intfb.ok: ./satur.intfb.h parkind1.o yomcst.o yoethf.o
	touch ./satur.intfb.ok

crmdims.o: crmdims.F90 parkind1.o
	$(FC) -c crmdims.F90

cuadjtq.o: cuadjtq.F90 parkind1.o yomcst.o yoethf.o yoephli.o abor1.intfb.ok fcttre.func.ok
	$(FC) -c cuadjtq.F90

cuadjtqs.o: cuadjtqs.F90 parkind1.o yomcst.o yoethf.o fcttre.func.ok
	$(FC) -c cuadjtqs.F90

cuascn.o: cuascn.F90 parkind1.o yomcst.o yoethf.o yoecumf.o yoephli.o yoecldp.o yom_ygfl.o spp_mod.o cuadjtq.intfb.ok cubasmcn.intfb.ok cuentr.intfb.ok fcttre.func.ok
	$(FC) -c cuascn.F90

cubasen.o: cubasen.F90 yoephli.o parkind1.o yomcst.o parphy.o yoecumf.o yoecldp.o yoethf.o spp_mod.o cuadjtq.intfb.ok fcttre.func.ok
	$(FC) -c cubasen.F90

cubasmcn.o: cubasmcn.F90 parkind1.o yomcst.o yoecumf.o
	$(FC) -c cubasmcn.F90

cubidiag.o: cubidiag.F90 parkind1.o
	$(FC) -c cubidiag.F90

cucalln_mf.o: cucalln_mf.F90 model_physics_ecmwf_mod.o model_physics_simplinear_mod.o yoerad.o yom_ygfl.o parkind1.o yomcst.o yoethf.o cuccdia.intfb.ok cumastrn.intfb.ok satur.intfb.ok fcttre.func.ok fcttrm.func.ok
	$(FC) -c cucalln_mf.F90

cuccdia.o: cuccdia.F90 parkind1.o yoephy.o yoerad.o yoephli.o
	$(FC) -c cuccdia.F90

cuctracer.o: cuctracer.F90 parkind1.o yomcst.o yoecumf.o yoecumf2.o yomcumfs.o cubidiag.intfb.ok
	$(FC) -c cuctracer.F90

cuddrafn.o: cuddrafn.F90 yoephli.o parkind1.o yomcst.o yoethf.o yoecumf.o cuadjtq.intfb.ok
	$(FC) -c cuddrafn.F90

cudlfsn.o: cudlfsn.F90 parkind1.o yomcst.o yoethf.o yoecumf.o yoephli.o cuadjtq.intfb.ok fcttre.func.ok
	$(FC) -c cudlfsn.F90

cudtdqn.o: cudtdqn.F90 parkind1.o yomcst.o yoethf.o yoecumf.o yoephy.o yoephli.o yophnc.o cubidiag.intfb.ok fcttre.func.ok
	$(FC) -c cudtdqn.F90

cududv.o: cududv.F90 parkind1.o yomcst.o yoecumf.o spp_mod.o yompertpar.o cubidiag.intfb.ok
	$(FC) -c cududv.F90

cuentr.o: cuentr.F90 parkind1.o yomcst.o yoecumf.o spp_mod.o
	$(FC) -c cuentr.F90

cuflxn.o: cuflxn.F90 parkind1.o yomcst.o yoethf.o yoephli.o yoecumf.o fcttre.func.ok
	$(FC) -c cuflxn.F90

cuinin.o: cuinin.F90 parkind1.o yomcst.o yoethf.o yoecumf.o yoephli.o cuadjtq.intfb.ok cuadjtqs.intfb.ok
	$(FC) -c cuinin.F90

cumastrn.o: cumastrn.F90 model_physics_ecmwf_mod.o model_physics_simplinear_mod.o yom_ygfl.o parkind1.o yomcst.o yoethf.o spp_mod.o yomcape.o cuascn.intfb.ok cubasen.intfb.ok cuddrafn.intfb.ok cudlfsn.intfb.ok cudtdqn.intfb.ok cududv.intfb.ok cuflxn.intfb.ok cuinin.intfb.ok cuctracer.intfb.ok fcttre.func.ok
	$(FC) -c cumastrn.F90

main_cucalln_mf.o: main_cucalln_mf.F90 model_physics_ecmwf_mod.o model_physics_simplinear_mod.o yoerad.o yom_ygfl.o parkind1.o yomcst.o yoethf.o util_model_physics_ecmwf_type_mod.o util_model_physics_simplinear_type_mod.o util_terad_mod.o util_type_gfld_mod.o util_tcst_mod.o util_tthf_mod.o cucalln_mf.intfb.ok
	$(FC) -c main_cucalln_mf.F90

model_physics_ecmwf_mod.o: model_physics_ecmwf_mod.F90 yoephy.o yoecld.o yoecldp.o yoecnd.o yoecumf.o yoe_cuconvca.o yoegwd.o yoegwwms.o yoethf.o
	$(FC) -c model_physics_ecmwf_mod.F90

model_physics_simplinear_mod.o: model_physics_simplinear_mod.F90 yoephli.o yomcumfs.o yoegwdwms.o yoecumf2.o yophlc.o yophnc.o yomncl.o yomsrftlad.o yomsphyhist.o
	$(FC) -c model_physics_simplinear_mod.F90

par_gfl.o: par_gfl.F90 parkind1.o crmdims.o
	$(FC) -c par_gfl.F90

parkind1.o: parkind1.F90 
	$(FC) -c parkind1.F90

parphy.o: parphy.F90 parkind1.o
	$(FC) -c parphy.F90

satur.o: satur.F90 parkind1.o yomcst.o yoethf.o fcttre.func.ok
	$(FC) -c satur.F90

spp_mod.o: spp_mod.F90 parkind1.o
	$(FC) -c spp_mod.F90

util_model_physics_ecmwf_type_mod.o: util_model_physics_ecmwf_type_mod.F90 model_physics_ecmwf_mod.o util_tecldp_mod.o util_tecld_mod.o util_tecnd_mod.o util_tecuconvca_mod.o util_tecumf_mod.o util_tegwd_mod.o util_tegwwms_mod.o util_tephy_mod.o util_tthf_mod.o
	$(FC) -c util_model_physics_ecmwf_type_mod.F90

util_model_physics_simplinear_type_mod.o: util_model_physics_simplinear_type_mod.F90 model_physics_simplinear_mod.o util_sphys_hist_type_mod.o util_tcumfs_mod.o util_tecumf2_mod.o util_tegwdwms_mod.o util_tephli_mod.o util_tncl_mod.o util_tphlc_mod.o util_tphnc_mod.o util_tsrftlad_mod.o
	$(FC) -c util_model_physics_simplinear_type_mod.F90

util_sphys_hist_type_mod.o: util_sphys_hist_type_mod.F90 yomsphyhist.o
	$(FC) -c util_sphys_hist_type_mod.F90

util_tcst_mod.o: util_tcst_mod.F90 yomcst.o
	$(FC) -c util_tcst_mod.F90

util_tcumfs_mod.o: util_tcumfs_mod.F90 yomcumfs.o
	$(FC) -c util_tcumfs_mod.F90

util_tecld_mod.o: util_tecld_mod.F90 yoecld.o
	$(FC) -c util_tecld_mod.F90

util_tecldp_mod.o: util_tecldp_mod.F90 yoecldp.o
	$(FC) -c util_tecldp_mod.F90

util_tecnd_mod.o: util_tecnd_mod.F90 yoecnd.o
	$(FC) -c util_tecnd_mod.F90

util_tecuconvca_mod.o: util_tecuconvca_mod.F90 yoe_cuconvca.o
	$(FC) -c util_tecuconvca_mod.F90

util_tecumf2_mod.o: util_tecumf2_mod.F90 yoecumf2.o
	$(FC) -c util_tecumf2_mod.F90

util_tecumf_mod.o: util_tecumf_mod.F90 yoecumf.o
	$(FC) -c util_tecumf_mod.F90

util_tegwd_mod.o: util_tegwd_mod.F90 yoegwd.o
	$(FC) -c util_tegwd_mod.F90

util_tegwdwms_mod.o: util_tegwdwms_mod.F90 yoegwdwms.o
	$(FC) -c util_tegwdwms_mod.F90

util_tegwwms_mod.o: util_tegwwms_mod.F90 yoegwwms.o
	$(FC) -c util_tegwwms_mod.F90

util_tephli_mod.o: util_tephli_mod.F90 yoephli.o
	$(FC) -c util_tephli_mod.F90

util_tephy_mod.o: util_tephy_mod.F90 yoephy.o
	$(FC) -c util_tephy_mod.F90

util_terad_mod.o: util_terad_mod.F90 yoerad.o util_tspectralplanck_mod.o
	$(FC) -c util_terad_mod.F90

util_tncl_mod.o: util_tncl_mod.F90 yomncl.o
	$(FC) -c util_tncl_mod.F90

util_tphlc_mod.o: util_tphlc_mod.F90 yophlc.o
	$(FC) -c util_tphlc_mod.F90

util_tphnc_mod.o: util_tphnc_mod.F90 yophnc.o
	$(FC) -c util_tphnc_mod.F90

util_tspectralplanck_mod.o: util_tspectralplanck_mod.F90 yoe_spectral_planck.o
	$(FC) -c util_tspectralplanck_mod.F90

util_tsrftlad_mod.o: util_tsrftlad_mod.F90 yomsrftlad.o
	$(FC) -c util_tsrftlad_mod.F90

util_tthf_mod.o: util_tthf_mod.F90 yoethf.o
	$(FC) -c util_tthf_mod.F90

util_type_gfl_comp_mod.o: util_type_gfl_comp_mod.F90 yom_ygfl.o
	$(FC) -c util_type_gfl_comp_mod.F90

util_type_gfl_naml_mod.o: util_type_gfl_naml_mod.F90 yom_ygfl.o
	$(FC) -c util_type_gfl_naml_mod.F90

util_type_gfld_mod.o: util_type_gfld_mod.F90 yom_ygfl.o util_type_gfl_comp_mod.o util_type_gfl_naml_mod.o
	$(FC) -c util_type_gfld_mod.F90

yoe_aerodiag.o: yoe_aerodiag.F90 parkind1.o
	$(FC) -c yoe_aerodiag.F90

yoe_cuconvca.o: yoe_cuconvca.F90 parkind1.o
	$(FC) -c yoe_cuconvca.F90

yoe_spectral_planck.o: yoe_spectral_planck.F90 parkind1.o
	$(FC) -c yoe_spectral_planck.F90

yoecld.o: yoecld.F90 parkind1.o
	$(FC) -c yoecld.F90

yoecldp.o: yoecldp.F90 parkind1.o
	$(FC) -c yoecldp.F90

yoecnd.o: yoecnd.F90 parkind1.o
	$(FC) -c yoecnd.F90

yoecumf.o: yoecumf.F90 parkind1.o
	$(FC) -c yoecumf.F90

yoecumf2.o: yoecumf2.F90 parkind1.o
	$(FC) -c yoecumf2.F90

yoegwd.o: yoegwd.F90 parkind1.o
	$(FC) -c yoegwd.F90

yoegwdwms.o: yoegwdwms.F90 parkind1.o
	$(FC) -c yoegwdwms.F90

yoegwwms.o: yoegwwms.F90 parkind1.o
	$(FC) -c yoegwwms.F90

yoephli.o: yoephli.F90 parkind1.o
	$(FC) -c yoephli.F90

yoephy.o: yoephy.F90 parkind1.o
	$(FC) -c yoephy.F90

yoerad.o: yoerad.F90 parkind1.o yoe_spectral_planck.o
	$(FC) -c yoerad.F90

yoethf.o: yoethf.F90 parkind1.o
	$(FC) -c yoethf.F90

yom_ygfl.o: yom_ygfl.F90 parkind1.o yoe_aerodiag.o par_gfl.o
	$(FC) -c yom_ygfl.F90

yomcape.o: yomcape.F90 parkind1.o
	$(FC) -c yomcape.F90

yomcst.o: yomcst.F90 parkind1.o
	$(FC) -c yomcst.F90

yomcumfs.o: yomcumfs.F90 
	$(FC) -c yomcumfs.F90

yomncl.o: yomncl.F90 parkind1.o
	$(FC) -c yomncl.F90

yompertpar.o: yompertpar.F90 parkind1.o
	$(FC) -c yompertpar.F90

yomsphyhist.o: yomsphyhist.F90 parkind1.o
	$(FC) -c yomsphyhist.F90

yomsrftlad.o: yomsrftlad.F90 parkind1.o
	$(FC) -c yomsrftlad.F90

yophlc.o: yophlc.F90 parkind1.o
	$(FC) -c yophlc.F90

yophnc.o: yophnc.F90 
	$(FC) -c yophnc.F90

main_cucalln_mf.x: main_cucalln_mf.o crmdims.o cuadjtq.o cuadjtqs.o cuascn.o cubasen.o cubasmcn.o cubidiag.o cucalln_mf.o cuccdia.o cuctracer.o cuddrafn.o cudlfsn.o cudtdqn.o cududv.o cuentr.o cuflxn.o cuinin.o cumastrn.o model_physics_ecmwf_mod.o model_physics_simplinear_mod.o par_gfl.o parkind1.o parphy.o satur.o spp_mod.o util_model_physics_ecmwf_type_mod.o util_model_physics_simplinear_type_mod.o util_sphys_hist_type_mod.o util_tcst_mod.o util_tcumfs_mod.o util_tecld_mod.o util_tecldp_mod.o util_tecnd_mod.o util_tecuconvca_mod.o util_tecumf2_mod.o util_tecumf_mod.o util_tegwd_mod.o util_tegwdwms_mod.o util_tegwwms_mod.o util_tephli_mod.o util_tephy_mod.o util_terad_mod.o util_tncl_mod.o util_tphlc_mod.o util_tphnc_mod.o util_tspectralplanck_mod.o util_tsrftlad_mod.o util_tthf_mod.o util_type_gfl_comp_mod.o util_type_gfl_naml_mod.o util_type_gfld_mod.o yoe_aerodiag.o yoe_cuconvca.o yoe_spectral_planck.o yoecld.o yoecldp.o yoecnd.o yoecumf.o yoecumf2.o yoegwd.o yoegwdwms.o yoegwwms.o yoephli.o yoephy.o yoerad.o yoethf.o yom_ygfl.o yomcape.o yomcst.o yomcumfs.o yomncl.o yompertpar.o yomsphyhist.o yomsrftlad.o yophlc.o yophnc.o
	$(FC) -o main_cucalln_mf.x main_cucalln_mf.o crmdims.o cuadjtq.o cuadjtqs.o cuascn.o cubasen.o cubasmcn.o cubidiag.o cucalln_mf.o cuccdia.o cuctracer.o cuddrafn.o cudlfsn.o cudtdqn.o cududv.o cuentr.o cuflxn.o cuinin.o cumastrn.o model_physics_ecmwf_mod.o model_physics_simplinear_mod.o par_gfl.o parkind1.o parphy.o satur.o spp_mod.o util_model_physics_ecmwf_type_mod.o util_model_physics_simplinear_type_mod.o util_sphys_hist_type_mod.o util_tcst_mod.o util_tcumfs_mod.o util_tecld_mod.o util_tecldp_mod.o util_tecnd_mod.o util_tecuconvca_mod.o util_tecumf2_mod.o util_tecumf_mod.o util_tegwd_mod.o util_tegwdwms_mod.o util_tegwwms_mod.o util_tephli_mod.o util_tephy_mod.o util_terad_mod.o util_tncl_mod.o util_tphlc_mod.o util_tphnc_mod.o util_tspectralplanck_mod.o util_tsrftlad_mod.o util_tthf_mod.o util_type_gfl_comp_mod.o util_type_gfl_naml_mod.o util_type_gfld_mod.o yoe_aerodiag.o yoe_cuconvca.o yoe_spectral_planck.o yoecld.o yoecldp.o yoecnd.o yoecumf.o yoecumf2.o yoegwd.o yoegwdwms.o yoegwwms.o yoephli.o yoephy.o yoerad.o yoethf.o yom_ygfl.o yomcape.o yomcst.o yomcumfs.o yomncl.o yompertpar.o yomsphyhist.o yomsrftlad.o yophlc.o yophnc.o $(LIBS)


subclean:
	\rm -f cuadjtq.o cuadjtqs.o cuascn.o cubasen.o cubasmcn.o cubidiag.o cucalln_mf.o cuccdia.o cuctracer.o cuddrafn.o cudlfsn.o cudtdqn.o cududv.o cuentr.o cuflxn.o cuinin.o cumastrn.o main_cucalln_mf.o satur.o

fyppclean: 
	\rm -f 

clean: 
	\rm -f *.o *.xml *.a *.x *.mod *.optrpt 

tidy:
	\rm -f *.xml *.optrpt
