	module operation_flef
	contains

	complex function f_lef(p_v,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10)
        use operation_funA0
        use operation_funA1
        use operation_funA2
        use operation_funA3
        use operation_funA4
        use operation_funA5
	use operation_funA6
	use operation_funA7
	use operation_funA8
	use operation_funA9
	use operation_funA10

	implicit none
        include 'ilan.inc'
        real p_v,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10
        complex iter_fl1,iter_fl2,f_itl
        iter_fl1=f_A1(A1)+f_A2(A2)+f_A3(A3)+f_A4(A4)
	iter_fl2=f_A5(A5)+f_A6(A6)+f_A7(A7)+f_A8(A8)+f_A9(A9)


	f_itl=(iter_fl1+iter_fl2)


	f_lef=p_v*(f_A0(A0)+2*(f_itl)+f_A10(A10))/2

	end function f_lef
	end module operation_flef



