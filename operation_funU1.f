	module operation_funU1
        contains
        complex function f_U1(U1)
        implicit none
        include 'ilan.inc'
        real U1
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U1=zhank1(alog(U1),kernel,1e-5,L)/U1**2
        end function f_U1
        end module operation_funU1
