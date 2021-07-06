.data
a: .word 3
y: .space 4
.text
lui $t1, 0x1001 #15 + a ( 7 + a ( -5 + a (9)))
lw $t2, 0x0($t1)
addi $t3, $zero,15
addi $t4, $zero, 7
addi $t5, $zero,-5
addi $t6, $zero, 9
mult $t2, $t6
mflo $t7
add $t7, $t5, $t7
mult $t7, $t2
mflo $t7
add $t7, $t4, $t7
mult $t7, $t2
mflo $t7
add $t7, $t7, $t3
sw $t7, 0x4($t1)