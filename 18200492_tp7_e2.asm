.data
string: .asciiz "meu professor e o melhor"
.text
la $t0 string #leitura
lbu $t1, 0($t0)
addi $t2, $zero, 32
beq $t1, $t2, loop
addi $t1, $t1, -32
sb $t1, 0($t0)
addi $t0, $t0, 1
loop:lbu $t1, 0($t0)
beq $t1, $zero, fim
lbu $t3, -1($t0)
bne $t2, $t3, naoespaco
addi $t1, $t1, -32
sb $t1, 0($t0)
naoespaco:
addi $t0, $t0, 1
j loop

fim:
sb $zero, 0($t0)
