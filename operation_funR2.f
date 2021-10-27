	module operation_funR2
        contains
        complex function f_R2(R2)
        implicit none
        include 'ilan.inc'
        real R2
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R2=zhank1(alog(R2),kernel,1e-5,L)/R2**2
        end function f_R2
        end module operation_funR2

