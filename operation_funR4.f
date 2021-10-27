	module operation_funR4
        contains
        complex function f_R4(R4)
        implicit none
        include 'ilan.inc'
        real R4
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R4=zhank1(alog(R4),kernel,1e-5,L)/R4**2
        end function f_R4
        end module operation_funR4

