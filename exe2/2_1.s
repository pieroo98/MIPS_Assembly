			.data
paris:		.asciiz "pari"
disparis:	.asciiz "dispari"

		.text
		.globl main
		.ent main
		
main: 

		li $v0, 5
		syscall
		andi $t0, $v0, 1
		la $a0, paris
		beq $t0, $0, salto
		la $a0, disparis
salto:
		li $v0, 4
		syscall
		li $v0 ,10
		syscall
		.end main
		