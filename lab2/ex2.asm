.data

.text
	li	$v0,5 #mode integer
	syscall
	add	$a1,$0,$v0 #save number to $a1
	
	slti	$t0,$a1,1 #$t0 =1 when $a1 <1
	bne	$t0,$0, exit
	#fibonaci
	addi	$t7,$0,0 #t7 is count: from 0 to n-1
	addi	$t1,$0,0
	addi	$t2,$0,1
	add	$a0,$0,$t2 #print first number in sequence
	li	$v0,1
	syscall
Fibo:	
	addi	$t7,$t7,1 #count++
	beq	$t7,$a1, exit
	add	$t3,$t1,$t2
	
	add	$a0,$0,$t3 #print number in sequence
	li	$v0,1
	syscall
	
	add	$t1,$0,$t2
	add	$t2,$0,$t3
	j Fibo
		
exit: 