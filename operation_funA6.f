	module operation_funA6
        contains
        complex function f_A6(A6)
        implicit none
        include 'ilan.inc'
        real A6
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A6=zhank1(alog(A6),kernel,1e-5,L)/A6**2
        end function f_A6
        end module operation_funA6
