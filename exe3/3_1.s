		.data
msg1:	.asciiz "\ninserisci un carattere: "
ok:		.asciiz "\nvalore numerico \n "
no:		.asciiz "\nvalore non numerico \n "
stampa:	.asciiz " numero di char letti prima del \n carattere di terminazione : "
term:	.byte '\n'
primo:	.byte '/'
ultimo:	.byte ':'

		.text
		.globl main
		.ent main
main:
		lb $s1, term
		lb $s2, primo
		lb $s3, ultimo

		li $v0, 4
		la $a0, msg1
		syscall

		addi $s0, $0, 0
		li $v0, 12
		syscall
		move $t0, $v0

while:	beq $t0, $s1, fine

		slt $t1, $s2, $t0
		addi $s4, $0, 1
		beq $s4, $t1, if2
		j nonNum

if2:	slt $t1, $t0, $s3
		beq $s4, $t1, stu
		j nonNum

stu:	li $v0, 4
		la $a0, ok
		syscall

		move $a0, $t0
		li $v0, 1
		syscall
		j prox

nonNum:
		li $v0, 4
		la $a0, no
		syscall

		move $a0, $t0
		li $v0, 11
		syscall

		li $v0, 4
		la $a0, msg1
		syscall

		li $v0, 12
		syscall
		move $t0, $v0
		addi $s0, $s0, 1
		j while

prox:
		li $v0, 4
		la $a0, msg1
		syscall

		li $v0, 12
		syscall
		move $t0, $v0
		addi $s0, $s0, 1
		j while

fine:
		li $v0, 4
		la $a0, stampa
		syscall

		move $a0, $s0
		li $v0, 1
		syscall
		
		li $v0 , 10
		syscall
		.end main