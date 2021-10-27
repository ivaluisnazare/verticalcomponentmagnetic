	module operation_funU7
        contains
        complex function f_U7(U7)
        implicit none
        include 'ilan.inc'
        real U7
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U7=zhank1(alog(U7),kernel,1e-5,L)/U7**2
        end function f_U7
        end module operation_funU7
