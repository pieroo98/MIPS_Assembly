		.data
		
msg1: 	.asciiz "introduci il primo valore: "
msg2: 	.asciiz "introduci il secondo valore: "
msg3:	.asciiz "errore caricamento valori. "
sol:	.asciiz "il risultato dell'espressione è : "
prova:	.word 0xFFFFFF00

		.text 
		.globl main 
		.ent main 
main: 

		li $v0, 4 
		la $a0, msg1      
		syscall           
		li $v0, 5  
		syscall 
		move $t0, $v0  
		
		li $v0, 4 
		la $a0, msg2 
		syscall 
		li $v0, 5 
		syscall
		move $t1, $v0
		
		lw $t2, prova
		and $t3, $t0, $t2
		bne $t3, 0, ERR1
		
		and $t3, $t0, $t1
		bne $t3, 0, ERR1
		
		nor $t1, $t1, $t1
		and $t0, $t0, $t1
		nor $t0, $t0, $t0
		xor $t1, $t0, $t1
		or $t4, $t0, $t1
		
		la $a0, sol
		li $v0, 4
		syscall
		
		move $a0, $t4
		li $v0, 1
		syscall
		
		j fine
ERR1:
		la $a0, msg3
		li $v0, 4
		syscall
fine:		
		li $v0 ,10
		syscall
		.end main
		
		