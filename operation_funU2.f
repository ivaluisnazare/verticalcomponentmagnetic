	module operation_funU2
        contains
        complex function f_U2(U2)
        implicit none
        include 'ilan.inc'
        real U2
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U2=zhank1(alog(U2),kernel,1e-5,L)/U2**2
        end function f_U2
        end module operation_funU2
