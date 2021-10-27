	module operation_funA4
        contains
        complex function f_A4(A4)
        implicit none
        include 'ilan.inc'
        real A4
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A4=zhank1(alog(A4),kernel,1e-5,L)/A4**2
        end function f_A4
        end module operation_funA4
