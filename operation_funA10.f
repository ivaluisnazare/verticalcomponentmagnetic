	module operation_funA10
        contains
        complex function f_A10(A10)
        implicit none
        include 'ilan.inc'
        real A10
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A10=zhank1(alog(A10),kernel,1e-5,L)/A10**2
        end function f_A10
        end module operation_funA10
