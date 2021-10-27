	module operation_funA9
        contains
        complex function f_A9(A9)
        implicit none
        include 'ilan.inc'
        real A9
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A9=zhank1(alog(A9),kernel,1e-5,L)/A9**2
        end function f_A9
        end module operation_funA9
