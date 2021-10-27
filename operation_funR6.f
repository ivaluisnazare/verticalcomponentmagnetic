	module operation_funR6
        contains
        complex function f_R6(R6)
        implicit none
        include 'ilan.inc'
        real R6
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R6=zhank1(alog(R6),kernel,1e-5,L)/R6**2
        end function f_R6
        end module operation_funR6

