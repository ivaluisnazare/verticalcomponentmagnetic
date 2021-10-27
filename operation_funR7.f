	module operation_funR7
        contains
        complex function f_R7(R7)
        implicit none
        include 'ilan.inc'
        real R7
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R7=zhank1(alog(R7),kernel,1e-5,L)/R7**2
        end function f_R7
        end module operation_funR7

