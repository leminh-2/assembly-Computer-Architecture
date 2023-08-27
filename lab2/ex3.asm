.data
.align 4 #??
Table: .space 80
msg1: .asciiz "Please insert an integer: "
msg2: .asciiz " "
msg3: .asciiz "\nVector contents: "
.text
.globl main #??
main:

addi $s0,$zero,9
addi $t0,$zero,0
in:
li $v0,4
la $a0,msg1
syscall
li $v0,5
syscall
add $t3,$v0,$zero
add $t1,$t0,$zero
sll $t1,$t0,2

sw $t3,Table ( $t1 )
addi $t0,$t0,1
slt   $t1,$s0,$t0
beq $t1,$zero,in

la $a0,Table
addi $a1,$s0,1 #a1=6
#call buble_sort
jal buble_sort

#print table
li $v0,4
la $a0,msg3
syscall
la $t0,Table
#s0=5
addi $t0,$t0,-4
add $t1,$zero,$zero

printtable:
lw $a0,0($t0)
li $v0,1
syscall
li $v0,4
la $a0,msg2
syscall
addi $t0,$t0,4
addi $t1,$t1,1
slt     $t2,$s0,$t1
beq   $t2,$0,printtable
syscall

li $v0,10
syscall

buble_sort:
#a0=address of table
#a1=size of table
add $t0,$zero,$zero #counter1( i )=0

loop1:
addi $t0,$t0,1 #i++
bgt $t0,$a1,endloop1 #if t0 < a1 break;

add $t1,$a1,$zero #counter2=size=6
loop2:

#bge $t0,$t1,loop1 #j < = i

slt $t3,$t1,$t0
bne $t3,$zero,loop1

addi $t1,$t1,-1 #j--

mul $t4,$t1,4 #t4+a0=table[j]
addi $t3,$t4,-4 #t3+a0=table[j-1]
add $t7,$t4,$a0 #t7=table[j]
add $t8,$t3,$a0 #t8=table[j-1]
lw $t5,0($t7)
lw $t6,0($t8)

ble   $t5,$t6,loop2     #what is ble

#switch t5,t6
sw $t5,0($t8)
sw $t6,0($t7)
j loop2

endloop1:
jr $ra