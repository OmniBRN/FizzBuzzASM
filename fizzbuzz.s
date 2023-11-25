.data
    x: .space 4
    formatScanf: .asciz "%d"
    zero: .long 0
    fizz: .asciz "%d:fizz\n"
    buzz: .asciz "%d:buzz\n"
    fizzbuzz: .asciz "%d:fizzbuzz\n"

.text
.global main
main:
    pushl $x
    push $formatScanf
    call scanf
    add $8, %esp
    add $1, x
    xor %eax, %eax
    mov $1, %ecx
    xor %edx, %edx
    
et_for:

    // conditia de final
    movl x, %ebx
    cmp %ebx, %ecx
    je et_exit

    // if i%15 == 0
    xor %edx, %edx
    mov %ecx, %eax
    mov $15, %ebx
    div %ebx
    cmp %edx, zero
    je et_pFB

    // if i%3 == 0
    xor %edx, %edx
    mov %ecx, %eax
    mov $3, %ebx
    div %ebx
    cmp %edx, zero
    je et_pF

    // if i%5 == 0
    xor %edx, %edx
    mov %ecx, %eax
    mov $5, %ebx
    div %ebx
    cmp %edx, zero
    je et_pB

    inc %ecx
    jmp et_for

et_pFB:

    push %ecx
    push x
    mov %ecx, x
    push x
    push $fizzbuzz
    call printf
    add $8, %esp
    pop x
    pop %ecx
    inc %ecx
    jmp et_for

et_pF:

    push %ecx
    push x
    mov %ecx, x
    push x
    push $fizz
    call printf
    add $8, %esp
    pop x
    pop %ecx
    inc %ecx
    jmp et_for

et_pB:
    push %ecx
    push x
    mov %ecx, x
    push x
    push $buzz
    call printf
    add $8, %esp
    pop x
    pop %ecx
    inc %ecx
    jmp et_for
    
et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80