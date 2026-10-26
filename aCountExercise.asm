 ;*************************************************************************
 ; Your Name: 
 ; Project Due Date: 
 ; Project Name: 
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description:
 ;*************************************************************************
;data section: contains initialized data, like variables and constants
section .data
    str db `Gimme a word!\n`
    strLen equ $-str
    str2 db `A count: `
    str2Len equ $-str2
    str3 db `\n`
    str3Len equ 1
    
    bufferLen equ 100
    
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
    input resb 1
    
    buffer resb bufferLen
    
;text section: contains the code for the program
section .text
global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    mov eax, 4
    mov ebx, 1
    mov ecx, str
    mov edx, strLen
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, bufferLen
    int 0x80
    
    
    mov esi, buffer
    mov edi, buffer
    add esi, eax
    dec esi
    
    mov ecx, `0`
    loooop:
        cmp esi, edi
        jl neigh
        
        cmp byte [esi], `a`
        je yeigh
        cmp byte [esi], `A`
        je yeigh
        
        dec esi
        jmp loooop
        yeigh:
            dec esi
            inc ecx
            jmp loooop
    neigh:
    
    mov esi, buffer
    add esi, eax
    mov [esi], ecx
    
    mov eax, 4
    mov ebx, 1
    mov ecx, str2
    mov edx, str2Len
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, 1
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, str3
    mov edx, str3Len
    int 0x80
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
