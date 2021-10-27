	module operation_funU9
        contains
        complex function f_U9(U9)
        implicit none
        include 'ilan.inc'
        real U9
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U9=zhank1(alog(U9),kernel,1e-5,L)/U9**2
        end function f_U9
        end module operation_funU9
