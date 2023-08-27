.data
filename: .asciiz "C:/Users/lequa/Downloads/text.txt"
#filename string is full file path corresponding to where you store text.txt file in storage
#copy file path in file explorer C:\...\text.txt
#change \sign into /sign
buffer: .space 4096

.text
main:
# Open (for reading) a file
li $v0, 13 # system call for open file
la $a0, filename # input file name
li $a1, 0 # Open for reading (flags are 0: read, 1: write)
syscall # open a file (file descriptor returned in $v0)
move $s6, $v0 # save the file descriptor #$s6 = file

# Read from file
li $v0, 14 # system call for read
move $a0, $s6 # file descriptor
la $a1, buffer # 
li $a2, 4096 # hardcoded buffer length
syscall # read file

#print what is in file
li $v0,4 #mode for print string
la $a0,buffer 
syscall

# Close the file
li $v0, 16 # system call for close file
move $a0, $s6 # file descriptor to close
syscall # close file

END:
li $v0,10
syscall