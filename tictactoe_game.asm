.data
	board: .asciiz "\n  1   2   3\n1   |   |   \n ---+---+---\n2   |   |   \n ---+---+---\n3   |   |   \n"
	x: .asciiz "X"
	o: .asciiz "O"
	askInput: .asciiz "Player   choose an option:[column|line] input your play ||[9] New Game ||[99] Quit:\t"
	invalidInput: .asciiz "Invalid Input\n"
	occupiedSpace: .asciiz "Space occupied\n"
	won: .asciiz "  wins!\n"
	draw: .asciiz  "Cat Game(no winner)!\n"
	whitespace: .byte ' ' #clean XO in board
	gameMenu: .asciiz "\n\nChoose an option:\n[9] New Game\t[99] Quit:\t"
.text
.globl main
main:
	add $t1, $0, $0 #assign register to value 0
	add $t2, $0, $0
	add $t3, $0, $0
	add $t4, $0, $0
	add $t5, $0, $0
	add $t6, $0, $0
	add $t7, $0, $0
	add $t8, $0, $0
	add $t9, $0, $0
	#$t1,2,3,4,5,6,7,8,9 respect to (column|line) 11,21,31,12,22,32,13,23,33
	

	add $s0, $0, $0 #X or O
	add $s4, $0, $0 #count the number of nonempty cell
	la $s1, board
	la $s2, askInput
	la $s3, won
	#add $s5, $0, $0 #(no need bc no affect new game)
	#$s5 to store input
	#add $s6, $0, $0 #(no need)
	#$s6 to check win

	#clear X, O in board
	lb $a1, whitespace
	sb $a1, 15($s1)
	sb $a1, 19($s1)
	sb $a1, 23($s1)
	sb $a1, 41($s1)
	sb $a1, 45($s1)
	sb $a1, 49($s1)
	sb $a1, 67($s1)
	sb $a1, 71($s1)
	sb $a1, 75($s1)
	sb $a1, 7($s2)
	sb $a1, 0($s3)
	

PrintBoard: #print board, jump to Draw, next is input
	li $v0, 4
	la $a0, board
	syscall

	beq $s4, 9, Draw

	add $s4, $s4, 1 #increase the number of nonempty cell

	rem $t0, $s0, 2 #calculate remainder a=b%2
	#choose X when ($s0 is even~$t0 ==0)
	#choose O when ($s0 is odd~$t0 !=0)
	add $s0, $s0, 1 #exchange X and O (X to O/O to X)
	bnez $t0, CharO

CharX: #insert X into string askInput and won
	lb $a1, x
	sb $a1, 7($s2)
	sb $a1, 0($s3)
	j Play
CharO: #insert O into string askInput and won
	lb $a1, o
	sb $a1, 7($s2)
	sb $a1, 0($s3)

Play: #input, jump to store value, invalid mode
	li $v0, 4 #print string
	la $a0, askInput
	syscall

	li $v0, 5 #read integer
	syscall
	beq $v0, 9, main
	beq $v0, 99, End
	move $s5, $v0

	beq $s5, 11, J11
	beq $s5, 21, J21
	beq $s5, 31, J31
	beq $s5, 12, J12
	beq $s5, 22, J22
	beq $s5, 32, J32
	beq $s5, 13, J13
	beq $s5, 23, J23
	beq $s5, 33, J33

	li $v0, 4
	la $a0, invalidInput
	syscall
	j Play

J11:
	bnez $t1, Occupied
	bnez $t0, O11

X11:
	addi $t1, $0, 1 #load immeditately: 1 for X, 2 for O, 0 for empty
	sb $a1, 15($s1)    #$a1 is char X or O
	j CheckWon

O11:
	addi $t1, $0, 2
	sb $a1, 15($s1)
	j CheckWon

J21:
	bnez $t2, Occupied
	bnez $t0, O21

X21:
	addi $t2, $0, 1
	sb $a1, 19($s1)
	j CheckWon

O21:
	addi $t2, $0, 2
	sb $a1, 19($s1)
	j CheckWon

J31:
	bnez $t3, Occupied
	bnez $t0, O31

X31:
	addi $t3, $0, 1
	sb $a1, 23($s1)
	j CheckWon

O31:
	addi $t3, $0, 2
	sb $a1, 23($s1)
	j CheckWon

J12:
	bnez $t4, Occupied
	bnez $t0, O12

X12:
	addi $t4, $0, 1
	sb $a1, 41($s1)
	j CheckWon

O12:
	addi $t4, $0, 2
	sb $a1, 41($s1)
	j CheckWon

J22:
	bnez $t5, Occupied
	bnez $t0, O22

X22:
	addi $t5, $0, 1
	sb $a1, 45($s1)
	j CheckWon

O22:
	addi $t5, $0, 2
	sb $a1, 45($s1)
	j CheckWon

J32:
	bnez $t6, Occupied
	bnez $t0, O32

X32:
	addi $t6, $0, 1
	sb $a1, 49($s1)
	j CheckWon

O32:
	addi $t6, $0, 2
	sb $a1, 49($s1)
	j CheckWon

J13:
	bnez $t7, Occupied
	bnez $t0, O13

X13:
	addi $t7, $0, 1
	sb $a1, 67($s1)
	j CheckWon

O13:
	addi $t7, $0, 2
	sb $a1, 67($s1)
	j CheckWon

J23:
	bnez $t8, Occupied
	bnez $t0, O23

X23:
	addi $t8, $0, 1
	sb $a1, 71($s1)
	j CheckWon

O23:
	addi $t8, $0, 2
	sb $a1, 71($s1)
	j CheckWon

J33:
	bnez $t9, Occupied
	bnez $t0, O33

X33:
	addi $t9, $0, 1
	sb $a1, 75($s1)
	j CheckWon

O33:
	addi $t9, $0, 2
	sb $a1, 75($s1)
	j CheckWon

Occupied:
	li $v0, 4
	la $a0, occupiedSpace
	syscall
	j Play

CheckWon:
	#horizontal:$t 123,456,789
	#vertical:$t 147,258,369
	#diagonal:$t 357,159
	
	and $s6, $t1, $t2
	and $s6, $s6, $t3
	bnez $s6, PrintResult

	and $s6, $t4, $t5
	and $s6, $s6, $t6
	bnez $s6, PrintResult

	and $s6, $t7, $t8
	and $s6, $s6, $t9
	bnez $s6, PrintResult

	and $s6, $t1, $t4
	and $s6, $s6, $t7
	bnez $s6, PrintResult

	and $s6, $t2, $t5
	and $s6, $s6, $t8
	bnez $s6, PrintResult

	and $s6, $t3, $t6
	and $s6, $s6, $t9
	bnez $s6, PrintResult

	and $s6, $t1, $t5
	and $s6, $s6, $t9
	bnez $s6, PrintResult

	and $s6, $t7, $t5
	and $s6, $s6, $t3
	bnez $s6, PrintResult
	j PrintBoard 
	
	
PrintResult: #print board, result, jump to menu
	li $v0, 4
	la $a0, board
	syscall

	li $v0, 4
	la $a0, won
	syscall
	j MenuNewGame

Draw: #print draw
	li $v0, 4
	la $a0, draw
	syscall

MenuNewGame:
	li $v0,4
	la $a0, gameMenu
	syscall

	li $v0,5
	syscall
	bne $v0, 99, main

End:
	li $v0, 10
	syscall


			