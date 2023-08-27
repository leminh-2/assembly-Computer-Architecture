.data
array: .word 1,2,3,4,5,6,7,8,9,10

.text
	
	addi	$a0,$0,9 #$a0 is k=10
        li $v0,0  
        add	$v0,$0,$0 #$v0 contain result
	jal Sum            #Function call to the Sum Function
	add $t0,$v0,$0 
        add $a0,$t0,$0
        li $v0,1
        syscall
End:
	li $v0,10
	syscall
Sum: 
	addi $sp, $sp, -4          # Decrement the stack pointer by 4

        sw $ra, 0($sp)                # Push the value of $ra on to the stack

        addi $sp, $sp, -4          # Decrement the stack pointer by 4

        sw $a0, 0($sp)               # Push the value of $a0 on to the stack
        
        
        
        slti $t0,$a0,1
        
        beq $t0,$zero, L1
        
        lw $t1,array($0)
        add $v0,$v0,$t1
        
       
	lw $a0, 0($sp)                # Pop the value of $a0 from the stack

        addi $sp, $sp, 4             # Increment the stack pointer by 4

        lw $ra, 0($sp)                # Pop the value of $ra from the stack

         addi $sp, $sp, 4             # Decrement the stack pointer by 4
	 jr $ra                                   # Jump to the address contained in $ra 

 L1:
 	addi $a0, $a0, -1         # Base condition not met, perform (n-1)

 

        jal Sum                             # Call function sum again with (n-1)
        
        lw $a0, 0($sp)                # Pop the value of $a0 from the stack

        addi $sp, $sp, 4             # Increment the stack pointer by 4

        lw $ra, 0($sp)                # Pop the value of $ra from the stack

        addi $sp, $sp, 4             # Increment the stack pointer by 4
	 li $t6,4
	 mul $t1,$a0,$t6
	 lw $t5,array($t1)
	 #add $v0,$v0,$t5                 # Perform sum arr[k] + arr[k-1]
	blt	$t5,$v0,Then
	add	$v0,$0,$t5
Then:	
	jr $ra                                   # Jump to the address contained in $ra
 	

 
	
