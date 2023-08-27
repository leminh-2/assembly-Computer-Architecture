.data 
f: .asciiz "= f \n"
g: .asciiz "= g \n"
.text
	li $v0, 5 # Get integer mode
	syscall
	add $a0,$zero, $v0
	
	li $v0, 5 # Get integer mode
	syscall
	add $a1,$zero, $v0
	
	li $v0, 5 # Get integer mode
	syscall
	add $a2,$zero, $v0
	
	li $v0, 5 # Get integer mode
	syscall
	add $a3,$zero, $v0
	
	add $t1, $a0, $a1
	sub $t2, $a2, $a3
	addi $t2, $t2, -2
	sub $t6, $t1, $t2 #$t6 is f
	
	add $t1,$a0,$a1
	add $t2,$t1,$t1
	add $t2,$t2,$t1
	
	add $t3,$a2,$a3
	add $t3,$t3,$t3
	
	sub $t7,$t2,$t3 #t7 is g
	
	add $a0,$0,$t6
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, f
	syscall
	
	add $a0,$0,$t7
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, g
	syscall
	
	