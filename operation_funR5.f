	module operation_funR5
        contains
        complex function f_R5(R5)
        implicit none
        include 'ilan.inc'
        real R5
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R5=zhank1(alog(R5),kernel,1e-5,L)/R5**2
        end function f_R5
        end module operation_funR5

