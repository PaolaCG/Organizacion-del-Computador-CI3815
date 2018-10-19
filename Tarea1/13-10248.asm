.data
message: .asciiz "Bienvenido "
num: .asciiz "	Introduzca el numero a verificar si es primo o no: " 		
primo: .asciiz "el numero es primo"
noprimo: .asciiz "el numero no es primo"

#Paola Castro 13-10248

.text
main:

	li $v0, 4					#para imprimir un string
	la $a0, num					#le digo que va a imprimir
	syscall
	
		
	li	$v0, 5					# para leer un entero
	syscall						
	add	$t5, $zero, $v0				# Guarda el numero introducido en t5
	addi	$t0, $zero, 2				# int x = 2
	
is_prime_test:
	slt	$t1, $t0, $t5					
	bne	$t1, $zero, is_prime_loop		# if (x > num)
	addi	$v0, $zero, 1				# El numero es primo!!
	b return					# y en $v0 almacena 1 

is_prime_loop:						# else
	div	$t5, $t0					
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
	bne	$zero, $v0, resultado_primo		# if (0 != v0) (v0 almacena 1 si el numero es primo
	la	$a0, noprimo				# guarda la direccion del mensaje
	b	result
	
resultado_primo:
	la	$a0, primo				# guarda la direccion del mensaje

result:
							# Escribe el resultado en la 
	li	$v0, 4					# salida estandar
	syscall						# 1 para numero primo
							# 0 para no primo
	

	li	$v0, 10					# Finaliza la ejecucion
	syscall
