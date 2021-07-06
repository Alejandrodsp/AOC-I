.data
Buffer: .space 200
Menu:	.ascii "           SISTEMA DE VENDAS\n\n1)Cadastrar\n2)Vender\n3)Listar\n4)Lucro\n5)Excluir\n6)Sair\n\0"
Opcao_invalida: .ascii "Opcao invalida, digite novamente: \0"
Nova_linha: .ascii "\n\0"
Quantidade: .ascii "Informe a quantidade: \0"
Codigo: .ascii "Codigo produto: \0"
Nome: .ascii "Nome do produto: \0"
Valor: .ascii "Valor: R$ \0"


.text
Retorna_Menu:li $v0, 51 # chamada para menu
	     la $a0, Menu
             syscall 
             
	li $s0 1 #carregando valores para comparar com a opção desejada
	li $s1 2
	li $s2 3
	li $s3 4
	li $s4 5
	li $s5 6
	beq $a0 $s0 opcao1
	beq $a0 $s1 opcao2
	beq $a0 $s2 opcao3
	beq $a0 $s3 opcao4
	beq $a0 $s4 opcao5
	beq $a0 $s5 opcao6
	li $v0, 55 # mensagem opcao invalida
	la $a0, Opcao_invalida
	li $a1 2
        syscall 
	j Retorna_Menu
opcao1:
jal Cadastro
j Retorna_Menu

opcao2:
jal Vender
j Retorna_Menu

opcao3:
jal Listar
j Retorna_Menu

opcao4:
jal Lucro
j Retorna_Menu

opcao5:
jal Excluir
j Retorna_Menu

opcao6:
jal Sair


Cadastro:
	li $v0 51 #Chamada para imprimir mensagem pro usuario
	la $a0 Codigo #Carregando o endereço
	syscall
	sw $a0 Buffer($t0) #salva no buffer
	addi $t0 $t0 4 #anda o buffer o tamanho de um inteiro
	li $v0 54 #Chamada para imprimir mensagem pro usuario
	la $a0 Nome #Carregando o endereço
	la $a1 Buffer($t0) #Coloca no buffer o nome do produto
	li $a2 12 #tamanho estipulado para a string nome
	syscall
	addi $t0 $t0 12 #anda os 12 bits que foram reservados para o nome do produto
	li $v0 52 #Chamada para imprimir mensagem pro usuario
	la $a0 Valor #Carregando o endereÃ§o
	syscall
	swc1 $f0 Buffer($t0) #salva no buffer
	addi $t0 $t0 4 #anda o tamanho de um float
	addi $t2 $t2 1 #quantidade
	jr $ra	
Vender:
	li $t1 0 #zerando o registrador para usar como offset
	li $t3 0 #zerando contador
loop: beq $t3 $t2 fim1 #enquanto contador < quantidade
	li $v0 51 #Chamada para imprimir mensagem pro usuario
	la $a0 Codigo #Carregando o endereço
	syscall
	lw $t4 Buffer($t1) #vai lendo os codigos do buffer 
	beq $t4 $a0 encontrado #compara o codigo lido da memoria com o que o usuario digitou se for igual achou o produto
	addi $t1 $t1 20 #se nao for incrementa 20 no offset para chegar no proximo cod de produto 
	addi $t3 $t3 1 #incrementa o contador
	j loop
encontrado:
	addi $t1 $t1 16 #se encontrou anda 16 no produto encontrado para chegar no valor dele
	lwc1 $f1 Buffer($t1) #carrega o valor da memoria
	li $v0 52 #Chamada para imprimir mensagem pro usuario
	la $a0 Quantidade #Carregando o endereço
	syscall
	mul.s $f3 $f0 $f1 #quantidade * valor do produto
	add.s $f4 $f4 $f3 #coloca o valor da venda na variavel que guarda o lucro total obtido
fim1:
	jr $ra
Listar:
	li $t1 0 #zerando esse registrador para usar ele como offset
	li $t3 0 #zerando contador
for:beq $t3 $t2 fim2 #enquanto contador for menor que numero de produtos
	li $v0 56 #Chamada para imprimir mensagem pro usuario
	la $a0 Codigo #Carregando o endereço
	lw $a1 Buffer($t1) #carrega o cod produto
	syscall 
	addi $t1 $t1 4 #anda o tamanho do inteiro
	li $v0 59 #Chamada para imprimir mensagem pro usuario
	la $a0 Nome #Carregando o endereÃ§o
	la $a1 Buffer($t1)  #endereço base
	syscall
	li $v0 57 #Chamada para imprimir mensagem pro usuario
	la $a0 Valor #Carregando o endereÃ§o
	addi $t1 $t1 12 #anda o tamanho da string
	lwc1 $f12 Buffer($t1) #le o float
	syscall
	addi $t1 $t1 4 #anda o tamanho do float
	addi $t3 $t3 1 #incrementa o contador
	j for
fim2:
	jr $ra
Lucro:
	li $v0 57 #Chamada para imprimir mensagem pro usuario
	la $a0 Valor #Carregando o endereÃ§o
	mov.s $f12 $f4 #move o lucro total para f12 para mostrar na tela
	syscall
	jr $ra
Excluir:
	li $v0 51 #Chamada para imprimir mensagem pro usuario
	la $a0 Codigo #Carregando o endereço
	syscall
	li $t1 0 #zerando o registrador para usar como offset
	li $t3 0 #zerando contador
loop2: beq $t3 $t2 fim3 #enquanto contador < quantidade
	lw $t4 Buffer($t1) #vai lendo os codigos do buffer 
	beq $t4 $a0 encontrado2 #compara o codigo lido da memoria com o que o usuario digitou se for igual achou o produto
	addi $t1 $t1 20 #se nao for incrementa 20 no offset para chegar no proximo cod de produto 
	addi $t3 $t3 1 #incrementa o contador
	j loop2
encontrado2:
loop4:  beq $t3 $t2 fim3 #enquanto contador < quantidade
	move $t5 $t1 #copio o endereco do offset que encontrou o cod
	addi $t5 $t5 20 #ando esse outro offset para apontar para o proximo produto
	lw $t4 Buffer($t5) #le produto a frente do que vai ser excluido, aqui leio o codigo do produto
	sw $t4 Buffer($t1) #gravo na posicao do que foi excluido
	addi $t1 $t1 4 
	addi $t5 $t5 4 
	lw $t4 Buffer($t5) #le produto a frente do que vai ser excluido, aqui os 4  primeiros chars da string
	sw $t4 Buffer($t1) #gravo na posicao do que foi excluido
	addi $t1 $t1 4 
	addi $t5 $t5 4 
	lw $t4 Buffer($t5) #le produto a frente do que vai ser excluido, outros 4
	sw $t4 Buffer($t1) #gravo na posicao do que foi excluido
	addi $t1 $t1 4 
	addi $t5 $t5 4 
	lw $t4 Buffer($t5) #le produto a frente do que vai ser excluido, outros 4
	sw $t4 Buffer($t1) #gravo na posicao do que foi excluido
	addi $t1 $t1 4 
	addi $t5 $t5 4 	
	lwc1 $f5 Buffer($t5) #le produto a frente do que vai ser excluido, aqui leio o valor
	swc1 $f5 Buffer($t1) #gravo na posicao do que foi excluido
	addi $t1 $t1 4 
	addi $t5 $t5 4 
	addi $t3 $t3 1 #incrementa o contador
	j loop4
	
fim3:
	addi $t2 $t2 -1 #decrementa a quantidade
	jr $ra

Sair:
	li $v0 10
	syscall


