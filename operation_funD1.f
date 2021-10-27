	module operation_funD1
        contains
        complex function f_D1(D1)
        implicit none
        include 'ilan.inc'
        real D1
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D1=zhank1(alog(D1),kernel,1e-5,L)/D1**2
        end function f_D1
        end module operation_funD1

