.data
	array: .word 1, 2, 3, 54, 24, 120
	sumodd: .asciiz ": sum of all odd elements \n"
	sumeven: .asciiz ": sum of all even elements \n"
	
.text
	#assign $t0 = 0 for counting element
	#assign $t1 = 0 for sum
	#assign $t7 = 0 for sum odd
	addi  $t2, $0, 6 # max count
	la $t3, array

	L1:
	slt $t4, $t0, $t2 # bool t4, if $t0 < $t2, $t4=1, else =0
	beq $t4, $0, L2 #if $t4 = 0, go to L2
	lw $t5, 0($t3)
	add $t1, $t1, $t5 
	add $t0, $t0, 1 
	add $t3, $t3, 4 #word 4bit
	j L1
	
	L2:
	add $t6, $0, $t2
	add $t6, $t6, $t6
	add $t6, $t6, $t6 #6 elements * 4bits
	sub $t3, $t3, $t6 #come back to array[0]
	addi $t0, $0, 0 #assign count to 0
	L3:
	slt $t4, $t0, $t2 # bool t4, if $t0 < $t2, $t4=1, else =0
	beq $t4, $0, End #if $t4 = 0, go to End
	lw $t5, 0($t3)
	add $t7, $t7, $t5 
	add $t0, $t0, 2
	add $t3, $t3, 8 #word 4bit
	j L3
	
	End:
	add $a0, $t7, $0
	li $v0,1
	syscall
	
	li $v0, 4
	la $a0, sumodd
	syscall
	
	sub $a0, $t1, $t7
	li $v0,1
	syscall
	
	li $v0, 4
	la $a0, sumeven
	syscall
	