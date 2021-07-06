.data
.word 1 #colocando valores no vetor de tamanho 8
.word 2
.word 3
.word 4
.word 5
.word 6
.word 7
.word 8
.text
lui $t0, 0x1001 #endereco base
addi $t3, $zero, 2 #colocando o valor 2 em t3, para usar na divisao
for:slti $t1, $t6, 8  #for de 0 a 8
beq $t1, $zero, fimfor #se for zero salta para o fim do for
div $t6, $t3 #divisao
mfhi $t4 #move resultado para t4
bne $t4, $zero, else #salto para if 
mult $t6, $t3 #multiplica 
mflo $t4 #salva em t4

sw $t4, 0x0($t0) #grava na memoria 
j fimif
else:
lw $t4, 0x0($t0) #se for impar o indice carrega o vetor i+1
lw $t5, -4($t0) #carrega o i
add $t4, $t4, $t5 #soma eles

sw $t4, 0x0($t0) #grava na memoria
fimif:
addi $t6, $t6, 1 #incremento contador
addi $t0, $t0, 0x4 #incremento endereco base para ir para proxima posicao do vetor
j for #volta para for
fimfor: #final do codigo