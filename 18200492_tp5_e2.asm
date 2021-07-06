.data
y: .space 4
.text
lui $t0, 0x1001 #colocando o registrador base em t0
loop: addi $t1, $t1, 1 #coloca contador + 1
add $t3, $t3, $t1 #faz o somatorio t3 = t3 + t1
slti  $t2, $t1, 333 #verifica se o contador chegou em 333
bne $t2, $zero, loop #se nao for volta para cima e faz tudo de novo
sw $t3, 0x0($t0) 
