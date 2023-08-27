		.data
term:	.word '\n'
msg:	.asciiz "non palindromo\n"
mess:	.asciiz "palindromo\n"
		.text
		.globl main
		.ent main
main:
		lw $t0, term
		move $s0, $0
		
for:	
		li $v0, 12
		syscall
		move $t1, $v0
		beq $t0, $t1, verif
		subu $sp, $sp, 4
		sw $t1, ($sp)
		addi $s0, $s0, 1
		j for
verif:		
		sll $s0, $s0, 2
		move $t1, $0
		j prt
prt:
		lw $t1, ($sp)
		addi $s0, $s0, -4
		add $sp, $sp, $s0
		lw $t2, ($sp)
		beq $s0, $0, disp
		addi $s0, $s0, -4
disp:	beq $t1, $t2, ok
		j err		
ok:			
		sub $sp, $sp, $s0
		beq $s0, $0, fine
		j prt
err:	
		li $v0, 4
		la $a0, msg
		syscall
		j finemain
fine:
		li $v0, 4
		la $a0, mess
		syscall
finemain:
		li $v0, 10
		syscall
		.end main