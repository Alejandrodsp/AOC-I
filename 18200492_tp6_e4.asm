.data #carrega o valor de n para ter o n!
.word 7
.space 4
.text
lui $t0, 0x1001 #registrador base
lw $t1, 0x0($t0) #carrega o n da memoria
beq $t1, $zero, um #para o fatorial de 0
ori $t3, $zero, 1 #iniciando valores
ori $t2, $zero, 1
for:slt $t4, $t2,$t1 #enquanto contador for menor que n
mult $t3, $t2 #faz a multiplicacao
mflo $t3
addi $t2, $t2, 1 #soma um no contador
beq $t4, $zero, fim #vai para o fim
j for #repete de novo
um:
addi $t3, $zero, 1 #fatorial de 0
fim:
sw $t3, 0x4($t0) #salva resultado na memoria