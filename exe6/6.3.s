		.data
giu:	.word '\n'
		.text
		.globl main
		.ent main
main:	
		lw $s3, giu
for:	move $s0, $0
		li $v0, 12
		syscall
		move $a0, $v0
		beq $a0, $s3, stop
		jal funzione
		
		move $a0, $v0
		li $v0, 11
		syscall
		j for
stop:		
		li $v0, 10
		syscall
		.end main
		
funzione:
		addi $v0, $a0, -32
		jr $ra