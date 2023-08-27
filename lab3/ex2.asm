.data
onethree: .float 0.3333
half: .float 0.5
a: .asciiz"Enter a:\t"
b: .asciiz"Enter b:\t"
c: .asciiz"Enter c:\t"
v: .asciiz"Enter v:\t"
u: .asciiz"Enter u:\t"


#a,b,c,u,v,1/2,1/3,F(u),F(v),result: is $f1,2,3,4,5,6,7,10,11,12
#$f9 is temp
.text
INPUT: 
la $a0, a
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall
mov.s $f1,$f0

la $a0, b
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall
mov.s $f2,$f0

la $a0, c
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall
mov.s $f3,$f0

la $a0, u
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall
mov.s $f4,$f0

la $a0, v
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall
mov.s $f5,$f0

l.s $f6,half
l.s $f7,onethree

CALCULATE:
#for V
	#ax^3/2
	mul.s $f9,$f1,$f7
	mul.s $f9,$f9,$f5
	mul.s $f9,$f9,$f5
	mul.s $f9,$f9,$f5
	add.s $f11,$f11,$f9

	#bx^2/2
	mul.s $f9,$f2,$f6
	mul.s $f9,$f9,$f5
	mul.s $f9,$f9,$f5
	add.s $f11,$f11,$f9
	
	#cx
	mul.s $f9,$f3,$f5
	add.s $f11,$f11,$f9

#for U
	#ax^3/2
	mul.s $f9,$f1,$f7
	mul.s $f9,$f9,$f4
	mul.s $f9,$f9,$f4
	mul.s $f9,$f9,$f4
	add.s $f10,$f10,$f9

	#bx^2/2
	mul.s $f9,$f2,$f6
	mul.s $f9,$f9,$f4
	mul.s $f9,$f9,$f4
	add.s $f10,$f10,$f9
	
	#cx
	mul.s $f9,$f3,$f4
	add.s $f10,$f10,$f9

#result + print:
	sub.s $f12,$f11,$f10
	li $v0,2 #print single precision
	syscall

END:	
	li	$v0,10
	syscall