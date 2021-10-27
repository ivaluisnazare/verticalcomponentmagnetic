	module operation_funD8
        contains
        complex function f_D8(D8)
        implicit none
        include 'ilan.inc'
        real D8
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D8=zhank1(alog(D8),kernel,1e-5,L)/D8**2
        end function f_D8
        end module operation_funD8

