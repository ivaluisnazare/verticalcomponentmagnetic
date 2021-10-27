

	module operation_ute

	contains

 
	complex function ute(lambda,i)

              
	implicit none
	include 'ilan.inc'
	real lambda
	integer i

 		  
	ute=sqrt(lambda*lambda+cone*omega*mu_zero(i)*sgma(i))
	if (real(ute).lt.0.0) ute=-ute
	end  function ute
	end module operation_ute

