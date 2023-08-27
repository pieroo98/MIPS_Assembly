		.data
anni:	.word 1945, 2008, 1800, 2006, 1748, 1600
risultato:	.byte 0, 0, 0, 0, 0, 0
lunghezza:	.byte 6
verifica:	.word 0x7FFFFFFF
		.text
		.globl main
		.ent main
main:		
		la $a0, anni
		la $a1, risultato
		lb $a2, lunghezza
		subu $sp, $sp, 4
		sw $ra, ($sp)
		jal bisestile
		
		lw $ra, ($sp)
		addi $sp, $sp, 4 
		jr $ra
		
bisestile:
		move $t0, $0
		move $t3, $0
		move $t4, $0
		move $t5, $0
		move $s1, $0
		addi $s1, $s1, 1
		addi $t3, $t3, 100
		addi $t4, $t4, 400
		addi $t5, $t5, 4
		lw $t7, verifica
for:	slt	$t1, $t0, $a2
		beq $t1, $0, fine
		lw $t2, ($a0)
		lb $s0, ($a1)
		div $t2, $t3
		mfhi $t6
		and $t1, $t6, $t7
		slt $t6, $t1, $s1
		beq $t6, $0, dividox4
		div $t2, $t4
		mfhi $t6
		and $t1, $t6, $t7
		slt $t6, $t1, $s1
		beq $t6, $0, nonBisesti
		addi $s0, $s0, 1
		sb $s0, ($a1)
		j nonBisesti		
		
dividox4:
		div $t2, $t5
		mfhi $t6
		and $t1, $t6, $t7
		slt $t6, $t1, $s1
		beq $t6, $0, nonBisesti
		addi $s0, $s0, 1
		sb $s0, ($a1)
		j nonBisesti

nonBisesti:
		addi $t0, $t0, 1
		addi $a1, $a1, 1
		addi $a0, $a0, 4
		j for
fine:
		jr $ra