!17.- Un programa recibe a través de %r20 una palabra de 32 bits que representa dos números en
!complemento a 2 en sus dos bytes más significativos y en sus dos bytes menos significativos
!respectivamente. Proponer un código para ese programa tal que devuelva (también por %r20) la
!suma de ambos valores recibidos. 

.begin
.org 2048

ld Secuencia, %r0, %r20

call sumarR20

st %r20, %r0, Respuesta
ba finalizar

sumarR20:
	add %r0, %r20, %r1
	add %r0, %r20, %r2
	
	sra %r1, 16, %r1

	sll %r2, 16, %r2
	sra %r2, 16, %r2  

	add %r1, %r2, %r20
	
	jmpl %r15+4, %r0


Secuencia: 0xff328679 
Respuesta: .dwb 1

finalizar:

!se puede elegir cualquier secuencia en particular esta resulta: 1111-1111-0011-0010-1000-0110-0111-1001
!de donde los primeros 4 bytes son: 1111-1111-0011-0010  <----> -206
!y los siguientes 4 bytes son: 1000-0110-0111-1001  <----> -31111

.end
