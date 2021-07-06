.data
string: .asciiz "Eu amo muito meu professor de AOC-I."
.text 
la $t0 string #leitura
la $t1 string #escrita
addi $t3, $zero, 32
leitura:lbu $t2, 0($t0)
beq $t2, $zero, fim
beq $t2, $t3, espaco
sb $t2, 0($t1)
addi $t0, $t0, 1
addi $t1, $t1, 1
j leitura

espaco:
addi $t0, $t0, 1
j leitura


fim:
sb $zero, 0($t1)