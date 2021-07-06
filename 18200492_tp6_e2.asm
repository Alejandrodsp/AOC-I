.data
.word 5 #carrega um valor na memoria
.space 4 #reserva espaco para o resultado
.text
lui $t0, 0x1001 #endereco base
lw $t1, 0x0($t0) #coloca em t1 o valor da memoria
addi $t3, $zero, 2 #coloco o 2 para usar nas divisoes
addi $t6, $zero, 1 #neutro para multiplicacao
for:slt $t4, $t2, $t1 #faz enquanto t2 menor que t1
beq $t4, $zero, fim #quando nao for pula para o fim
div $t2, $t3 #divide o indice por 2
mflo $t5 
add $t5, $t1, $t5 #soma resultado divisao com o x
mult $t5, $t6 #multiplica 
mflo $t6
addi $t2, $t2, 1 #soma um no indice
j for
fim:
mult $t5, $t6 #termina multiplicando pela ultima vez
mflo $t6
sw $t6, 0x4($t0) #salva resultado na memoria 
