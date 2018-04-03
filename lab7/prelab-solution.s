

clr $0
clr $1
addi $0, $0, 0xFE
addi $1, $1, 0x11

sw $0, 9($2)
sw $1, 0x10($2)

andi $2, $0, 0x80
andi $3, $1, 0x80

sw $2, 0($1)
sw $3, 1($1)

inv $1, $2
and $0, $1, $3

inv $1, $3
and $1, $1, $2

or $2, $0, $1a

clr $0
sw $2, 0x13($0)
lw $1, 9($0)

inv $2, $1
addi $3, $2, 1
sw $3, 0x14($0)



