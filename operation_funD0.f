	module operation_funD0
        contains
        complex function f_D0(D0)
        implicit none
        include 'ilan.inc'
        real D0
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D0=zhank1(alog(D0),kernel,1e-5,L)/D0**2
        end function f_D0
        end module operation_funD0

