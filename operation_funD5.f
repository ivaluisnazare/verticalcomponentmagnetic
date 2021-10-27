	module operation_funD5
        contains
        complex function f_D5(D5)
        implicit none
        include 'ilan.inc'
        real D5
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D5=zhank1(alog(D5),kernel,1e-5,L)/D5**2
        end function f_D5
        end module operation_funD5

