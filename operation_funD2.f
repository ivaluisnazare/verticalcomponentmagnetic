	module operation_funD2
        contains
        complex function f_D2(D2)
        implicit none
        include 'ilan.inc'
        real D2
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D2=zhank1(alog(D2),kernel,1e-5,L)/D2**2
        end function f_D2
        end module operation_funD2

