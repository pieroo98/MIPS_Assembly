		.data
		
n1: 	.byte 10	#decimale
n2: 	.byte 0x10  #esadecimale
n3: 	.byte '1'  #carattere_ascii
res:	.space 1

		.text
		.globl main
		.ent main
main:
		lb $a1, n1
		lb $a2, n2
		lb $a3, n3
		
		sub $a1, $a1, $a2
		add $a1, $a1, $a3
		sb $a1, res
		
		li $v0, 10
		syscall
		.end main