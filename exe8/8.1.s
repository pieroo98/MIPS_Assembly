		.data
vett1:	.byte 12, 47
vett2:	.byte 18, 14
euro:	.byte 1
tempo:	.byte 40
		.text
		.globl main
		.ent main
main:		
		la $a0, vett1
		la $a1, vett2
		lb $a2, euro
		lb $a3, tempo
		addi $sp, $sp, -4
		sw $ra, ($sp)
		jal costoParcheggio
		move $a0, $v0
		li $v0, 1
		syscall
		
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
		
costoParcheggio:		
		addi $t0, $0, 60
		lb $t1, ($a0)
		mult $t0, $t1
		mflo $t2
		lb $t1, 1($a0)
		add $t2, $t2, $t1
		
		lb $t1, ($a1)
		mult $t0, $t1
		mflo $t3
		lb $t1, 1($a1)
		add $t3, $t3, $t1
		sub $t3, $t3, $t2
		div $t3, $a3
		mflo $t3
		mfhi $t2
		mult $t3, $a2
		mflo $t3			#risultato finale
		andi $t4, $t2, 1
		beq $t4, $0, noResto
		addi $t3, $t3, $a2
noResto:
		move $v0, $t3
		jr $ra