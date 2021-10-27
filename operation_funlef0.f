	module operation_funlef0
        contains
        complex function fun_lef0(E0)
        implicit none
        include 'ilan.inc'
        real E0
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        fun_lef0=zhank1(alog(E0),kernel,1e-5,L)/E0**2
        end function fun_lef0
	end module operation_funlef0
~                                   
