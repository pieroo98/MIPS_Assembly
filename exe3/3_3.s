		.data
		
result:	.space 4		
giorni:	.byte 13
ore:	.byte 10
minuti:	.byte 52
str1:	.word 60
str2:	.word 1440
provaOv:.word 0xFFFFFFFF
stampa:	.asciiz "errore di overflow, hai superato 32 bit"

		.text
		.globl main
		.ent main
main:
		lbu $t0, giorni
		lbu $t1, ore
		lbu $t2, minuti
		lw $t3, str1
		lw $t4, str2
		lw $t5, provaOv
		
		addi $t6, $0, 1
		mult $t1, $t3
		mflo $s0
		mfhi $s1
		and $s4, $s1, $t5
		beq $t6, $s4, err
		j prox
err:
		li $v0, 4
		la $a0, stampa
		syscall
		j fine
prox:		
		mult $t0, $t4
		mflo $s2
		mfhi $s3
		move $s4, $0
		and $s4, $s3, $t5
		beq $t6, $s4, err
		
		addu $s0, $s0, $s2
		addu $t2, $s0, $t2
		sw $t2, result
		move $s4, $0
		and $s4, $s0, $t5
		beq $t6, $s4, err
		
		move $a0, $t2
		li $v0, 1
		syscall
fine:		
		li $v0, 10
		syscall
		.end main