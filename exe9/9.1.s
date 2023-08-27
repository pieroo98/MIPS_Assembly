		.data
mat1:	.word 4, -45, 15565, 6458, 4531, 124, -548, 2124, 31000
mat2:	.word 6, -5421, -547, -99, 4531, 1456, 4592, 118, 31999
rex:	.space 12
DIM:	.word 3
L:		.word 2
		.text
		.globl main
		.ent main
main:		
		la $a0, mat1
		la $a1, mat2
		la $a2, rex
		lw $a3, DIM
		lw $t0, L
		subu $sp, $sp, 4
		sw $ra, ($sp)
		subu $sp, $sp, 4
		sw $t0, ($sp)
		jal proceduraVariazione
		lw $t0, ($sp)
		addi $sp, $sp, 4
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
		
proceduraVariazione:		
		lw $t0, ($sp)
		move $t8, $0
		addi $t8, $0, 100
		move $t1, $t0
		addi $t1, $t1, 1
		move $t3, $0
		sll $t4, $t0, 2
		mult $t4, $t1
		mflo $t4				#partenza prima matrice
		add $a0, $a0, $t4
		sll $t4, $t0, 2
		add $a1, $a1, $t4		#partenza seconda matrice
		sll $t4, $t1, 2
		
for:	slt $t2, $t3, $a3		
		beq $t2, $0, fine
		lw $t5, ($a0)
		lw $t6, ($a1)
		sub $t7, $t6, $t5
		mult $t7, $t8
		mflo $t7
		div $t7, $t5
		mflo $t7
		sw $t7, ($a2)
		addi $t3, $t3, 1
		addi $a0, $a0, 4
		add $a1, $a1, $t4
		addi $a2, $a2, 4
		j for
fine:		
		jr $ra