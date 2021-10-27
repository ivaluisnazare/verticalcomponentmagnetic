	module operation_funA2
        contains
        complex function f_A2(A2)
        implicit none
        include 'ilan.inc'
        real A2
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A2=zhank1(alog(A2),kernel,1e-5,L)/A2**2
        end function f_A2
        end module operation_funA2
