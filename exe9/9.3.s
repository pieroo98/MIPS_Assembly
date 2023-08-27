			.data
mat:		.byte  0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9, 24, 8, 25, 43, 62 
righe:		.word 4
colonne:	.word 5
			.text 
			.globl main 
			.ent main
main:			
			la $a0, mat
			li $a1, 12
			lw $a2, righe
			lw $a3, colonne
			subu $sp, $sp, 4
			sw $ra, ($sp)
			jal contaVicini
			move $a0, $v0
			li $v0, 1
			syscall
			lw $ra, ($sp)
			addi $sp, $sp, 4
			jr $ra
			
contaVicini:
			add $a0, $a0, $a1
			move $s0, $a0
			sub $a0, $a0, $a3
			addi $a0, $a0, -1
			li $t3, 3
			move $t6, $0
for1:		slt $t1, $t2, $t3
			beq $t1, $0, fine
			move $t4, $0
for2:		slt $t1, $t4, $t3
			beq $t1, $0, end_for2
			beq $s0, $a0, somma
			lb $t5, ($a0)
			add $t6, $t6, $t5
somma:		addi $a0, $a0, 1
			addi $t4, $t4, 1
			j for2
end_for2:			
			addi $a0, $a0, 2
			addi $t2, $t2, 1
			j for1
fine:		move $v0, $t6
			jr $ra