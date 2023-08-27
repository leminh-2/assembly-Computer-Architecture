.data
.text
	li $v0, 5 # Get integer mode
	syscall
	add $a0,$zero, $v0
	
	li $v0, 5 
	syscall
	add $s0, $s0, $v0 
	add $a0, $0, $s0 #$a0 can assign many times
	li $v0, 1 # must be $a0
	syscall
