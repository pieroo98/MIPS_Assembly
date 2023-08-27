		.data
array:	.word 1, 2, 3, 4, 5, 6, 6, 4, 0
stringa:	.asciiz "\n ed e' ripetuto "
stringa2:	.asciiz " volte"
		.text
		.globl main
		.ent main
main:		
		la $a0, array
		move $a1, $0
		addi $a1, $0, 9
		jal funzione
		move $a0, $v0
		li $v0, 1
		syscall
		
		move $a0, $0
		li $v0, 4
		la $a0, stringa
		syscall
		
		move $a0, $0
		move $a0, $t5
		li $v0, 1
		syscall
		
		move $a0, $0
		li $v0, 4
		la $a0, stringa2
		syscall
		
		li $v0, 10
		syscall
		.end main
		
funzione:
		move $t0, $0
		move $t5, $0
		addi $t5, $0, 1
		lw $t2, ($a0)
		addi $t0, $t0, 1
		addi $a0, $a0, 4
for:	slt $t1, $t0, $a1
		beq $t1, $0, fine
		lw $t3, ($a0)
		slt $t4, $t2, $t3
		bne $t4, $0, scambia
		beq $t2, $t3, ok
		j altrove
scambia:
		move $t2, $t3
		move $t5, $0
		addi $t5, $0, 1
		j altrove
ok:
		addi $t5, $t5, 1
altrove:
		addi $a0, $a0, 4
		addi $t0, $t0, 1
		j for
		
fine:	move $v0, $t2
		jr $ra