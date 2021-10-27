# Makefile
#
#
objectos=zhank1.o operation_ute.o operation_rte.o operation_kernel.o \
	operation_funA0.o operation_funA1.o operation_funA2.o \
        operation_funA3.o operation_funA4.o operation_funA5.o \
        operation_funA6.o operation_funA7.o operation_funA8.o \
        operation_funA9.o operation_funA10.o operation_funD0.o \
        operation_funD1.o operation_funD2.o operation_funD3.o \
        operation_funD4.o operation_funD5.o operation_funD6.o \
        operation_funD7.o operation_funD8.o operation_funD9.o \
        operation_funD10.o operation_funR0.o operation_funR1.o \
	operation_funR2.o operation_funR3.o operation_funR4.o \
	operation_funR5.o operation_funR6.o operation_funR7.o \
	operation_funR8.o operation_funR9.o operation_funR10.o \
	operation_funU0.o operation_funU1.o operation_funU2.o \
	operation_funU3.o operation_funU4.o operation_funU5.o \
	operation_funU6.o operation_funU7.o operation_funU8.o \
	operation_funU9.o operation_funU10.o operation_flef.o \
	operation_fD.o operation_fR.o operation_fU.o main.o
FH= gfortran
wolf: $(objectos)
	$(FH) -o wolf $(objectos)
zhank1.o:zhank1.f
	$(FH) -c zhank1.f
operation_ute.o:operation_ute.f
	$(FH) -c operation_ute.f
operation_rte.o:operation_rte.f
	$(FH) -c operation_rte.f
operation_kernel.o:operation_kernel.f
	$(FH) -c operation_kernel.f
operation_funA0.o:operation_funA0.f
	$(FH) -c operation_funA0.f
operation_funA1.o:operation_funA1.f
	$(FH) -c operation_funA1.f
operation_funA2.o:operation_funA2.f
	$(FH) -c operation_funA2.f
operation_funA3.o:operation_funA3.f
	$(FH) -c operation_funA3.f
operation_funA4.o:operation_funA4.f
	$(FH) -c operation_funA4.f
operation_funA5.o:operation_funA5.f
	$(FH) -c operation_funA5.f
operation_funA6.o:operation_funA6.f
	$(FH) -c operation_funA6.f
operation_funA7.o:operation_funA7.f
	$(FH) -c operation_funA7.f
operation_funA8.o:operation_funA8.f
	$(FH) -c operation_funA8.f
operation_funA9.o:operation_funA9.f
	$(FH) -c operation_funA9.f
operation_funA10.o:operation_funA10.f
	$(FH) -c operation_funA10.f
operation_funD0.o:operation_funD0.f
	$(FH) -c operation_funD0.f
operation_funD1.o:operation_funD1.f
	$(FH) -c operation_funD1.f
operation_funD2.o:operation_funD2.f
	$(FH) -c operation_funD2.f
operation_funD3.o:operation_funD3.f
	$(FH) -c operation_funD3.f
operation_funD4.o:operation_funD4.f
	$(FH) -c operation_funD4.f
operation_funD5.o:operation_funD5.f
	$(FH) -c operation_funD5.f
operation_funD6.o:operation_funD6.f
	$(FH) -c operation_funD6.f
operation_funD7.o:operation_funD7.f
	$(FH) -c operation_funD7.f
operation_funD8.o:operation_funD8.f
	$(FH) -c operation_funD8.f
operation_funD9.o:operation_funD9.f
	$(FH) -c operation_funD9.f
operation_funD10.o:operation_funD10.f
	$(FH) -c operation_funD10.f
operation_funR0.o:operation_funR0.f
	$(FH) -c operation_funR0.f
operation_funR1.o:operation_funR1.f
	$(FH) -c operation_funR1.f
operation_funR2.o:operation_funR2.f
	$(FH) -c operation_funR2.f
operation_funR3.o:operation_funR3.f
	$(FH) -c operation_funR3.f
operation_funR4.o:operation_funR4.f
	$(FH) -c operation_funR4.f
operation_funR5.o:operation_funR5.f
	$(FH) -c operation_funR5.f
operation_funR6.o:operation_funR6.f
	$(FH) -c operation_funR6.f
operation_funR7.o:operation_funR7.f
	$(FH) -c operation_funR7.f
operation_funR8.o:operation_funR8.f
	$(FH) -c operation_funR8.f
operation_funR9.o:operation_funR9.f
	$(FH) -c operation_funR9.f
operation_funR10.o:operation_funR10.f
	$(FH) -c operation_funR10.f
operation_funU0.o:operation_funU0.f
	$(FH) -c operation_funU0.f
operation_funU1.o:operation_funU1.f
	$(FH) -c operation_funU1.f
operation_funU2.o:operation_funU2.f
	$(FH) -c operation_funU2.f
operation_funU3.o:operation_funU3.f
	$(FH) -c operation_funU3.f
operation_funU4.o:operation_funU4.f
	$(FH) -c operation_funU4.f
operation_funU5.o:operation_funU5.f
	$(FH) -c operation_funU5.f
operation_funU6.o:operation_funU6.f
	$(FH) -c operation_funU6.f
operation_funU7.o:operation_funU7.f
	$(FH) -c operation_funU7.f
operation_funU8.o:operation_funU8.f
	$(FH) -c operation_funU8.f
operation_funU9.o:operation_funU9.f
	$(FH) -c operation_funU9.f
operation_funU10.o:operation_funU10.f
	$(FH) -c operation_funU10.f
operation_flef.o:operation_flef.f
	$(FH) -c operation_flef.f
operation_fD.o:operation_fD.f
	$(FH) -c operation_fD.f
operation_fR.o:operation_fR.f
	$(FH) -c operation_fR.f
operation_fU.o:operation_fU.f
	$(FH) -c operation_fU.f
main.o:main.f
	$(FH) -c main.f

clean:
	rm -rf *.o































































