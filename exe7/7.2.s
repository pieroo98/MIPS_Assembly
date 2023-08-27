		.data
pp:		.word 43
		.text
		.globl main
		.ent main
main:		
		lw $a0, pp
		subu $sp, $sp, 4 
		sw $ra, ($sp) 
		jal calcolasuccessivo
		
		move $a0, $v0
		li $v0, 1
		syscall
		
		lw $ra, ($sp)
		addu $sp, 4 
		jr $ra
		
calcolasuccessivo:		
		andi $s1, $a0, 1
		beq $s1, $0, pari
		addi $s2, $0, 3
		mult $s2, $a0
		mflo $v0
		addi $v0, $v0, 1
		j stop
pari:		
		addi $s3, $0, 2
		div $a0, $s3
		mflo $v0
stop:		
		jr $ra