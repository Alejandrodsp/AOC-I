lui $t0 0x1001 #endereço base para armazenar os resultados na memoria
for:li $v0 5 #5 para ler um inteiro
syscall
beq $v0 $zero fim #quando o valor lido for 0 vai para o final do programa
move $t1 $v0 #se nao for 0 move o valor lido para t1
li $v0 5 #le outro numero
syscall
move $t2 $v0 #move para t2 o valor lido
div $t1 $t2 #divide o primeiro valor pelo segundo para obter a media
mflo $t3 #move o resultado da divisao para t3
sw $t3, 0($t0) #grava na memoria o resultado
addi $t0 $t0 4 #incrementa o endereço base para gravar o proximo numero
j for #repete
fim:
li $v0 10 #chamada para fim do programa
syscall