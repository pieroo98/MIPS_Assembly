		.data
pp:		.word 19
spazio:	.word '\n'
		.text
		.globl main
		.ent main
main:		
		lw $a0, pp
		lw $a1, spazio
		li $v0, 1
		syscall
		
		subu $sp, $sp, 4
		sw $ra, ($sp)
		move $s3, $0
		jal sequenzaDiCollatz
stampa:
		slt $t0, $t1, $s3
		beq $t0, $0, fine
		move $a0, $a1
		li $v0, 11
		syscall
		
		lw $a0, ($sp)
		addi $sp, $sp, 4
		li $v0, 1
		syscall
		addi $t1, $t1, 1
		j stampa
fine:		
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
		
sequenzaDiCollatz:
		beq $s3, $0, skip
		j opera
skip:	
		subu $sp, $sp, 4
		sw $ra, ($sp)
		add $fp, $sp, $0
opera:
		andi $s0, $a0, 1
		beq $s0, $0, pari
		addi $s1, $0, 3
		mult $s1, $a0
		mflo $a0
		addi $a0, $a0, 1
		j altro
pari:	
		addi $s2, $0 2
		div $a0, $s2
		mflo $a0
altro:		
		subu $sp, $sp, 4
		sw $a0, ($sp)
		addi $s3, $s3, 1
		
		beq $a0, 1, vai
		jal sequenzaDiCollatz
vai:		
		lw $ra, ($fp)
		jr $ra