 ;*************************************************************************
 ; Your Name: Melody Scott
 ; Project Due Date: 9/2/2026
 ; Project Name: Hello NASM!
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description: basic hello world script that i got bored by so i decided i should make my OWN macro cuz this IDE doesnt accept macros
 ;*************************************************************************
;data section: contains initialized data, like variables and constants
section .data
msg db `Look ma, I'm in a 'macro'! Oh and uh "Hello NASM!" or something\n`
msgLen equ $ - msg
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
printHoldA: resb 32
printHoldB: resb 32
;text section: contains the code for the program
section .text
print: ; ecx = msg, edx = len, ebp = return label  |  Also, doesn't override eax or ebx
    mov [printHoldA], eax ; save the eax value
    mov [printHoldB], ebx ; save the ebx value
    mov eax, 4 ; syscall = sys_write
    mov ebx, 1 ; output = std_out
    int 0x80
    mov eax, [printHoldA] ; give eax back its old value
    mov ebx, [printHoldB] ; give ebx back its old value
    jmp ebp
global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    mov ecx, msg
    mov edx, msgLen
    mov ebp, ret1 ; says where to jump back
    jmp print ; call that 'macro'!
    ret1: ; the aforementioned place to jump back
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
