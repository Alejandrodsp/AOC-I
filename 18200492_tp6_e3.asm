.data #coloca valores na memoria
.word 19
.word 9
.word 6
.space 4
.text
lui $t0, 0x1001 #endereco base
lw $t1, 0x0($t0) #carrega os valores
lw $t2, 0x4($t0)
lw $t3, 0x8($t0)
slt $t4, $t1, $t2 #se t1 e menor que t2
beq $t4, $zero, trocat1_t2 #se t2 e maior que t1 troca eles
primeiro:slt $t4, $t1, $t3
beq $t4, $zero, trocat1_t3 #se t3 e maior que t1 troca eles
segundo:slt $t4, $t2, $t3
beq $t4, $zero, trocat2_t3 #se t3 e maior que t2 troca eles
trocat1_t2:
or $t5, $t1, $zero #fazendo a troca, t5 e o registrador temporario
or $t1, $t2, $zero
or $t2,$t5, $zero
j primeiro #para voltar para o lugar certo da execucao
trocat1_t3:
or $t5, $t1, $zero #fazendo a troca, t5 e o registrador temporario
or $t1, $t3, $zero
or $t3,$t5, $zero
j segundo #para voltar para o lugar certo da execucao
trocat2_t3:
or $t5, $t2, $zero #fazendo a troca, t5 e o registrador temporario
or $t2, $t3, $zero
or $t3,$t5, $zero
sw $t2, 0xc($t0) #salva o resultado na memoria




