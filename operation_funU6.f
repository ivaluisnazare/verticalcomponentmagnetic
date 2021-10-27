	module operation_funU6
        contains
        complex function f_U6(U6)
        implicit none
        include 'ilan.inc'
        real U6
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U6=zhank1(alog(U6),kernel,1e-5,L)/U6**2
        end function f_U6
        end module operation_funU6
