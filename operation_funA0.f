	module operation_funA0
        contains
        complex function f_A0(A0)
        implicit none
        include 'ilan.inc'
        real A0 
        complex zhank1,kernel 
        external zhank1,kernel
        integer L
    
        f_A0=zhank1(alog(A0),kernel,1e-5,L)/A0**2
        end function f_A0
        end module operation_funA0
