.data
	array: .space  10 #10byte

.text
	#assign $t0 =0 for counting
	#assign $t3 = 0 for sum
	addi $t1,$0,10 #maxcount
	la $t2,array
	
	
	L1: 
	slt $t4,$t0,$t1 #if $t0 < $t1, $t4 =1(bool), else=0
     	beq $t4,0,End #if $t4 == 0, go to end
     	li $v0,5
     	syscall
     
     	add $t2,$v0,$0
     	add $t3,$t3,$t2
     	addi $t0,$t0,1
     	addi $t2,$t2,4
    	j L1
	
	End:
	add $a0,$0,$t3
	li $v0,1
	syscall   

	
