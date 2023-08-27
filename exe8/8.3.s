				.data
num:			.word 5
sconto:			.word 30
arrotonda:		.word 0
prezzi:			.word 39, 1880, 2394, 1000, 1590
scontati:		.space 20

				.text
				.globl main
				.ent main
main:				
				la $a0, prezzi
				la $a1, scontati
				lw $a2, num
				lw $a3, sconto
				subu $sp, $sp, 4
				sw $ra, ($sp)
				subu $sp, $sp, 4
				lw $t0, arrotonda
				sw $t0, ($sp)
				jal calcola_sconto
				move $a0, $v0
				li $v0, 1
				syscall
				lw $t0, ($sp)
				addi $sp, $sp, 4
				lw $ra, ($sp)
				addi $sp, $sp, 4
				jr $ra

calcola_sconto:	
				move $t1, $0
				move $v0, $0
				addi $t1, $0, 100
				move $s0, $t1
				srl $s0, $s0, 1
				sub $a3, $t1, $a3 
for:				
				slt $t3, $t2, $a2
				beq $t3, $0, fine
				lw $t4, ($a0)
				mult $t4, $a3
				mflo $t3
				div $t3, $t1
				mflo $t3
				andi $t5, $t0, 1
				bne $t5, $0, devi_arrotondare
				sw $t3, ($a1)
				j dopo
devi_arrotondare:
				mfhi $t6
				slt $t7, $t6, $s0
				bne $t7, $0, dopo
				addi $t3, $t3, 1
				sw $t3, ($a1)
dopo:			
				sub $t5, $t4, $t3
				add $v0, $v0, $t5
				addi $t2, $t2, 1
				addi $a0, $a0, 4
				addi $a1, $a1, 4
				j for
fine:				
				jr $ra