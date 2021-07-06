li $v0 5 #le primeiro valor do teclado
syscall
move $a0 $v0 #coloco em a0
li $v0 5 #le segundo valor do teclado
syscall
move $a1 $v0 #coloco em a1
li $v0 5 #le terceiro valor do teclado
syscall
move $a2 $v0 #coloco em a2
jal sub #chamo a sub rotina para calcular a media dos valores
move $t5 $v0 #salvo o resultado em t5
li $v0 10 #chamada para o fim do programa
syscall

sub:
add $a0 $a0 $a1 #soma os valores para calculo da media
add $a0 $a0 $a2
addi $a3 $zero 3 #valor para divisao
div $a0 $a3 #divido a soma por 3 para obter a media
mflo $v0 #resultado em v0
jr $ra #retorno a execuçao do programa