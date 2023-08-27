		.data
stringa:	.asciiz "proviamo come viene cosi"
fine:	.word 0
		.text
		.globl main
		.ent main
main:		
		lw $s3, fine
		la $s1, stringa
for:	lb $a0, ($s1)
		beq $a0, $s3, stop
		jal funzione
		
		move $a0, $v0
		li $v0, 11
		syscall
		addi $s1, $s1, 1
		j for
stop:		
		li $v0, 10
		syscall
		.end main
		
funzione:
		addi $v0, $a0, -32
		jr $ra