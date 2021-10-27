	module operation_funD9
        contains
        complex function f_D9(D9)
        implicit none
        include 'ilan.inc'
        real D9
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D9=zhank1(alog(D9),kernel,1e-5,L)/D9**2
        end function f_D9
        end module operation_funD9

