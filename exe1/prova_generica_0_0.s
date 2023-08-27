		.data 
p_a: 	.word 0x0FF0  
result: .space 1
		.text 
		.globl main
		.ent main
main: 
		lw $a1, p_a
		lui $t0, 0  #contatore
		lui $s0, 0  #indice_ciclo_for
		addi $s1, $0, 1   #word_di_verifica_con_la_and
		addi $t1, $0, 32
for:	beq $s0, $t1, done
		and $s2, $a1, $s1 #mette_in_s2_il risultato_della_and
		bne $s2, $s1, ET1  #se_diversi_vai_a_ET1_altrimenti_incrementi_il_contatore
		addi $t0, $t0, 1  #incremento_contatore
ET1:	srl $a1, $a1, 1   #shift_a_dx_di_1_bit
		addi $s0, $s0, 1   #incremento_ciclo_for
		j for
		sw $t0, result
done:	li $v0, 10
		syscall
		.end main
