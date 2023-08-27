				.data
str_orig: 		.asciiz "% nella citta' dolente, % nell'eterno dolore, % tra la perduta gente %"
str_sost:		.asciiz "per me si va" 
str_new: 		.space 200
termina:		.word 0x00
pp:				.byte '%'
				.text
				.globl main
				.ent main
main:		
				la $a0, str_orig
				la $a1, str_sost
				la $a2, str_new
				lw $a3, termina
				subu $sp, $sp, 4
				sw $ra, ($sp)
				lb $t0, pp
				subu $sp, $sp, 4
				sb $t0, ($sp)
				jal sostituisci
				lw $t0, ($sp)
				addi $sp, $sp, 4
				lw $ra, ($sp) 
				addi $sp, $sp, 4
				jr $ra		
sostituisci:	
				lb $t1, ($a0)
for:			beq $t1, $a3, fine
				beq $t1, $t0, unisci
				j altro
		
unisci:			la $a1, str_sost
				addi $a0, $a0, 1
				lb $t1, ($a0)
ciclo:			lb $t3, ($a1)
				beq $t3, $a3, altro
				sb $t3, ($a2)
				addi $a1, $a1, 1
				addi $a2, $a2, 1
				j ciclo
altro:			
				sb $t1, ($a2)
				addi $a2, $a2, 1
				addi $a0, $a0, 1
				lb $t1, ($a0)
				j for
fine:
				jr $ra