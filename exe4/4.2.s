		.data
res:	.space 4
opa:	.word 2043
opb:	.word 5
fase:	.word somma, sottra, moltipl, divis

		.text
		.globl main
		.ent main
main:
		lw $t0, opa
		lw $t1, opb
		
		li $v0, 5
		syscall
		move $s1, $v0
		
		sll $s1, $s1, 2
		lw $s2, fase($s1)
		jr $s2
		
somma:
		add $t0, $t0, $t1
		sw $t0, res
		j fine
		
sottra: 
		sub $t0, $t0, $t1
		sw $t0, res
		j fine

moltipl:
		move $s3, $0
		add $s3, $t0, $0
		sll $t0, $t0, 2
		add $t0, $t0, $s3
		sw $t0, res
		j fine

divis: 
		div $t0, $t1
		mflo $s0
		sw $s0, res
		j fine
		
fine:
		li $v0, 10
		syscall
		.end main
		