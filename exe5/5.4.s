			.data
dim:		.word 5
matrice:	.word 1, 4, 5, 6, 7, 4, 2, 8, 6, 4, 5, 8, 3, 2, 9, 6, 6, 2, 4, 4, 7, 4, 9, 4, 5
txt:		.asciiz "non è diagonale\n"
txt2:		.asciiz "la matrice è diagonale\n"
txt3:		.asciiz "la matrice è simmetrica\n"
txt4:		.asciiz "la matrice non è simmetrica\n"
			.text
			.globl main
			.ent main
main:
			lw $t0, dim
			la $t1, matrice
			mult $t0, $t0
			mflo $s0
			sub $s0, $s0, $t0	# num max d zeri per essere diag
			move $s2, $0
			move $t6, $0
miurti:
			slt $s1, $s2, $t0
			beq $s1, $0, dormi
			add $t6, $t6, $s2	#ciclo per contare quante uguaglianze
			addi $s2, $s2, 1	#servono per essere una matrice simmetrica
			j miurti
dormi:			
			move $s1, $0		# contatore ciclo interno
			move $s2, $0		# contatore ciclo esterno
			move $s3, $0		# contatore zeri
for1:		
			slt $s4, $s2, $t0
			beq $s4, $0, salta
			move $s1, $0
for2:		
			slt $s4, $s1, $t0
			beq $s4, $0, finefor
			lw $t2, ($t1)
			bne $t2, $0, diversi
			addi $s3, $s3, 1
diversi:
			addi $t1, $t1, 4
			addi $s1, $s1, 1
			j for2
finefor:			
			addi $s2, $s2, 1
			j for1
salta:			
			beq $s3, $s0, fine
			li $v0, 4
			la $a0, txt
			syscall
			j altrove
fine:		
			la $t1, matrice
			move $s1, $0		# contatore ciclo interno
			move $s3, $0		# contatore num su diag
			move $t2, $0
for3:			
			slt $s4, $s1, $t0
			beq $s4, $0, verifica
			lw $t2, ($t1)
			slt $s2, $0, $t2
			beq $s2, $0, qui
			addi $s3, $s3, 1
qui:		addi $t1, $t1, 24
			addi $s1, $s1, 1
			j for3
verifica:	
			beq $s3, $t0, strampa
			j err
strampa:	
			li $v0, 4
			la $a0, txt2
			syscall
			
			move $s4, $0
			addi $s4, $s4, 2
			move $a0, $s4
			li $v0, 1
			syscall
			j altrove
err:			
			li $v0, 4
			la $a0, txt
			syscall
altrove:	
			move $s1, $0		# contatore ciclo interno
			move $s2, $0		# contatore ciclo esterno
			move $t5, $0		# contatore numeri uguali della matrice
			move $t7, $0
			addi $t7, $t0, 1	# limite max d incremento per matrice simmetrica 
uno:					
			slt $s4, $s2, $t0
			beq $s4, $0, vai
			la $t1, matrice
			la $t2, matrice
			move $s1, $0
			addi $s1, $s2, 1
			sll $s4, $s1, 2
			sll $s3, $s2, 2
			mult $s3, $t0
			mflo $s5			
			add $s5, $s4, $s5
			add $t1, $t1, $s5	
			mult $s4, $t0
			mflo $s5
			add $s5, $s5, $s3
			add $t2, $t2, $s5
due:			
			slt $s4, $s1, $t0
			beq $s4, $0, finedue
			sll $s4, $s1, 2	
			lw $t3, ($t1)
			
			lw $t4, ($t2)
			bne $t3, $t4, uffa
			addi $t5, $t5, 1	#contatore num. uguali
uffa:		
			addi $s1, $s1, 1
			move $s6, $0
			addi $s6, $s6, 20
			slt $s7, $s1, $t7
			beq $s7, $0, prox
			add $t2, $t2, $s6
			addi $t1, $t1, 4
prox:		j due
finedue:	
			addi $s2, $s2, 1
			j uno
vai:
			bne $t5, $t6, tiprego	
			li $v0, 4
			la $a0, txt3
			syscall
			
			move $s4, $0
			addi $s4, $s4, 1
			move $a0, $s4
			li $v0, 1
			syscall
			j basta
tiprego:
			li $v0, 4
			la $a0, txt4
			syscall
			
			move $s4, $0
			move $a0, $s4
			li $v0, 1
			syscall
basta:						
			li $v0, 10
			syscall
			.end main