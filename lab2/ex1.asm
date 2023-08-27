.data
	greeting: .asciiz "Ho Chi Minh City - University of Technology"
	output:	.space	256
.text
	la $t2,greeting
	addi $t1,$0,42 #$t1 is length of string
	
	reverse_loop:
		add	$t3, $t2, $t0		# $t2 is the base address for string array
		lb	$t4, 0($t3)		# load a byte
		beq	$t4,$0, exit		# if input == null-byte
		sb	$t4, output($t1)	# Overwrite this byte address in memory	
		subi	$t1, $t1, 1		# Subtract our overall string length by 1
		addi	$t0, $t0, 1		# Increase counter by 1
		j	reverse_loop		# Loop
	
exit:
	li	$v0, 4			# Print
	la	$a0, output		# the string!
	syscall