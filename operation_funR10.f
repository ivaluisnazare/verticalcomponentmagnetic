	module operation_funR10
        contains
        complex function f_R10(R10)
        implicit none
        include 'ilan.inc'
        real R10
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R10=zhank1(alog(R10),kernel,1e-5,L)/R10**2
        end function f_R10
        end module operation_funR10

