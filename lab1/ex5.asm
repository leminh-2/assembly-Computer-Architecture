.data
array: .word 1,2,3,4,5,6,7,8,9,10
.text
	#assign $t0 = 0 for counting element
	#assign $t1 = 0 for sum
	addi  $t2, $0, 10 # max count
	la $t3, array

	L1:
	slt $t4, $t0, $t2 # bool t4, if $t0 < $t2, $t4=1, else =0
	beq $t4, $0, End #if $t4 = 0, go to End
	lw $t5, 0($t3)
	add $t1, $t1, $t5 
	add $t0, $t0, 1 
	add $t3, $t3, 4 #word 4bit
	j L1
	
	End:
	add $a0, $t1, $0
	li $v0,1
	syscall