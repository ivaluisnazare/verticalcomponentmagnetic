	module operation_funA7
        contains
        complex function f_A7(A7)
        implicit none
        include 'ilan.inc'
        real A7
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A7=zhank1(alog(A7),kernel,1e-5,L)/A7**2
        end function f_A7
        end module operation_funA7
