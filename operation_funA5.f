	module operation_funA5
        contains
        complex function f_A5(A5)
        implicit none
        include 'ilan.inc'
        real A5
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A5=zhank1(alog(A5),kernel,1e-5,L)/A5**2
        end function f_A5
        end module operation_funA5
