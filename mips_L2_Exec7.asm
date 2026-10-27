.data
    msg1: .asciiz "Digite um numero entre 100 e 999: "
    msg2: .asciiz "CENTENA = "
    msg3: .asciiz "\nDEZENA = "
    msg4: .asciiz "\nUNIDADE = "
    msg5: .asciiz "\nNumero invalido! Tente novamente.\n"

.text
.globl main
main:
ler:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    blt $t0, 100, invalido
    bgt $t0, 999, invalido
    j calcular

invalido:
    li $v0, 4
    la $a0, msg5
    syscall
    j ler

calcular:
    li $t1, 100
    div $t0, $t1
    mflo $t2
    mfhi $t3

    li $t1, 10
    div $t3, $t1
    mflo $t4
    mfhi $t5

    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 10
    syscall