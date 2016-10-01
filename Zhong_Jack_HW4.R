## @author Jack ZHong
## Date: 9/29/2016


#1. Create	the	vectors:
#   a) (1,2,3,...,19,20)
    c(1:20)

#   b) (20,19,...,2,1)
    c(20:1)
    
#   c) (1,2,3,...,19,20,19,18,...,2,1)	
    c(1:20,19:1)
    
#   d) (4,	6,	3)	and	assign	it	to	the	name	tmp.	
    tmp <- c(4, 6, 3)    

#   For	parts	(e),	(f)	and	(g)	look	at	the	help	for	the	function	rep.	
#   e) (4,6,3,	4,6,3,...,4,6,3)	where	there	are	10	occurrences	of	4.	
    rep(tmp, 10)
    
#   f) (4,6,3,	4,6,3,...,4,6,3,4)	where	there	are	11	occurrences	of	4,	10	
#   occurrences	of	6	and	10	occurrences	of	3.	
    rep(tmp,l=31)
    
#   g) (4,4,...,4,	6,6,...,6,	3,3,...,3)	where	there	are	10	occurrences	of	4,	20	
#   occurrences	of	6	and	30	occurrences	of	3.	
    c(rep(4,10), rep(6,20), rep(3,30))

#2. Create	a	vector	of	the	values	of	e^x*cos(x)	at	x	=	3,3.1,3.2,...,5.9,6
    x = seq(3,6, by=.1)
    c(exp(x)*cos(x))
    
#3. a)
    a = seq(3,36,by=3)
    b = seq(1,34,by=3)
    c(0.1^a*0.2^b)
#   b)
    c = 1:25
    c(2^c/c)
    
#4. a)
    i = 10:100
    sum(i^3+4*i^2)
#   b)
    i2 = 1:25
    sum(2^i2/i2+3^i2/i2^2)
    
#5. Use	the	function	paste	to	create	the	following	character	vectors	of length	30:
#   a) ("label	1",	"label	2",	.....,	"label	30"). Note	that	there	is	a	single	space	
#   between	label	and	the	number	following.
    paste("label", 1:30, sep=" ")
    
#   b) ("fn1",	"fn2",	...,	"fn30").	In	this	case,	there	is	no	space	between	fn	
#   and	the	number	following.
    paste('fn', 1:30, sep="")
    
#6.
    set.seed(50)
    xVec <- sample(0:999, 250, replace=T)
    yVec <- sample(0:999, 250, replace=T)
#   a)
    yVec[-1]-xVec[-250]
    
#   b)
    sin(yVec[-250])/cos(xVec[-1])
    
#   c)
    xVec[-c(249,250)]+2*xVec[-c(1,250)]-xVec[-c(1,2)]
    
#   d)
    i <- 1:249
    sum(exp(-xVec[-1])/(xVec[-250]+10))
    
#7.  This question uses the vectors xVec and yVec created in the previous
#    question and the functions sort, order, mean, sqrt, sum and abs.
#    a) Pick out the values in yVec which are > 600.
     yVec[yVec>600]
     
#    b) What are the index positions in yVec of the values which are > 600?
     which(yVec>600)

#    c) What are the values in xVec which correspond to the values in yVec
#    which are > 600? (By correspond, we mean at the same index positions.)
     xVec[yVec>600]
     
#    d) Create the vector ( |x1 ??? ????|1/2, |x2 ??? ????|1/2, . . . , |xn ??? ????|1/2) where ????
#    denotes the mean of the vector x = (x1,x2,...,xn).
     sqrt(abs(xVec-mean(xVec)))

#    e) How many values in yVec are within 200 of the maximum value of
#    the terms in yVec?
     sum(yVec>max(yVec)-200)
     
#    f) How many numbers in xVec are divisible by 2? (Note that the mod
#    operator is denoted %%.)
     sum(xVec%%2==0)

#    g) Sort the numbers in the vector xVec in the order of increasing values
#    in yVec.
     xVec[order(yVec)]

#    h) Pick out the elements in yVec at index positions 1,4,7,10,13,.
     yVec[c(T,F,F)]

#8.  By using the function cumprod or otherwise, calculate:     
     1 + sum(cumprod(seq(2,38,by=2))/seq(3,39,by=2))
