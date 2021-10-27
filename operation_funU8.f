	module operation_funU8
        contains
        complex function f_U8(U8)
        implicit none
        include 'ilan.inc'
        real U8
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U8=zhank1(alog(U8),kernel,1e-5,L)/U8**2
        end function f_U8
        end module operation_funU8
