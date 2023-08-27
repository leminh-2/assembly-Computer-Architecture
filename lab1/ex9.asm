
.data
arr:.word  1,3,5,7,9,11,13,15,17,19
arr2: .space 10
.text
	#assign $t0=0 for count
	addi $t1,$0,10 # maxcount
	la $t2,arr 
	la $t3,arr2
	addi $t2,$t2,36
	L1: slt $t4,$t0,$t1
    	beq  $t4,0,End
    	lw $t5,0($t2)
     	add $t3,$0,$t5
     	
     	add $a0,$0,$t3
     	li $v0,1 #print element
	syscall 
	
    	addi $t2,$t2,-4
    	addi $t3,$t3,4
    	addi $t0,$t0,1
    	j L1
	End:
	
