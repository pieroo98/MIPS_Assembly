		.data
		.text
		.globl main
		.ent main
main:		
		addi $t0, $t0, 15
		addi $t1, $t0, 1
		addi $t2, $t0, 2
		addi $t3, $t0, 3
		
		addi $s0, $s0, 223
		addi $s1, $s0, 1
		addi $s2, $s0, 2
		addi $s3, $s0, 3
		
		subu $sp, $sp, 4
		sw $t0, ($sp)
		subu $sp, $sp, 4
		sw $t1, ($sp)
		subu $sp, $sp, 4
		sw $t2, ($sp)
		subu $sp, $sp, 4
		sw $t3, ($sp)
		
		subu $sp, $sp, 4
		sw $t0, ($sp)
		subu $sp, $sp, 4
		sw $s0, ($sp)
		add $fp, $sp, $0
		jal somma
		move $t4, $v0
		
		addi $sp, $sp , 8
		lw $t3, ($sp)
		addi $sp, $sp, 4
		lw $t2, ($sp)
		addi $sp, $sp, 4
		lw $t1, ($sp)
		addi $sp, $sp, 4
		lw $t0, ($sp)
		addi $sp, $sp, 4
		
		li $v0, 10
		syscall
		.end main
		
somma:
		move $t0, $0
		move $t1, $0
		move $t2, $0
		move $t3, $0
		
		subu $sp, $sp, 4
		sw $s0, ($sp)
		subu $sp, $sp, 4
		sw $s1, ($sp)
		subu $sp, $sp, 4
		sw $s2, ($sp)
		subu $sp, $sp, 4
		sw $s3, ($sp)
		
		move $s0, $0
		move $s1, $0
		move $s2, $0
		move $s3, $0
		
		lw $t2, 0($fp)
		lw $s2, 4($fp)
		add $v0, $t2, $s2
		
		lw $s3, ($sp)
		addi $sp, $sp, 4
		lw $s2, ($sp)
		addi $sp, $sp, 4
		lw $s1, ($sp)
		addi $sp, $sp, 4
		lw $s0, ($sp)
		addi $sp, $sp, 4
		jr $ra