ori $t0, $zero, 50 #coloca um valor em t0

slti $t1,$t0, 41 #verifica se t0 é menor que 41
beq $t1, $zero, fora1 #pula para fora 1
slti $t1,$t0, 21 #verifica se é menor que 20
beq $t1, $zero, dentro#dentro
j fora2
fora1: slti $t1,$t0, 81 #verifica se esta no outro intervalo, da mesma forma que anteriormente
beq $t1, $zero, fora2
slti $t1,$t0, 61
beq $t1, $zero, dentro
j fora2

fora2: ori $t1, $zero, 0 #coloca 0 se for fora dos intervalos
j exit
dentro: ori $t1, $zero, 1 #se tiver dentro coloca o flag em 1
exit: sll $0, $0, 0 #para acabar o codigo