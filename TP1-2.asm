.data
str1:   .asciiz "Entrez x  : "
str2:   .asciiz "Entrez n : "
str3:   .asciiz "x^n = "
.text
main:   ori $v0, $zero, 4         # v0 <- 4
la $a0, str1              # a0 <- str1
syscall                   #  "Entrez x  : "
ori $v0, $zero, 5         # v0 <- 5
syscall                   # lecture
or $t0, $zero, $v0        # t0 <- v0 : sauvegarde de x
ori $v0, $zero, 4         # v0 <- 4
la $a0, str2              # a0 <- str1
syscall                   #  "Entrez n  : "
ori $v0, $zero, 5         # v0 <- 5
syscall                   # lecture
or $a0, $zero, $v0        # a0 <- n
or $a1, $zero, $t0        # a1 <- x
jal power                 # ra <- PC+4; goto power
or $t0, $zero, $v0        # to <- v0 : sauvegarde de x^n
ori $v0, $zero, 4         # v0 <- 4
la $a0, str3              # a0 <- str2
syscall                   # "x^n = "
or $a0, $zero, $t0        # a0 <- t0
ori $v0, $zero, 1         # v0 <- 1
syscall                   # affichage de x^n
ori $v0, $zero, 10        # v0 <- 10
syscall                   # return 0
power:  addi $sp, $sp, -8         # alloue lespace dans la pile
sw $ra, 4($sp)            # empile ladresse de retour
sw $a0, 0($sp)            # empile largument n
slti $t0, $a0, 1          # test pour n < 1
beq $t0, $zero, recurs    # if (n>=1) goto recurs;
add $v0, $zero, 1         # return x; avec x^0 = 1
addi $sp, $sp, 8          # pop des deux valeurs sauves
jr $ra                    # retour  lappelant
recurs: addi $a0, $a0, -1         # n>=1: largument reoit n-1
jal power                 # appel rcursif
lw $a0, 0($sp)            # dpile largument n
lw $ra, 4($sp)            # dpile ladresse de retour
addi $sp, $sp, 8          # rend lespace dans la pile
mul $v0, $v0, $a1         # return x*power(x, n-1)
jr $ra                    # retour  la fonction appelante
