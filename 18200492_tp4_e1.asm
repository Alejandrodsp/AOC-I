.data
a: .word 3    #carregando os valores pedidos na memoria
b: .word 5 
y: .space 4
.text		#inicio das instruçoes
lui $t1, 0x1001  #colocando o endereço base no registrador $t1
lw $t2, 0x0($t1) #fazendo um load no primeiro valor
lw $t3, 0x4($t1) #load no segundp
addi $t4, $zero, 32 #carregando o valor 32 para fazer o calculo
mult $t2, $t3  #multiplicando a e b
mflo $t5 #salvando resultado em $t5
mult $t5, $t4 #multiplicando o resultado com 32
mflo $t4 #salvando em $t4
addi $t5, $zero, -3 #colocando o valor -3
mult $t2, $t5 #multiplicando 3 por -3
mflo $t5 #salvando resultado em $t5
addi $t6, $zero, 7 #carregando o valor 7
mult $t3, $t6 # multiplicando 7 por b
mflo $t6 #salvando em $t6
addi $t7, $zero, 13 #carregando o valor 13
add $t4, $t4, $t5 #somando todos resultados
add $t4, $t4,$t6
sub $t4, $t4,$t7
sw $t4, 0x8($t1) #dando um store no resultado e jogando para y
