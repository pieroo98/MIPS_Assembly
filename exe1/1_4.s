		.data
		
var: 	.word 0x3FFFFFF0

		.text
		.ent main 
		.globl main
		
main:	
		lw $t0, var
		add $t1, $t0, $t0
		li $t2, 40
		addu $t1, $t1, $t2
		move $a0, $t1
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		.end main