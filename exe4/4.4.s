		.data
array1:	.space 40
array2:	.space 40
matrix:	.space 400

		.text
		.globl main
		.ent main
main:
		la $t1, array1
		la $t2, array2
		la $t4, matrix

		addi $s3, $0, 1
		addi $s0, $0, 0
		addi $s1, $0, 10
for:	
		slt $t3, $s0, $s1
		beq $t3, $0, for2.0
		lw $t0, 0($t1)
		add $t0, $s3, $0
		sw $t0, 0($t1)
		addi $t1, $t1, 4
		addi $s0, $s0, 1
		addi $s3, $s3, 1
		j for
		
for2.0:		
		move $s0, $0
		move $s3, $0
		addi $s3, $0, 1
		
for2:	
		slt $t3, $s0, $s1
		beq $t3, $0, mat1.0
		lw $t0, 0($t2)
		add $t0, $s3, $0
		sw $t0, 0($t2)
		addi $t2, $t2, 4
		addi $s0, $s0, 1
		addi $s3, $s3, 1
		j for2
		
mat1.0:		
		move $s0, $0
		
		la $t1, array1
mat1:	
		slt $t3, $s0, $s1
		beq $t3, $0, fine
		lw $t0, 0($t1)
		move $s2, $0
		la $t2, array2
mat2:	slt $t3, $s2, $s1
		beq $t3, $0, fmat2
		lw $t5, 0($t2)
		mult $t0, $t5
		mflo $t6
		sw $t6, 0($t4)
		addi $t4, $t4, 4
		addi $t2, $t2, 4
		addi $s2, $s2, 1
		j mat2

fmat2:	
		addi $t1, $t1, 4
		addi $s0, $s0, 1
		j mat1
		
fine: 	
		li $v0, 10
		syscall
		.end main