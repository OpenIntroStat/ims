CC <- matrix(c(3511, 1749, 1818,
			  1489,  751,  682), 2, byrow=TRUE)
RT <- apply(CC, 1, sum)
CT <- apply(CC, 2, sum)
E <- matrix(1/sum(CC), 2, 3, byrow=TRUE)
E <- RT*E*rep(CT, rep(2,3))

(CC - E)^2/E
sum((CC - E)^2/E)
