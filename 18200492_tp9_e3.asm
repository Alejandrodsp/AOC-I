.data
menu:.ascii "           MENU\n1)Calcular area da circunferencia\n2)Calcular area do triangulo\n3)Calcular area do retangulo\nInforme a opcao: \0"
area: .ascii "Area: \0"
R: .ascii"Informe o r: \0"
A: .ascii"Informe o a: \0"
B: .ascii"Informe o b: \0"
.text
	la $a0 menu
	li $v0 4
	syscall
	li $v0 5
	syscall
	move $t0 $v0
	li $s0 1 #valores para comparar com a opção desejada do usuario
	li $s1 2 #utilizarei para a divisao no calculo da area do triangulo
	li $s2 3 #utilizarei este valor como PI arredondado
	beq $s0 $t0 Calculo_circunferencia
	beq $s1 $t0 Calculo_triangulo
	beq $s2 $t0 Calculo_retangulo
Calculo_circunferencia:
	addi $sp, $sp, -4
	sw $ra, ($sp) 
 	jal circunferencia
 	la $a0 area
	li $v0 4
	syscall
 	move $v0, $t2
	la $a0, ($t2)	
	li $v0, 1
	syscall
 	li $v0, 10 #encerra o programa
  	syscall
Calculo_triangulo: 
	addi $sp, $sp, -4
 	sw $ra, ($sp) 
 	jal triangulo
 	la $a0 area
	li $v0 4
	syscall
 	move $v0, $t2
	la $a0, ($t2)	
	li $v0, 1
	syscall
 	li $v0, 10 #encerra o programa
 	syscall
Calculo_retangulo:
	addi $sp, $sp, -4
	sw $ra, ($sp) 
 	jal retangulo
 	la $a0 area
	li $v0 4
	syscall
 	move $v0, $t2
	la $a0, ($t2)	
	li $v0, 1
	syscall
	li $v0, 10 #encerra o programa
	syscall
circunferencia:
	addi $sp, $sp, -4
	sw $ra, ($sp)
	la $a0 R
	li $v0 4
	syscall
	li $v0 5 #le r
	syscall
	move $t0 $v0
	mult $t0 $t0
	mflo $t0
	mult $t0 $s2
	mflo $t2
	lw $ra, ($sp)
        addi $sp, $sp, 4
        jr $ra
triangulo:
	addi $sp, $sp, -4
	sw $ra, ($sp)
	la $a0 A
	li $v0 4
	syscall
	li $v0 5 #le a
	syscall
	move $t0 $v0
	la $a0 B
	li $v0 4
	syscall
	li $v0 5 #le b
	syscall
	move $t1 $v0
	mult $t0 $t1
	mflo $t2
	div $t2 $s1
	mflo $t2
	lw $ra, ($sp)
        addi $sp, $sp, 4
        jr $ra
retangulo:
	addi $sp, $sp, -4
	sw $ra, ($sp)
	la $a0 A
	li $v0 4
	syscall
	li $v0 5 #le a
	syscall
	move $t0 $v0
	la $a0 B
	li $v0 4
	syscall
	li $v0 5 #le b
	syscall
	move $t1 $v0
	mult $t0 $t1
	mflo $t2
	lw $ra, ($sp)
        addi $sp, $sp, 4
        jr $ra
