	module operation_rte

	contains                        		

	complex function rte(lambda)
	use operation_ute
	implicit none
	real lambda
	include "ilan.inc"
	integer n
	complex uhat_n, u_temp, ratio, expo
	uhat_n=ute(lambda,nlayers)
	do n=nlayers-1,1, -1
	u_temp=ute(lambda,n)
	ratio=(uhat_n-u_temp)/(uhat_n+u_temp)
	expo=ratio*exp(-2*u_temp*h(n))
	uhat_n=u_temp*(1+expo)/(1-expo)
	end do
	rte=(lambda-uhat_n)/(lambda+uhat_n)
	end function rte

	end module operation_rte

