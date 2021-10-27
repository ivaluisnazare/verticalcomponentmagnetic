	module operation_funD10
        contains
        complex function f_D10(D10)
        implicit none
        include 'ilan.inc'
        real D10
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D10=zhank1(alog(D10),kernel,1e-5,L)/D10**2
        end function f_D10
        end module operation_funD10

