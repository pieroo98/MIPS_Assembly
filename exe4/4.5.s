		.data
matri:	.word 154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0
		.text
		.globl main
		.ent main
		
main:
		la $t4, matri
		addi $t0, $0, 0
		addi $t1, $0, 5
		addi $t6, $0, 3
for1:	
		slt $t2, $t0, $t6
		beq $t2, $0, finefor
		
		move $s2, $0
		move $t5, $0
for2:	
		slt $t2, $s2, $t1
		beq $t2, $0, finef1
		lw $t3, 0($t4)
		add $t5, $t3, $t5
		addi $t4, $t4, 4
		addi $s2, $s2, 1
		j for2
finef1:
		sw $t5, 0($t4)
		addi $t0, $t0, 1
		addi $t4, $t4, 4
		j for1
		
		
		
		
finefor:		
		la $t4, matri
		la $s0, matri
		addi $t1, $t1, 1
		move $t0, $0
		
for3:
		slt $t2, $t0, $t1
		beq $t2, $0, finef2
		
		move $s2, $0
		move $t5, $0
		
for4:
		slt $t2, $s2, $t6
		beq $t2, $0, finefor2
		lw $t3, 0($t4)
		add $t5, $t3, $t5
		addi $t4, $t4, 24
		addi $s2, $s2, 1
		j for4
finefor2:
		sw $t5, 0($t4)
		addi $t0, $t0, 1
		move $t4, $0
		addi $s0, $s0, 4
		move $t4, $s0
		j for3


finef2:
		move $t1, $0
		move $s3, $0
		addi $t1, $0, 5
		move $t0, $0
		la $t4, matri
		addi $t4, $t4, 76
for5:
		slt $t2, $t0, $t1
		beq $t2, $0, finee
		lw $t3, 0($t4)
		add $s3, $t3, $s3
		addi $t0, $t0, 1
		addi $t4, $t4, 4
		j for5

finee:	
		add $t5, $t5, $s3
		sw $t5, 0($t4)
							#piccolo errore di somma alla fine nell'ultimo conto.
		li $v0, 10
		syscall
		.end main