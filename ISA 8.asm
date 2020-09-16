.begin
.org 2048

!Ejercicio 8 sumar 2 numeros utilizando una macro y pasaje por registro

!OBSERVAR: DIRECC ES EL ARGUMENTO DE LA MACRO, ES LA DIRECCION DONDE DEJARE LA SUMA
!asumire que los operando estan en %r1 y %r2, devolvere el resultado por %r3

.macro sumar 
	add %r1, %r2, %r3
.endmacro

ld X, %r0, %r1
ld Y, %r0, %r2

sumar 

st %r3, %r0, Z


X:25
Y:35
Z:

.end
