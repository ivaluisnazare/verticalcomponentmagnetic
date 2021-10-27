	module operation_funU5
        contains
        complex function f_U5(U5)
        implicit none
        include 'ilan.inc'
        real U5
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U5=zhank1(alog(U5),kernel,1e-5,L)/U5**2
        end function f_U5
        end module operation_funU5
