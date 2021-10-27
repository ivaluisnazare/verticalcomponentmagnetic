	module operation_funD4
        contains
        complex function f_D4(D4)
        implicit none
        include 'ilan.inc'
        real D4
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D4=zhank1(alog(D4),kernel,1e-5,L)/D4**2
        end function f_D4
        end module operation_funD4

