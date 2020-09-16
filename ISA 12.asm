.begin
.org 2048

!12.- La multiplicación no forma parte de las operaciones aritméticas incluidas en el set de
!instrucciones ARC. Escriba una subrutina que recibe por la pila los números a multiplicar y
!devuelve por la pila su producto (la multiplicación no necesariamente debe ser implementada
!siguiendo un método óptimo). En caso de que el producto de ambos números no pueda ser
!representado en 32 bits, la subrutina devuelve -1. 

!Lo resolvi para 2 numeros positivos

!-----------------------------------MACROS--------------------------------
.macro push registroAGuardarEnStack
	add %r14, -4, %r14
	st registroAGuardarEnStack, %r0, %r14
.endmacro

.macro pop registroDondeReciboDelStack
 	ld %r14, %r0, registroDondeReciboDelStack
	add %r14, 4, %r14
.endmacro

!----------------------------------PRINCIPAL----------------------------------------
ld PunteroAlStack, %r0, %r14

ld Numero1, %r0, %r1
ld Numero2, %r0, %r2

push %r1
push %r2

call multiplicar

pop %r3
st %r3, %r0, Respuesta

ba finDelPrograma


!-------------------------------RUTINAS---------------------------------------------
multiplicar: pop %r8
pop %r9
add %r0, %r0, %r10 !Me aseguro de que r10 este vacio. %r10 tendra mi respuesta

!AHORA TENGO LOS DATOS EN R8 Y R9, LO VOY A HACER ES QUE MIENTRAS R8 NO SEA CERO SUMARE el contenido de R9 TODO EL TIEMPO HASTA TENER (contenido de R8) VECES (el contenido de R9). Resultado en %r10

loop: addcc %r8, %r0, %r0
	be finLoop !Si es zero termino el loop, sino, continuo abajo
	addcc %r9, %r10, %r10
	bcs noEsRepresentable !Si el carry da 1 no es respresentable en 32 bits
	add %r8, -1, %r8	
	ba loop

noEsRepresentable: 
	add %r0, -1, %r10
	ba finLoop

finLoop: push %r10
	jmpl %r15+4, %r0

!-----------------------------DATOS----------------------------------------------
Numero1: 1000000000 !modificar los valores y ver los resultados
Numero2: 1000000000 !modificar los valores y ver los resultados
Respuesta: .dwb 1
PunteroAlStack: 0x80000000

!-----------------------------FIN DEL PROGRAMA-----------------------------
finDelPrograma:

.end
