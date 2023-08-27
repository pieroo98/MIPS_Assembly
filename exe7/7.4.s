		.data
matrix:	.word 4, 5, 1, 3
		.text
		.globl main
		.ent main
main:		
		la $t0, matrix
		subu $sp, $sp, 4
		sw $ra, ($sp)
		jal leggiValori
		move $a0, $v0
		li $v0, 1
		syscall
		
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
		
leggiValori:
		lw $a0, ($t0)
		addi $t0, $t0, 4
		lw $a1, ($t0)
		addi $t0, $t0, 4
		lw $a2, ($t0)
		addi $t0, $t0, 4
		lw $a3, ($t0)
		addi $t0, $t0, 4
		subu $sp, $sp, 4
		sw $ra, ($sp)
		jal determinante
		
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
		
determinante:		
		mult $a0, $a3
		mflo $s0
		mult $a1, $a2
		mflo $s1
		sub $v0, $s0, $s1
		jr $ra