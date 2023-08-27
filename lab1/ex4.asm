.data
.text
	li $v0, 5 # Get integer mode
	syscall
	add $s1,$zero, $v0
	
	li $v0, 5 # Get integer mode
	syscall
	add $s2,$zero, $v0
	
	li $v0, 5 # Get integer mode
	syscall
	add $s3,$zero, $v0
	
	li $v0, 5 # Get integer mode
	syscall
	add $s4,$zero, $v0
	
	li $v0, 5 # Get integer mode
	syscall
	add $s5,$zero, $v0
	
	add $a0,$0,$s5
	li $v0, 1
	syscall
	
	add $a0,$0,$s4
	li $v0, 1
	syscall
	
	add $a0,$0,$s3
	li $v0, 1
	syscall
	
	add $a0,$0,$s2
	li $v0, 1
	syscall
	
	add $a0,$0,$s1
	li $v0, 1
	syscall
	