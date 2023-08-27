		.data
spazio:	.word '\n'
msg1:	.asciiz "valori immaginari"
		.text
		.globl main
		.ent main
main:
		lw $t6, spazio
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $v0, 5
		syscall
		move $t1, $v0
		
		li $v0, 5
		syscall
		move $t2, $v0
		beq $t0, $0, primo
		
		mult $t1, $t1		# b per b
		mflo $s0			# risultato moltiplic
		
		mult $t0, $t2
		mflo $s1			# a per ci
		sll $s1, $s1, 2		# a per ci per quattro
		move $t5, $0
		addi $t5, $t5, -1	# valore d controllo
		
		sub $s0, $s0, $s1	# s0 è il delta
		slt $s2, $t5, $s0
		bne $s2, $0, reale
		j imm
reale:
		sll $s3, $t0, 1		# due per a
		sub $s4, $s0, $t1	# delta meno b
		div $s4, $s3
		mflo $t3			# primo risultato
		
		add $s1, $s0, $t1	# delta piu b (positivo)
		sub $s2, $0, $s1	# delta piu b (negativo)
		div $s2, $s3
		mflo $t4
		j stampa
primo:
		sub $t3, $0, $t2
		div $t3, $t1
		mflo $t4			# -ci diviso b
		j stm
stampa:
		move $a0, $t3
		li, $v0, 1
		syscall
		
		move $a0, $t6
		li, $v0, 11
		syscall
		
		move $a0, $t4
		li, $v0, 1
		syscall
		j fine
stm:	
		move $a0, $t4
		li, $v0, 1
		syscall
		j fine
imm:	
		li $v0, 4
		la $a0, msg1
		syscall
fine:
		li $v0, 10
		syscall
		.end main