.data #iniciando valores no vetor
.word 19
.word 9
.word 18
.word 4
.word 8
.text
addi $s0, $zero 4 #valor inicial do intervalo
addi $s1, $zero 10 #valor final do intervalo
add $t4, $zero, $s0
addi $t4, $t4, -1 #salvando em t4 o numero do intervalo e tirando 1, pois é intervalo fechado
add $t7, $zero, $s1 #salvando em t7 o numero do intervalo e somando 1, pois é intervalo fechado
addi $t7, $t7, 1
lui $s2, 0x1001 #registrador base
ori $s3, $zero 5 #numero de elementos no vetor
add $t0, $zero, $s2 #salva registrador base em outro registrador para poder editar ele
for:slt $t6, $t5, $s3 #enquanto contador menor que numero de elementos
lw $t1, 0x0($t0) #carrega o valor do vetor
beq $t6, $zero, fimprograma
slt $t2, $t4, $t1 #verifica de o numero do vetor e maior que o inicial do intervalo
bne $t2, $zero, maiorque
j fim
maiorque:slt $t2, $t1, $t7 #verifica de o numero do vetor e menor que o final do intervalo
bne $t2, $zero, menorque
j fim
menorque:
addi $t3, $t3, 1 #resultado em t3
fim:
addi $t0, $t0, 4 #soma 4 no endereco base para acessar o proximo valor do vetor
addi $t5, $t5, 1 #soma 1 no contador
j for #repete
fimprograma: 
