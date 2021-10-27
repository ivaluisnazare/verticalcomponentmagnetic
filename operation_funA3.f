	module operation_funA3
        contains
        complex function f_A3(A3)
        implicit none
        include 'ilan.inc'
        real A3
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A3=zhank1(alog(A3),kernel,1e-5,L)/A3**2
        end function f_A3
        end module operation_funA3
