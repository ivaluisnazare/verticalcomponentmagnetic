	module operation_funR9
        contains
        complex function f_R9(R9)
        implicit none
        include 'ilan.inc'
        real R9
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R9=zhank1(alog(R9),kernel,1e-5,L)/R9**2
        end function f_R9
        end module operation_funR9

