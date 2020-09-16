.begin
.org 2048

!20.- Un programa recibe via stack la dirección de inicio y el largo de un vector y devuelve su valor
!máximo y su valor mínimo también por stack. El cálculo del máximo se realiza invocando una
!subrutina declarada en el mismo módulo mientras que el cálculo del mínimo se realiza invocando
!una subrutina declarada en un módulo externo. Proponer un código para el programa principal y
!para ambas rutinas

!se hace push de %r1
!se hace pop en %r2
!%r13 ---------> guarda el llamado al programa

iniciarStackPointer: ld direccionStackPointer, %r0, %r14

!------------------------------MAIN------------------------------------------------------------------
!---------------Pongo la direccion del vector y la longitud del vector en la pila--------------------
	ld direccionVector, %r0, %r1
	call push
	ld largoVector, %r0, %r1
	call push
LlamadoAPrograma: ld LlamadoAPrograma, %r0, %r13
	call Programa 	


!-----------------------------FIN MAIN---------------------------------------------------------------

!------------------------ Programa pedido------------------------------------------------------------ 
Programa: call pop
	add %r2, %r0, %r3 !%r3 --------------> largoVector 
	call pop
	add %r2, %r0, %r4 !%r4 -------------> direccionVector
	
	add %r4, %r0, %r5 !%r5 ------------> punteroMovil
	add %r3, %r0, %r6 !%r6 -----------> contadorDePosiciones

	add %r0, %r0, %r8 !r8 -----------> maximoActual

loopMax:call ActualizarFlags
	be finMax !si el contadorDePosiciones esta en 0, termine de recorrer el vector 
  	ld %r5, %r0, %r7 !%r7 -----------> aComparar
	subcc %r8, %r7, %r0 
	bleu nuevoMaximo
restar:add %r6, -1, %r6
	add %r5, 4, %r5
	ba loopMax
	
nuevoMaximo: add %r7, %r0, %r8
	ba restar 


finMax: add %r8, %r0, %r1
	call push
	jmpl %r13+4, %r0

!-------------------------------FIN PROGRAMA PEDIDO-------------------------------------------------
push: add %r14, -4, %r14
	st %r1, %r0, %r14
	jmpl %r15+4, %r0

pop: ld %r14, %r0, %r2
	add %r14, 4, %r14
	jmpl %r15+4, %r0

ActualizarFlags: addcc %r6, %r0, %r6  !Actualiza los flags para %r6
	jmpl %r15+4, %r0
	
	

direccionStackPointer: 0x80000000 
direccionVector: 2300
largoVector: 8 

!---------------Inicializo el vector ubicado en la direccion 2300--------------
.org 2300
1
7
4
3
8
5
2
0
1



.end
