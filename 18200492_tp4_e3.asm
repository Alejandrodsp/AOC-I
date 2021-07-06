.data
a: .word-3
b: .word 7
c: .word 5	#colocando os dados pedidos na memoria
d: .word -2
e: .word 8
x: .word 4
y: .space 4  #reservando um espaço na memoria para o resultado
.text  
lui $t1, 0x1001 #colocando o registrador base em t1
lw $t2, 0x0($t1) #carregando os valores da memoria para os registradores
lw $t3, 0x4($t1)
lw $t4, 0x8($t1)
lw $t5, 0xc($t1)
lw $t6, 0x10($t1)
lw $t7, 0x14($t1)  
nor $t2, $zero, $t2 #obtendo o -a
addi $t8, $zero, 1
add $t2, $t2 $t8 
mult $t2, $t7  #realizando a operação ((((-a)x+b)x-c)x+d)x-e) e salvando o resultado sempre em $t0
mflo $t0
add $t0, $t0, $t3
mult $t0, $t7
mflo $t0
sub $t0, $t0 $t4
mult $t0, $t7
mflo $t0
add $t0, $t0, $t5
mult $t0, $t7
mflo $t0
sub $t0, $t0 $t6
sw $t0, 0x18($t1) #por fim movendo o resultado para a posicao de memoria que foi reservada para o resultado
