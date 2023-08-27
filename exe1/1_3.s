		.data
		
op1:	.byte 150
op2:	.byte 100

		.text
		.globl main
		.ent main
		
main: 
		lbu $s0, op1
		lb $s1, op2
		add $a0, $s0, $s1
		
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		.end main