.begin
.org 2048

!Ejercicio 6a)Sumar dos numeros mediante pasaje de parametros por registros
!Operandos: X,Y --->>> %r1, %r2
!Resultado: Z ---->>> %r3


ld X, %r0, %r1
ld Y, %r0, %r2 

call sumar

st %r3, %r0, Z


sumar: add %r1, %r2, %r3
jmpl %r15+4, %r0

X:40
Y:50
Z:0


.end
