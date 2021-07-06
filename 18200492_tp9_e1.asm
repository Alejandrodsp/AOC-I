	li $t0 150 #carrega os valores X,Y,Z e R
	li $t1 230
	li $t2 991
	li $t3 0  

	move $a0 $t0 #carrega argumentos para função
	move $a1 $t1
	move $a2 $t2


	addi $sp, $sp, -4 #atualiza o topo da pilha
        sw $ra, ($sp) #Coloca a chamada a funçao no topo da pilha
	jal soma3n
	move $t3, $a0 #move o resultado para $t3
	li $v0, 10#chamada para terminar o programa
	syscall
  

soma3n: addi $sp, $sp, -4 #empilha a chamada a função soma
	sw $ra, ($sp)
	jal soma #chama o soma pela primeira vez
	nop
	move $a1, $a2	#move a2 para a1, para ser somado com o resultado que esta em a0
	jal soma #chama o soma pela segunda vez para somar com o $t2
	nop	
	lw $ra, ($sp) 
	addi $sp, $sp, 4 #desempilha a chamada
	jr $ra #retorna para o main
		
soma: addi $sp, $sp, -4 #empilha a chamada
      sw $ra, ($sp)  
      add $a0, $a0, $a1    #soma a0 com a1
      lw $ra, ($sp) 
      addi $sp, $sp, 4     #desempilha a chamada 
      jr $ra #retorna para soma3n
      



