!14.- Proponer una rutina que recibe un número entero y devuelve el cuadrado del mismo. En caso de
!que el resultado no pueda ser representado con 32 bits debe devolver -1. 

! %r1 ----> Numero, %r2 ------> Veces a acumular, %r3 ------> Acumulacion

.begin
.org 2048

ld Numero, %r0, %r1

add %r0, %r0, %r3 !Dejo vacio %r3, quien tendra la acumulacion
add %r1, %r0, %r2 !Cargo en %r2 la cantidad de veces a acumlar

ActualizarFlagsInicial: addcc %r2, %r0, %r2


VerificarSiHayQueAcumular: bne Acumular !si %r2 (la cantidad de veces a acumular) no es 0 -> acumulo
ba finalizar
  
Acumular: addcc %r1, %r3, %r3
VerificarRepresentabilidad: bcs NoEsRepresentable !Si el Carry da 1 no es representable
DecrementarYActualizarFlags: addcc %r2, -1, %r2
ba VerificarSiHayQueAcumular

NoEsRepresentable: add %r0, -1, %r3

finalizar: st %r3, %r0, Resultado

Numero: 999999999
Resultado: .dwb 1

.end

