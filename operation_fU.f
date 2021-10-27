	module operation_fU
        contains

        complex function fU(ph,U0,U1,U2,U3,U4,U5,U6,U7,U8,U9,U10)
        use operation_funU0
        use operation_funU1
        use operation_funU2
        use operation_funU3
        use operation_funU4
        use operation_funU5
        use operation_funU6
        use operation_funU7
        use operation_funU8
        use operation_funU9
        use operation_funU10

        implicit none
        include 'ilan.inc'
        real ph,U0,U1,U2,U3,U4,U5,U6,U7,U8,U9,U10
        complex iter_fu1,iter_fu2,itu

        iter_fu1=f_U1(U1)+f_U2(U2)+f_U3(U3)+f_U4(U4)
        iter_fu2=f_U5(U5)+f_U6(U6)+f_U7(U7)+f_U8(U8)+f_U9(U9)


        itu=(iter_fu1+iter_fu2)


        fU=ph*(f_U0(U0)+2*(itu)+f_U10(U10))/2

        end function fU
        end module operation_fU

