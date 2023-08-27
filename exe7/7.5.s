		.data
mx:		.word 5, 3, 1, 4, 9, 3, 2, 0, 6
		.text
		.globl main
		.ent main
main:	
		subu $sp, $sp, 4
		sw $ra, ($sp)
		la $t0, mx
		lw $a0, ($t0)
		addi $t0, $t0, 4
		lw $a1, ($t0)
		addi $t0, $t0, 4
		lw $a2, ($t0)
		addi $t0, $t0, 4
		lw $a3, ($t0)
		addi $t0, $t0, 4
		subu $sp, $sp, 4
		lw $t1, ($t0)
		sw $t1, ($sp)
		addi $t0, $t0, 4
		subu $sp, $sp, 4
		lw $t1, ($t0)
		sw $t1, ($sp)
		addi $t0, $t0, 4
		subu $sp, $sp, 4
		lw $t1, ($t0)
		sw $t1, ($sp)
		addi $t0, $t0, 4
		subu $sp, $sp, 4
		lw $t1, ($t0)
		sw $t1, ($sp)
		addi $t0, $t0, 4
		subu $sp, $sp, 4
		lw $t1, ($t0)
		sw $t1, ($sp)
		
		jal determinante3X3
		
		move $a0, $v0
		li $v0, 1
		syscall
		addi $sp, $sp, 20
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
		
determinante3X3:		
		add $fp, $sp, $0	# il frame pointer mi punta a ultimo elemento dello stack col valore della matrice
		subu $sp, $sp, 4
		sw $ra, ($sp)
		lw $s0, ($fp)
		lw $s1, 4($fp)
		lw $s2, 12($fp)
		lw $s3, 16($fp)
		jal determinante2X2
		mult $a0, $v0
		mflo $t2
		
		lw $s0, ($fp)
		lw $s1, 8($fp)
		lw $s2, 12($fp)
		move $s3, $a3
		jal determinante2X2
		mult $a1, $v0
		mflo $t3
		
		lw $s0, 4($fp)
		lw $s1, 8($fp)
		lw $s2, 16($fp)
		move $s3, $a3
		jal determinante2X2
		mult $a2, $v0
		mflo $t4
		sub $t2, $t2, $t3
		add $v0, $t2, $t4
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
		
determinante2X2:		
		
		mult $s0, $s3
		mflo $s4
		mult $s1, $s2
		mflo $s5
		sub $v0, $s4, $s5
		jr $ra