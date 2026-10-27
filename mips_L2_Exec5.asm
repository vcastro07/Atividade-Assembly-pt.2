.data
    msg1: .asciiz "Digite o valor de A: "
    msg2: .asciiz "Digite o valor de B: "
    msg3: .asciiz "Digite o valor de C: "
    msg4: .asciiz "DUAS RAIZES REAIS"
    msg5: .asciiz "UMA RAIZ REAL"
    msg6: .asciiz "NAO EXISTEM RAIZES REAIS"

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    mul $t3, $t1, $t1
    mul $t4, $t0, $t2
    mul $t4, $t4, 4
    sub $t5, $t3, $t4

    bgt $t5, $zero, duas
    beq $t5, $zero, uma
    j nenhuma

duas:
    li $v0, 4
    la $a0, msg4
    syscall
    j fim

uma:
    li $v0, 4
    la $a0, msg5
    syscall
    j fim

nenhuma:
    li $v0, 4
    la $a0, msg6
    syscall

fim:
    li $v0, 10
    syscall