	complex function kernel(lambda)
	use operation_rte

	implicit none 
	include 'ilan.inc'

	real lambda
	kernel=lambda*(1+rte(lambda))*exp(-lambda*z)

	end function kernel


