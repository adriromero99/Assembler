.begin
.org 2048

!Ejercicio 6a)Sumar dos numeros mediante pasaje de parametros por pila

!OBSERVACION: EN ARC TOOLS EL REG 14 NO VIENE INICIALIZADO, 
!LO INCIALIZO YO HACIENDO QUE APUNTE A LA DIREX 2^31 = 0x80000000

!Operandos: X,Y --->>> Pila
!Resultado: Z <<<---- Pila


	ld X, %r0, %r1
	ld Y, %r0, %r2

!INCIALIZO LA PILA, ESTO SOLO EN ARCTOOLS PORQUE INCIALMENTE EL %R14 EMPIEZA EN 000000
	ld punteroAPila, %r0, %r14

!Modifico la direccion a la que apunta el puntero y le cargo lo que hay en r1
	add %r14, -4, %r14
	st %r1, %r0, %r14 !GUARDO LO QUE HAY EN R1 EN LA DIRECCION CONTENIDA EN R14

!Modifico la direccion a la que apunta el puntero y le cargo lo que hay en r2
	add %r14, -4, %r14
	st %r2, %r0, %r14 !GUARDO LO QUE HAY EN R1 EN LA DIRECCION CONTENIDA EN R14

	call sumar !Sumar sabe que tiene que sumar las cosas que hay en la pila

	ld %r14, %r0, %r3
	st %r3, %r0, Z


	sumar: !Dado que tenngo lo que tengo que sumar en la pila, lo primero que 
!hago es recuperarlo de ella en los registros %r8 y %r9
	
!Cargo lo que hay en la direccion %r14 al registro %r8 y modifico la direccion del puntero
	ld %r14, %r0, %r8 !CARGO LO QUE HAY EN LA DIRECCION %R14 AL REGISTRO %R8
	add %r14, 4, %r14
	
!Cargo lo que hay en la direccion %r14 al registro %r9 y modifico la direccion del puntero
	ld %r14, %r0, %r9
	add %r14, 4, %r14

!sumo y lo guardo en %r10
	add %r8, %r9, %r10
	st %r10, %r0, %r14 !OBSERVACION: DEJE EN LA PILA EL RESULTADO PISANDO %R1

	jmpl %r15+4, %r0 

	X:40
	Y:50
	Z: .dwb 1
	punteroAPila: 0x80000000

.end
