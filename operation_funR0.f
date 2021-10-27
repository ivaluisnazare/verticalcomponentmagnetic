	module operation_funR0
        contains
        complex function f_R0(R0)
        implicit none
        include 'ilan.inc'
        real R0
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R0=zhank1(alog(R0),kernel,1e-5,L)/R0**2
        end function f_R0
        end module operation_funR0

