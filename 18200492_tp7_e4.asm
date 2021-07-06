.data
	vetor: .word 1 2 3 4 5
	
.text

la $t0, vetor #um ponteiro aponta para o começo do vetor para fazer a troca
la $t1, vetor+16 #um ponteiro aponta para o final do vetor para fazer a troca

loop: lw $t2, 0($t0)#carrega o elemento apontado pelo ponteiro do começo
      lw $t3, 0($t1)#carrega o elemento apontado pelo ponteiro do final
      beq $t0, $t1, fim #quando os dois ponteiros apontarem para o mesmo elemento salta para o fim
      sw $t2, 0($t1)#troca eles de posição
      sw $t3, 0($t0)
      addi $t0, $t0, 4 #incrementa o ponteiro do inicio 
      subi $t1, $t1, 4 #decrementa o ponteiro do final 
      j loop   
fim: nop      