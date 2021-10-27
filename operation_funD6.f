	module operation_funD6
        contains
        complex function f_D6(D6)
        implicit none
        include 'ilan.inc'
        real D6
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D6=zhank1(alog(D6),kernel,1e-5,L)/D6**2
        end function f_D6
        end module operation_funD6

