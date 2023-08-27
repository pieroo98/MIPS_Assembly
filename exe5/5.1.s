		.data
num:	.word  3141592653
pr:		.byte '0'
		.text
		.globl main
		.ent main
main:
		lw $s0, num
		lb $t2, pr
		addi $s1, $s1, 1
		move $s2, $0
		move $s3, $0
		addi $s3, $0, 10
		
for:	
		divu $s0, $s3
		mfhi $s1
		beq $s1, $0, stampa
		subu $sp, $sp, 4
		sw $s1, ($sp)
		addi $s2, $s2, 1
		mflo $s0
		j for
		
stampa:
		slt $t0, $0, $s2
		beq $t0, $0, fine
		move $t1, $0
		lw $a0, ($sp)
		addu $sp, $sp, 4 
		add $a0, $a0, $t2
		li $v0, 11
		syscall
		sub $s2, $s2, 1
		j stampa
fine:
		li $v0,10
		syscall
		.end main