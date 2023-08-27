				.data
vet1:			.word 56, 12, 98, 129, 58
vet2:			.word 1, 0, 245, 129, 12
risultato:		.word -1, -1, -1, -1, -1
				
				.text
				.globl main
				.ent main
main:				
				la $a0, vet1
				la $a1, vet2
				la $a2, risultato
				move $a3, $0
				addi $a3, $0, 5
				subu $sp, $sp, 4
				sw $ra, ($sp)
				jal CalcolaDistanzaH
				
				lw $ra, ($sp)
				addi $sp, $sp, 4
				jr $ra
				
CalcolaDistanzaH:
				addi $t3, $0, 32
for:			slt $t4, $t5, $a3
				beq $t4, $0, fine
				move $t6, $0		#contatore bit diversi
				lw $t0, ($a0)
				lw $t1, ($a1)
				xor $t2, $t0, $t1
				move $t7, $0
altroFor:		slt $t4, $t7, $t3
				beq $t4, $0, accapammu
				andi $s0, $t2, 1
				beq $s0, $0, niente
				addi $t6, $t6, 1
niente:			srl $t2, $t2, 1
				addi $t7, $t7, 1
				j altroFor
accapammu:		sw $t6, ($a2)				
				addi $t5, $t5, 1
				addi $a0, $a0, 4
				addi $a1, $a1, 4
				addi $a2, $a2, 4
				j for
fine:			jr $ra	