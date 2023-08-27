		.data
paro:	.word 8
cara:	.word '*'
spazio:	.word '\n'
		.text
		.globl main
		.ent main
main:	
		lw $s0, paro
		lw $s1, cara
		lw $s2, spazio
		jal funzione

		li $v0, 10
		syscall
		.end main
		
funzione:
		move $t1, $0
		move $t3, $0
		
for:	slt $t2, $t1, $s0
		beq $t2, $0, fine
		move $t3, $0
		add $t3, $t1, $0
		move $t4, $0
tring:	slt $t2, $t4, $t3
		beq $t2, $0, vabbe
		move $a0, $s1
		li $v0, 11
		syscall
		addi $t4, $t4, 1
		j tring
vabbe:
		move $a0, $s2
		li $v0, 11
		syscall
		addi, $t1, $t1, 1
		j for

fine:	move $a0, $s2
		li $v0, 11
		syscall	
		move $t1, $0
		move $t3, $0
for1:	
		slt $t2, $t1, $s0
		beq $t2, $0, finefor
		move $t3, $0
for2:	
		slt $t2, $t3, $s0
		beq $t2, $0, finef1
		move $a0, $s1
		li $v0, 11
		syscall
		addi $t3, $t3, 1
		j for2
finef1:
		move $a0, $s2
		li $v0, 11
		syscall
		addi $t1, $t1, 1
		j for1
finefor:
		jr $ra