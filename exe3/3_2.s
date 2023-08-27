		.data
		
msg1:	.asciiz "\ninserisci un numero: "
ok:		.asciiz "\nvalore numerico \n "
no:		.asciiz "\nvalore non numerico \n "
stampa:	.asciiz "\nnumero di char letti prima del carattere di terminazione : "
rex:	.asciiz "\nstampa del numero inserito: "
rexOv:	.asciiz "\nstampa del numero inserito prima dell'overlfow: "
mexover:	.asciiz "\nerrore di overlfow : "

term:	.byte '\n'
primo:	.byte '/'
ultimo:	.byte ':'
zeroo:	.byte '0'
hight:	.word 0xFFFFFFFF

		.text
		.globl main
		.ent main
main:
		lb $s1, term
		lb $s2, primo
		lb $s3, ultimo
		lb $s5, zeroo
		lw $t4, hight
		
		li $v0, 4
		la $a0, msg1
		syscall

		addi $s0, $0, 0
		addi $t2, $0, 0		# valore corrente
		addi $t3, $0, 10
		li $v0, 12
		syscall
		move $t0, $v0

while:	beq $t0, $s1, fine

		slt $t1, $s2, $t0
		addi $s4, $0, 1
		beq $s4, $t1, if2
		j nonNum

if2:	slt $t1, $t0, $s3
		beq $s4, $t1, prox
		j nonNum

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
		sub $t0, $t0, $s5
		mult $t2, $t3
		
		mfhi $s7
		and $t5, $t4, $s7		# qui verifico se è presente overlfow.
		addi $t7, $0, 0
		sltu $t6, $t7, $t5
		addi $t7, $0, 1
		beq $t6, $t7, err
		
		mflo $s6
		sub $t2, $t2, $t2		# azzero t2
		add $t2, $t2, $t0
		add $t2, $t2, $s6
		
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
		la $a0, rex
		syscall

		move $a0, $t2
		li $v0, 1
		syscall

		li $v0, 4
		la $a0, stampa
		syscall

		move $a0, $s0
		li $v0, 1
		syscall
		j terminazione
		
err:	
		li $v0, 4
		la $a0, rexOv
		syscall
		
		move $a0, $t2
		li $v0, 1
		syscall

		li $v0, 4
		la $a0, mexover
		syscall
		
		move $a0, $s7
		li $v0, 1
		syscall
		
terminazione:

		li $v0 , 10
		syscall
		.end main