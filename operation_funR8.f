	module operation_funR8
        contains
        complex function f_R8(R8)
        implicit none
        include 'ilan.inc'
        real R8
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_R8=zhank1(alog(R8),kernel,1e-5,L)/R8**2
        end function f_R8
        end module operation_funR8

