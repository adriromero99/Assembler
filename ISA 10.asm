.begin
.org 2048

!Ejercicio 10, recibir dos numeros en complemento a 2 desde el Stack y decidir si la suma
!es representable en 32 bits, devuelve 0 si es representable y -1 si no lo es

ld X, %r0, %r1
ld Y, %r0, %r2

ld punteroStack, %r0, %r14

add %r14, -4, %r14
st %r1, %r0, %r14

add %r14, -4, %r14
st %r2, %r0, %r14


call esRepresentable

ld %r14, %r0, %r7
add %r14, 4, %r14

st %r7, %r0, Z

ba finDelPrograma





esRepresentable:  ld %r14, %r0, %r9
add %r14, 4, %r14
ld %r14, %r0, %r10
addcc %r9, %r10, %r11
bvs hayOverflow
st %r0, %r0, %r14
jmpl %r15+4, %r0

hayOverflow: 
add %r0, -1, %r12
st %r12, %r0, %r14
jmpl %r15+4, %r0


X: 0x7FFFFFFF
Y: 0x7FFFFFFF
Z: .dwb 1
punteroStack: 0x80000000

finDelPrograma:

.end
