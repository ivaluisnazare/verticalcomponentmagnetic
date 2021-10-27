	module operation_fD
        contains

        complex function fD(ph,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10)
        use operation_funD0
        use operation_funD1
        use operation_funD2
        use operation_funD3
        use operation_funD4
        use operation_funD5
        use operation_funD6
        use operation_funD7
        use operation_funD8
        use operation_funD9
        use operation_funD10

        implicit none
        include 'ilan.inc'
        real ph,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10
        complex iter_fd1,iter_fd2,itd

        iter_fd1=f_D1(D1)+f_D2(D2)+f_D3(D3)+f_D4(D4)
        iter_fd2=f_D5(D5)+f_D6(D6)+f_D7(D7)+f_D8(D8)+f_D9(D9)


        itd=(iter_fd1+iter_fd2)


        fD=ph*(f_D0(D0)+2*(itd)+f_D10(D10))/2

        end function fD
        end module operation_fD
