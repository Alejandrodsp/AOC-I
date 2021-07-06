ori $t1, $0, 16 #carrega o valor inicial
for:beq $t1, $zero, fim #enquanto esse valor nao for 0
srl $t1, $t1, 0x1 #desloca a direita ate que cheguem em 0
addi $t2, $t2, 1 #contador de bits significativos
j for #repete
fim: