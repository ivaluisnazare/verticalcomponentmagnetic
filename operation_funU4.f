	module operation_funU4
        contains
        complex function f_U4(U4)
        implicit none
        include 'ilan.inc'
        real U4
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U4=zhank1(alog(U4),kernel,1e-5,L)/U4**2
        end function f_U4
        end module operation_funU4
