.data
greeting: .asciiz "enter integer number:\n"
.text
	li $v0, 4
	la $a0, greeting
	syscall
	
	li $v0, 5 # Get integer mode
	# $v0 contains integer read
	syscall
	
	addi $a0, $v0, 1 # Move integer from $v0 to register $a0 and increase 1
	li $v0, 1 # Print integer a0
	syscall
	