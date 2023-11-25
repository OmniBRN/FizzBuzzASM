.data
    x: .space 4
    formatScanf: .asciz "%d"
    formatPrintf: .asciz "%d\n"
    zero: .long 0
    fizz: .asciz "fizz\n"
    buzz: .asciz "buzz\n"
    fizzbuzz: .asciz "fizzbuzz\n"

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
    cmp x, %ecx
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

    pushl %ecx 
    pushl %ecx
    push $formatPrintf
    call printf
    add $8, %esp
    popl %ecx

    incl %ecx
    jmp et_for

et_pFB:

    pushl %ecx
    push $fizzbuzz
    call printf
    add $4, %esp
    popl %ecx
    
    inc %ecx
    jmp et_for

et_pF:

    pushl %ecx
    push $fizz
    call printf
    add $4, %esp
    popl %ecx

    inc %ecx
    jmp et_for

et_pB:

    pushl %ecx
    push $buzz
    call printf
    add $4, %esp
    popl %ecx

    inc %ecx
    jmp et_for


et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80