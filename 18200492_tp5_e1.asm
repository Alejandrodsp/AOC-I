.data 
a: .half 30
b: .half 5
y: .space 4
.text 
lui $t0, 0x1001 #colocando o registrador base em t0
lh $t1, 0x0($t0) #carregando os valores da memoria para os registradores sendo half words
lh $t2, 0x2($t0) 
beq $t1, $t2, multiplicacao #se forem iguais salta para multiplicacao
div $t1, $t2 #se nao só divide os numeros
mflo $t3
sw $t3, 0x4($t0) #salva o resultado da divisao na posicao de memoria 0x10010004
j fim #fim do cod
multiplicacao: mult $t1, $t2 #faz a multiplicacao
mflo $t3
sw $t3, 0x4($t0)#salva o resultado da multiplicacao na posicao de memoria 0x10010004
fim:
