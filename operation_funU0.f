	module operation_funU0
        contains
        complex function f_U0(U0)
        implicit none
        include 'ilan.inc'
        real U0
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U0=zhank1(alog(U0),kernel,1e-5,L)/U0**2
        end function f_U0
        end module operation_funU0

