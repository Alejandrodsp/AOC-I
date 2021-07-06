.data 
	mensagem: .asciiz "Informe o N: "
.text
li $s1, 1 #Valor para encerrar a recursão
la $a0, mensagem #mostra a mensagem para o usuario pedindo o numero
li $v0, 4
syscall
li $v0, 5 #le o inteiro
syscall
move $t1, $v0 #Move o valor lido para t1
move $a0, $t1 #Passa o valor lido para a0 que é o argumento da função

inicio: addi $sp, $sp, -4
      sw $ra, ($sp) 
      beq $t1, $s1, fim #verifica se ja chegou no 1
      jal for
      j inicio #faz a recursao fazendo os jumps
     
for: addi $sp, $sp, -4#empilha a chamada
      sw $ra, ($sp) #grava a chamada na pilha
      jal fatorial   #chama a subrotina fatorial
      lw $ra, ($sp) #carrega da pilha
      addi $sp, $sp, 4  #desempilha a chamada
      jr $ra          
fatorial: addi $sp, $sp, -4 #empilha a chamada 
          sw $ra, ($sp)       
          subi $t1, $t1, 1    #decrementa 1, para fazer resultado * n-1  
	  mult $t1, $a0 #resultado para o fatorial
          mflo $a0     #move para a0
          lw $ra, ($sp) 
          addi $sp, $sp, 4    #desempilha a chamada
          jr $ra  #retorna para quem chamou
fim:  lw $ra, ($sp)
      addi $sp, $sp, 4  #desempilha a chamada
      move $t1, $a0 #move o resultado para t1
      li $v0, 10 #encerra o programa
      syscall