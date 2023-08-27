		.data
pp:		.asciiz "il risultato del calcolo e' : "
		.text
		.globl main
		.ent main
main:		
		li $v0, 5
		syscall
		move $s0, $v0
		
		li $v0, 5
		syscall
		move $a1, $v0
		
		li $v0, 4
		la $a0, pp
		syscall
		move $a0, $s0
		jal combina
		
		move $a0, $v0
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		.end main
		
combina:
		move $t0, $0
		sub $t0, $a0, $a1
		addi $t0, $t0, 2
		move $t2, $a0
		move $t3, $a0
for:		
		slt $t1, $t2, $t0
		bne $t1, $0, fine
		addi $t2, $t2, -1
		mult $t3, $t2
		mflo $t3
		j for 
		
fine:	move $t2, $0
		addi $t2, $t2, 2
		move $t4, $a1
		move $t5, $a1
		addi $t4, $t4, -1
		
altro:	slt $t1, $t2, $a1
		beq $t1, $0, stop
		mult $t5, $t4
		mflo $t5
		addi $t2,$t2, 1
		addi $t4, $t4, -1
		j altro
stop:
		div $t3, $t5
		mflo $v0
		jr $ra