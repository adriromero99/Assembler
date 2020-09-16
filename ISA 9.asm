.begin
.org 2048

!Ejercicio 9 dado un numero en complemento a 2 devolver su valor absoluto
!El numero esta alojado en X, devuelvo el valor absoluto en Y
!RECORDEMOS QUE EL COMPLEMENTO A 2 de N en 32 bits es C=2^32-N
!DADO QUE NO PUEDO REPRESENTAR EL 2^32 calculare: C= (2^32-1) - N +1

	ld X, %r0, %r1
	addcc %r1, %r0, %r1 !ACTUALIZO LOS FLAGS PARA SABER SI ES NEGATIVO O POSITIVO

	bneg esNegativo

	st %r1, %r0, Y
	ba finDelPrograma

esNegativo: add %r0, -1, %r2 !CARGO EL VALOR 2^32-1 AL R1
	sub %r2, %r1, %r3
	add %r3, 1, %r3
	st %r3, %r0, Y
	ba finDelPrograma



X: -25
Y: .dwb 1

finDelPrograma:

.end
