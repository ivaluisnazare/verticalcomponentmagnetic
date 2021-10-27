	module operation_funR3
        contains
        complex function f_R3(R3)
        implicit none
        include 'ilan.inc'
        real R3
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R3=zhank1(alog(R3),kernel,1e-5,L)/R3**2
        end function f_R3
        end module operation_funR3

