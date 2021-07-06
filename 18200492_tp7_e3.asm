.data
vetor:   .word  10,2,3,4,5,6,7,8,9,1
.text
addi $t0, $zero, 1
addi $t1, $zero, 9
la $t2 vetor #leitura
leitura:
slt $t5, $t6, $t1
beq $t5, $zero, fim
lw $t3, 0($t2)
lw $t4, 4($t2)
slt $t5, $t4, $t3
bne $t5, $zero, naoordenado
addi $t2, $t2, 4
addi $t6, $t6, 1
j leitura


naoordenado:
addi $t0, $zero, 0
addi $t2, $t2, 4
addi $t6, $t6, 1
j leitura
fim:
