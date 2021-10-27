	module operation_funA1
        contains
        complex function f_A1(A1)
        implicit none
        include 'ilan.inc'
        real A1
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_A1=zhank1(alog(A1),kernel,1e-5,L)/A1**2
        end function f_A1
        end module operation_funA1
