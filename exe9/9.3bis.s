			.data
mat:		.byte  0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9, 24, 8, 25, 43, 62 
righe:		.word 4
colonne:	.word 5
			.text 
			.globl main 
			.ent main
main:			
			la $a0, mat
			li $a1, 16
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
			beq $a1, $0, primoAngolo	#primoAngolo
			move $s1, $0
			addi $s1, $a3, -1
			beq $a1, $s1, secAngolo		#secAngolo
			slt $s2, $a1, $s1
			move $s3, $0
			addi $s3, $0, 1
			beq $s2, $s3, riga_1		#riga_1
			move $s2, $0
			move $s3, $s0
			addi $s2, $a2, -1
			mult $s2, $a3
			mflo $s1
			beq $a1, $s1, terzoAngolo	#terzoAngolo
			slt $s2, $a1, $s1
			move $s3, $0
			addi $s3, $0, 1
			beq $s2, $s3, tra_sec_e_terz_ango	# puo essere o centrare o prima colonna o ultima colonna
			move $s1, $0
			move $s2, $0
			mult $a2, $a3
			mflo $s1
			addi $s1, $s1, -1
			beq $a1, $s1, quartoAngolo	#quartoAngolo
			slt $s2, $a1, $s1
			beq $s2, $s3, riga_N		#riga_N

primoAngolo:		
			addi $s0, $s0, 1
			lb $t0, ($s0)
			move $t1, $0
			add $t1, $t1, $t0
			add $s0, $s0, $a3
			lb $t0, ($s0)
			add $t1, $t1, $t0
			addi $s0, $s0, -1
			lb $t0, ($s0)
			add $v0, $t1, $t0
			j fine_funzione
secAngolo:			
			addi $s0, $s0, -1
			lb $t0, ($s0)
			move $t1, $0
			add $t1, $t1, $t0
			add $s0, $s0, $a3
			lb $t0, ($s0)
			add $t1, $t1, $t0
			addi $s0, $s0, 1
			lb $t0, ($s0)
			add $v0, $t1, $t0
			j fine_funzione
			
riga_1:		move $t6, $0
			move $s1, $s0
			li $t3, 2
			li $s3, 3
			move $t2, $0
			addi $s1, $s1, -1
for1:		slt $t1, $t2, $t3
			beq $t1, $0, fine
			move $t4, $0
for2:		slt $t1, $t4, $s3
			beq $t1, $0, end_for2
			beq $s0, $s1, somma
			lb $t5, ($s1)
			add $t6, $t6, $t5
somma:		addi $s1, $s1, 1
			addi $t4, $t4, 1
			j for2
end_for2:	
			sub $s4, $a3, $s3
			add $s1, $s1, $s4
			addi $t2, $t2, 1
			j for1
fine:		move $v0, $t6
			j fine_funzione

terzoAngolo:
			addi $s0, $s0, 1
			lb $t0, ($s0)
			move $t1, $0
			add $t1, $t1, $t0
			sub $s0, $s0, $a3
			lb $t0, ($s0)
			add $t1, $t1, $t0
			addi $s0, $s0, -1
			lb $t0, ($s0)
			add $v0, $t1, $t0
			j fine_funzione

tra_sec_e_terz_ango:
			div $a1, $a3
			mfhi $t0
			beq $t0, $0, colonna_1
			li $t1, 4
			beq $t0, $t1, colonna_N
			
			move $s0, $a0
			sub $a0, $a0, $a3
			addi $a0, $a0, -1
			li $t3, 3
			move $t6, $0
for5:		slt $t1, $t2, $t3
			beq $t1, $0, fine3
			move $t4, $0
for6:		slt $t1, $t4, $t3
			beq $t1, $0, end_for6
			beq $s0, $a0, somma3
			lb $t5, ($a0)
			add $t6, $t6, $t5
somma3:		addi $a0, $a0, 1
			addi $t4, $t4, 1
			j for6
end_for6:			
			addi $a0, $a0, 2
			addi $t2, $t2, 1
			j for5
fine3:		move $v0, $t6
			
			j fine_funzione
colonna_1:
			move $t1, $0
			move $t0, $0
			move $t6, $0
			move $s1, $s0
			li $t3, 2
			li $s3, 3
			move $t2, $0
			sub $s1, $s1, $a3
for7:		slt $t1, $t2, $s3
			beq $t1, $0, fine4
			move $t4, $0
for8:		slt $t1, $t4, $t3
			beq $t1, $0, end_for8
			beq $s0, $s1, somma4
			lb $t5, ($s1)
			add $t6, $t6, $t5
somma4:		addi $s1, $s1, 1
			addi $t4, $t4, 1
			j for8
end_for8:	
			sub $s4, $a3, $t3
			# addi $s4, $s4, -1
			add $s1, $s1, $s4
			addi $t2, $t2, 1
			j for7
fine4:		move $v0, $t6
			j fine_funzione

colonna_N:
			move $t1, $0
			move $t0, $0
			move $t6, $0
			move $s1, $s0
			li $t3, 2
			li $s3, 3
			move $t2, $0
			addi $s1, $s1, -1
			sub $s1, $s1, $a3
for9:		slt $t1, $t2, $s3
			beq $t1, $0, fine5
			move $t4, $0
for10:		slt $t1, $t4, $t3
			beq $t1, $0, end_for10
			beq $s0, $s1, somma5
			lb $t5, ($s1)
			add $t6, $t6, $t5
somma5:		addi $s1, $s1, 1
			addi $t4, $t4, 1
			j for10
end_for10:	
			sub $s4, $a3, $s3
			addi $s4, $s4, -1
			add $s1, $s1, $s4
			addi $t2, $t2, 1
			j for9
fine5:		move $v0, $t6
			j fine_funzione
			
quartoAngolo:
			addi $s0, $s0, -1
			lb $t0, ($s0)
			move $t1, $0
			add $t1, $t1, $t0
			sub $s0, $s0, $a3
			lb $t0, ($s0)
			add $t1, $t1, $t0
			addi $s0, $s0, 1
			lb $t0, ($s0)
			add $v0, $t1, $t0
			j fine_funzione
riga_N:
			move $t6, $0
			move $s1, $s0
			li $t3, 2
			li $s3, 3
			move $t2, $0
			addi $s1, $s1, -1
			sub $s1, $s1, $a3
for3:		slt $t1, $t2, $t3
			beq $t1, $0, fine2
			move $t4, $0
for4:		slt $t1, $t4, $s3
			beq $t1, $0, end_for4
			beq $s0, $s1, somma1
			lb $t5, ($s1)
			add $t6, $t6, $t5
somma1:		addi $s1, $s1, 1
			addi $t4, $t4, 1
			j for4
end_for4:	
			sub $s4, $a3, $s3
			add $s1, $s1, $s4
			addi $t2, $t2, 1
			j for3
fine2:		move $v0, $t6
			j fine_funzione

fine_funzione:
			jr $ra