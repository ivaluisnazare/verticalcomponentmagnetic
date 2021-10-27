


















       ! imaginario puro	
	  complex cone
	  parameter (cone=(0,1))
! constante pi
	  real pi,pipi
	  parameter (pi=3.141592654, pipi=2*pi)
! VARIAVEIS E CONJUNTOS DO PROBLEMA
! nlayer e´ o numero de camadas a calcular
	  integer nlayers
! propriedades fisicas
	  integer maxlayers
	  parameter (maxlayers=10)
	  real omega,z, h(maxlayers)
	  complex sgma(maxlayers)
	
	  real  mu_zero(maxlayers)
	 
	 
	  common /properties/ omega,nlayers,h,sgma,mu_zero,z
 
   			

   			
