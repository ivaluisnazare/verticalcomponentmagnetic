	module operation_funU10
        contains
        complex function f_U10(U10)
        implicit none
        include 'ilan.inc'
        real U10
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_U10=zhank1(alog(U10),kernel,1e-5,L)/U10**2
        end function f_U10
        end module operation_funU10
