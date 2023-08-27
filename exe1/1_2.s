		.data
		
var1:	.byte 'm'
var2:	.byte 'i'
var3:	.byte 'p'
var4:	.byte 's'
var5:	.byte 0
var6:	.byte 0x20

		.text
		.globl main
		.ent main
		
main:
		lb $t0, var1
		lb $t1, var2
		lb $t2, var3
		lb $t3, var4
		lb $t4, var6
		
		sub $t0, $t0, $t4 
		sub $t1, $t1, $t4
		sub $t2, $t2, $t4
		sub $t3, $t3, $t4
		
		sb $t0, var1
		sb $t1, var2
		sb $t2, var3
		sb $t3, var4
		
		la $a0, var1
		li $v0, 4
		syscall
		
		li $v0, 10
		syscall
		.end main