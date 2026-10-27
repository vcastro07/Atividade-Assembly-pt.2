.data
    msg1: .asciiz "Digite o valor da compra em centavos: "
    msg2: .asciiz "Digite o valor da parcela em centavos: "
    msg3: .asciiz "Valor invalido! Tente novamente.\n"
    msg4: .asciiz "Quantidade de parcelas: "

.text
.globl main
main:
compra:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 100000
    blt $t0, $t1, erro_compra

    li $t1, 999999
    bgt $t0, $t1, erro_compra
    j parcela

erro_compra:
    li $v0, 4
    la $a0, msg3
    syscall
    j compra

parcela:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    li $t1, 10000
    blt $t2, $t1, erro_parcela

    li $t1, 50000
    bgt $t2, $t1, erro_parcela
    j calcular

erro_parcela:
    li $v0, 4
    la $a0, msg3
    syscall
    j parcela

calcular:
    div $t0, $t2
    mflo $t3
    mfhi $t4

    beq $t4, $zero, mostrar
    addi $t3, $t3, 1

mostrar:
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall