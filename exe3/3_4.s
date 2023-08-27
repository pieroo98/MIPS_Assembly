		.data
dim:	.word 5
testo:	.asciiz "\ninserisci un valore : "
stampa:	.asciiz "\nil risultato della media è : "
punto:	.asciiz "."
		.text
		.globl main
		.ent main
main:
		lw $t0, dim
		addi $s0, $0, 0
		addi $t2 , $0, 0
for:	beq $s0, $t0, fine
		li $v0, 4
		la $a0, testo
		syscall

		li $v0, 5  
		syscall 
		move $t1, $v0
		add $t2, $t2, $t1
		addi $s0, 1
		j for
fine:	
		div $t2, $t0
		mflo $s1
		mfhi $s2
		
		li $v0, 4
		la $a0, stampa
		syscall
		
		move $a0, $s1
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, punto
		syscall
		
		move $a0, $s2
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		.end main