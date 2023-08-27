		.data
		
par1:	.word 23
par2:	.word 41
par3:	.word 19

		.text
		.globl main
		.ent main
main:
		lw $t0, par1
		lw $t1, par2
		lw $t2, par3
		li $t3, 0
		
		slt $t4, $t1, $t0  # t0 minore di t1 ? se verificata mette 0 in t4
		beq $t4, $t3, swap1  
		j ETI1
swap1:
		add $t0, $t0, $t1
		sub $t1, $t0, $t1
		sub $t0, $t0, $t1
ETI1:
		slt $t4, $t2, $t0  # a minore c ?
		beq  $t4, $t3, swap2
		j ETI2
swap2:
		add $t0, $t0, $t2
		sub $t2, $t0, $t2
		sub $t0, $t0, $t2
ETI2:
		slt $t4, $t2, $t1  # b minore c ?
		beq  $t4, $t3, swap3
		j ETI3
swap3:
		add $t1, $t1, $t2
		sub $t2, $t1, $t2
		sub $t1, $t1, $t2
ETI3:
		sw $t0, par1
		sw $t1, par2
		sw $t2, par3
		
		lw $a0, par3
		li $v0, 1
		syscall
		
		li $a0, '\n'
		li $v0, 11
		syscall
		
		lw $a0, par2
		li $v0, 1
		syscall
		
		li $a0, '\n'
		li $v0, 11
		syscall
		
		lw $a0, par1
		li $v0, 1
		syscall
		
		li $a0, '\n'
		li $v0, 11
		syscall
		
		li $v0, 10
		syscall
		.end main