.data
x: .word 8
y: .space 4
.text
lui $t0, 0x1001 #colocando o registrador base em t0
lw $t1, 0x0($t0) #carregando o valor da memoria 

 addi $t4, $zero, 1  #colocando 1 no t4
 addi $t2, $zero, 1 #iniciando o contador em 1
beq $t1, $t2, um #se o valor for 1, salta para um
loop:add $t5, $t3, $t4 #se nao for 1, calcula o valor fibonacci, soma t3 com t4 e coloca em t5 o resultado
add $t3, $t4, $zero #copia t4 para t3
add $t4, $t5, $zero #copia o resultado para t4
addi $t2, $t2, 1 #incrementa contador
bne $t2, $t1, loop #verifica se contador é igual a x
j exit #termina
um: addi $t5, $zero, 1 #se for 1, joga para o registrador de resultado o valor 1
j exit
exit:sw $t5, 0x4($t0) #coloca o resultado de t5 na posicao de memoria 0x10010004
