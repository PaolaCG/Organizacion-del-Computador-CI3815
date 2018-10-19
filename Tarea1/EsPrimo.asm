.data
message: .asciiz "Bienvenido "
num: .word	45					# Numero a verificar si es primo o no

.text
main:
 	lw	$a0, num
	addi	$t0, $zero, 2				# int x = 2
	
is_prime_test:
	slt	$t1, $t0, $a0					
	bne	$t1, $zero, is_prime_loop		# if (x > num)
	addi	$v0, $zero, 1				# El numero es primo!!
	b return					# y en $v0 almacena 1 

is_prime_loop:						# else
	div	$a0, $t0					
	mfhi	$t3					# c = (num % x)
	slti	$t4, $t3, 1				
	beq	$t4, $zero, is_prime_loop_cont		# if (c == 0)
	add	$v0, $zero, $zero			# 
	b 	return					# en $v0 almacena  0 si
							# el numero no es primo
is_prime_loop_cont:		
	addi 	$t0, $t0, 1				# x++
	j	is_prime_test				# continua verificando si  
							# es primo o no

return:
	add	$a0, $zero, $v0				# Escribe el resultado en la 
	li	$v0, 1					# salida estandar
	syscall						# 1 para numero primo
							# 0 para no primo
	

	li	$v0, 10					# Finaliza la ejecucion
	syscall	

