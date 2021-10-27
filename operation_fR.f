	module operation_fR
        contains

        complex function fR(p_v,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10)
        use operation_funR0
        use operation_funR1
        use operation_funR2
        use operation_funR3
        use operation_funR4
        use operation_funR5
        use operation_funR6
        use operation_funR7
        use operation_funR8
        use operation_funR9
        use operation_funR10

        implicit none
        include 'ilan.inc'
        real p_v,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10
        complex iter_fr1,iter_fr2,itr

        iter_fr1=f_R1(R1)+f_R2(R2)+f_R3(R3)+f_R4(R4)
        iter_fr2=f_R5(R5)+f_R6(R6)+f_R7(R7)+f_R8(R8)+f_R9(R9)


        itr=(iter_fr1+iter_fr2)


        fR=p_v*(f_R0(R0)+2*(itr)+f_R10(R10))/2

        end function fR
        end module operation_fR
