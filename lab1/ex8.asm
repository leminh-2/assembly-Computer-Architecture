.data
	array: .word 1,2,3,4,5,6,7,8,9,10
	sentence: .asciiz "Enter an integer number from 1 to 9: \n"
.text
	li $v0, 4
	la $a0, sentence
	syscall
	
	li $v0, 5
	syscall
	add $a0,$0, $v0
	add $a0,$a0,$a0
	add $a0,$a0,$a0 #multiply 4
	
	
	la $t1, array
	add $t1,$t1,$a0
	lw $t2, 0($t1)
	
	add $a0,$0,$t2
	li $v0, 1
	syscall