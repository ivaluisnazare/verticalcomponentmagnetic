	module operation_funD7
        contains
        complex function f_D7(D7)
        implicit none
        include 'ilan.inc'
        real D7
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D7=zhank1(alog(D7),kernel,1e-5,L)/D7**2
        end function f_D7
        end module operation_funD7

