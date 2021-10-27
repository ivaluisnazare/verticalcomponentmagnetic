	module operation_funR1
        contains
        complex function f_R1(R1)
        implicit none
        include 'ilan.inc'
        real R1
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R1=zhank1(alog(R1),kernel,1e-5,L)/R1**2
        end function f_R1
        end module operation_funR1

