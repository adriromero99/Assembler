.begin
.org 2048

!Ej 15.- Escribir c�digo que recibe a trav�s de %r10 un n�mero en punto flotante y devuelve su valor
!absoluto (tambi�n en punto flotante). 
!Recordemos que lo que diferencia al punto flotante negativo del positivo es solo el bit de signo

ld NroPtoFlotante, %r0, %r1 
sll %r1, 1, %r1 !Me deshago del bit mas significativo
srl %r1, 1, %r1 !Le pongo un 0 al bit mas significativo
st %r1, %r0, ValorAbsoluto




NroPtoFlotante: 0xfe896432
ValorAbsoluto: .dwb 1
.end


