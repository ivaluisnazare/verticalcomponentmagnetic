	program main

        use operation_flef
        use operation_fD
        use operation_fR
        use operation_fU

        implicit none
        include 'ilan.inc'

! definicao das variaveis
        integer i
        real freq
        real f_min, f_max, f_rate
        real y,x,a,b,p_v,ph,comp_x,comp_y

	real A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10
	real D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10
	real R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10
	real U0,U1,U2,U3,U4,U5,U6,U7,U8,U9,U10
        
        real ni,rad,grau,rate_H,dB
        real comp_one,comp_two
        complex H_z ,HA,HB,HC,HD  ,arg
        real Azone,Aztwo,Azero,Bzone,Bztwo,Bzero,Czone,Cztwo,Czero
        real Dzone,Dztwo,Dzero,Hzero_z
        real y_min,y_max,y_rate

        write(0,*) 'numero de camadas ?'
        read(5,*) nlayers

        do i=1,nlayers-1

        write(0,'(a,i3,a)') 'condutividade e espessura da camada',i,'?'
        read(5,*) sgma(i),h(i)
        mu_zero(i)=4*pi*1e-7
        enddo
        write(0,'(a,i3,a)') 'condutividade. da camada',nlayers,'?'
        read(5,*) sgma(nlayers)
        mu_zero(nlayers)=4*pi*1e-7


	! frequencia

!       write(0,*) 'frequencia: inicial(Hz),final (Hz),e freq_rate. ?'
!       read(5,*) f_min,f_max,f_rate 

        write(0,*) 'Escreva o valor da frequencia'
        read(5,*) freq

! geometria
        write(0,*) 'sobre os parametros: y_min,y_max,y_rate. ? '
        read(5,*) y_min,y_max,y_rate
        
        write(0,*) 'sobre o parametro geométrico: x'
        read(5,*) x
! comprimento da linha
        write(0,*) ' Escreva o valor do comprimento da linha vertical '
        read(5,*) comp_x
        write(0,*) ' Escreva o valor do comprimento da linha horizontal'
        read(5,*) comp_y


        z=1e-3

        
        a=comp_x/2
        b=comp_y/2
        comp_one=a
        comp_two=b
        p_v=(2*comp_one)/10
        ph=(2*comp_two)/10

        y=y_min
        do while (y.le.y_max)



	A0=sqrt((comp_one-x)**2+(b-y)**2)
        A1=sqrt((comp_one-p_v-x)**2+(b-y)**2)
        A2=sqrt((comp_one-2*p_v-x)**2+(b-y)**2)
        A3=sqrt((comp_one-3*p_v-x)**2+(b-y)**2)
        A4=sqrt((comp_one-4*p_v-x)**2+(b-y)**2)
        A5=sqrt((comp_one-5*p_v-x)**2+(b-y)**2)
	A6=sqrt((comp_one-6*p_v-x)**2+(b-y)**2)
	A7=sqrt((comp_one-7*p_v-x)**2+(b-y)**2)
	A8=sqrt((comp_one-8*p_v-x)**2+(b-y)**2)
	A9=sqrt((comp_one-9*p_v-x)**2+(b-y)**2)
	A10=sqrt((comp_one-10*p_v-x)**2+(b-y)**2)


        D0=sqrt((a-x)**2+(comp_two-y)**2)
        D1=sqrt((a-x)**2+(comp_two-ph-y)**2)
        D2=sqrt((a-x)**2+(comp_two-2*ph-y)**2)
        D3=sqrt((a-x)**2+(comp_two-3*ph-y)**2)
        D4=sqrt((a-x)**2+(comp_two-4*ph-y)**2)
        D5=sqrt((a-x)**2+(y-comp_two-5*ph)**2)
	D6=sqrt((a-x)**2+(comp_two-6*ph-y)**2)
	D7=sqrt((a-x)**2+(comp_two-7*ph-y)**2)
	D8=sqrt((a-x)**2+(comp_two-8*ph-y)**2)
	D9=sqrt((a-x)**2+(comp_two-9*ph-y)**2)
	D10=sqrt((a-x)**2+(comp_two-10*ph-y)**2)


	R0=sqrt((comp_one-x)**2+(b+y)**2)
        R1=sqrt((comp_one-p_v-x)**2+(b+y)**2)
        R2=sqrt((comp_one-2*p_v-x)**2+(b+y)**2)
        R3=sqrt((comp_one-3*p_v-x)**2+(b+y)**2)
        R4=sqrt((comp_one-4*p_v-x)**2+(b+y)**2)
        R5=sqrt((comp_one-5*p_v-x)**2+(b+y)**2)
	R6=sqrt((comp_one-6*p_v-x)**2+(b+y)**2)
	R7=sqrt((comp_one-7*p_v-x)**2+(b+y)**2)
	R8=sqrt((comp_one-8*p_v-x)**2+(b+y)**2)
	R9=sqrt((comp_one-9*p_v-x)**2+(b+y)**2)
	R10=sqrt((comp_one-10*p_v-x)**2+(b+y)**2)


	U0=sqrt((a+x)**2+(comp_two-y)**2)
        U1=sqrt((a+x)**2+(comp_two-ph-y)**2)
        U2=sqrt((a+x)**2+(comp_two-2*ph-y)**2)
        U3=sqrt((a+x)**2+(comp_two-3*ph-y)**2)
        U4=sqrt((a+x)**2+(comp_two-4*ph-y)**2)
        U5=sqrt((a+x)**2+(comp_two-5*ph-y)**2)
	U6=sqrt((a+x)**2+(comp_two-6*ph-y)**2)
	U7=sqrt((a+x)**2+(comp_two-7*ph-y)**2)
	U8=sqrt((a+x)**2+(comp_two-8*ph-y)**2)
	U9=sqrt((a+x)**2+(comp_two-9*ph-y)**2)
	U10=sqrt((a+x)**2+(comp_two-10*ph-y)**2)



