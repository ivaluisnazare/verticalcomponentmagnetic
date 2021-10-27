	module operation_funD3
        contains
        complex function f_D3(D3)
        implicit none
        include 'ilan.inc'
        real D3
        complex zhank1,kernel
        external zhank1,kernel
        integer L

        f_D3=zhank1(alog(D3),kernel,1e-5,L)/D3**2
        end function f_D3
        end module operation_funD3

