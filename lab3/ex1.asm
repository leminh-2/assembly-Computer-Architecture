.data
pi: .float 3.14
half: .float 0.5
choice: .asciiz "Enter the choice [1]circle|[2]triangle|[3]rectangle|[4]square:\t"
radius: .asciiz"Enter radius of circle:\t"
height: .asciiz"Enter height of triangle:\t"
base: .asciiz"Enter base of triangle:\t"
length: .asciiz"Enter length of rectangle:\t"
width: .asciiz"Enter width of rectangle:\t"
side: .asciiz"Enter side of square:\t"


.text
la $a0, choice
li $v0,4
syscall

li $v0,5
syscall

slti	$a1,$v0,2 #if input < 2 means input =1
bne	$a1,$0,circle
slti	$a1,$v0,3 #if input < 3 means input =2
bne	$a1,$0,triangle
slti	$a1,$v0,4 #if input < 4 means input =3
bne	$a1,$0,rectangle
slti	$a1,$v0,5 #if input < 5 means input =4
bne	$a1,$0,square

circle:
la $a0, radius
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall

mul.s $f0,$f0,$f0
l.s $f1, pi #load float instead of using li.s (no support)
mul.s $f0,$f1,$f0

mov.s $f12,$f0 #copy $f0 to $f12
li $v0,2 #print single precision
syscall

j END

triangle:
la $a0, height
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall
mov.s $f1,$f0

la $a0, base
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall
mov.s $f2,$f0

mul.s $f12,$f1,$f2
l.s $f3, half
mul.s $f12,$f12,$f3

li $v0,2 #print single precision
syscall
j END

rectangle:
la $a0, length
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall
mov.s $f1,$f0

la $a0, width
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall
mov.s $f2,$f0

mul.s $f12,$f1,$f2
li $v0,2 #print single precision
syscall
j END
square:
la $a0, side
li $v0,4
syscall

li $v0,6 #read floating number into $f0
syscall

mul.s $f0,$f0,$f0
mov.s $f12,$f0
li $v0,2 #print single precision
syscall
j END
END:
	li	$v0,10
	syscall