!	freq=f_min
!	do while (freq.le.f_max)
        omega=pipi*freq
        

        HA=(b-y)*f_lef(p_v,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10)
        HB=(a-x)*fD(ph,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10)
        HC=(b+y)*fR(p_v,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10)
        HD=(a+x)*fU(ph,U0,U1,U2,U3,U4,U5,U6,U7,U8,U9,U10)

        H_z=-(HA+HB+HC+HD)

        Azone=((a-x)/(sqrt((a-x)**2+(b-y)**2)))
        Aztwo=((a+x)/(sqrt((a+x)**2+(b-y)**2)))
        Azero=-(Azone+Aztwo)/(b-y)
        
        Bzone=((b+y)/(sqrt((b+y)**2+(a-x)**2)))
        Bztwo=((b-y)/(sqrt((b-y)**2+(a-x)**2)))
        Bzero=-(Bzone+bztwo)/(a-x)

        Czone=((a+x)/(sqrt((a+x)**2+(b+y)**2)))
        Cztwo=((a-x)/(sqrt((a-x)**2+(b+y)**2)))
        Czero=-(Czone+Cztwo)/(b+y)
        
        Dzone=((b-y)/(sqrt((b-y)**2+(a+x)**2)))
        Dztwo=((b+y)/(sqrt((b+y)**2+(a+x)**2)))
        Dzero=-(Dzone+Dztwo)/(a+x)

        Hzero_z=(Azero+Bzero+Czero+Dzero)

	dB=20*log10(abs(H_z)/Hzero_z)
        rate_H=abs(H_z)/Hzero_z
        rad=sqrt(x**2+y**2)
        ni=sqrt(omega*mu_zero(i)*abs(sgma(i))/2)*rad
        arg=(-cone*log(H_z/abs(H_z)))
        grau=(real(arg)*180)/pi

	write(10,*) y, grau

        y=y*y_rate
!	freq=freq*f_rate
        end do

        end




