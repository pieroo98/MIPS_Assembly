		.data
array:	.space 80
		
		.text
		.globl main
		.ent main
		
main:

		la $s0, array
		
		addi $s1, $0, 2
		addi $s2, $0, 20
		
		lw $t0, 0($s0)
		addi $t0, $0, 1
		sw $t0, 0($s0)
		addi $t2, $s0, 4 
		lw $t0, 0($t2)
		addi $t0, $0, 1
		sw $t0, 0($t2)

for:	slt $t1, $s1, $s2
		beq $t1, $0, end
		lw $t0, 0($t2)
		lw $t3, -4($t2)
		addi $t2, $t2, 4
		lw $t4, 0($t2)
		add $t4, $t3, $t0
		sw $t4, 0($t2)
		addi $s1, $s1, 1
		j for
end: 
		li $v0, 10
		syscall
		.end main
