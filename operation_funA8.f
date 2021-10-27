	module operation_funA8
        contains
        complex function f_A8(A8)
        implicit none
        include 'ilan.inc'
        real A8
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A8=zhank1(alog(A8),kernel,1e-5,L)/A8**2
        end function f_A8
        end module operation_funA8
