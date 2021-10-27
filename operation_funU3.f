	module operation_funU3
        contains
        complex function f_U3(U3)
        implicit none
        include 'ilan.inc'
        real U3
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U3=zhank1(alog(U3),kernel,1e-5,L)/U3**2
        end function f_U3
        end module operation_funU3
