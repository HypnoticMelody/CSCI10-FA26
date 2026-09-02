 ;*************************************************************************
 ; Your Name: Melody Scott
 ; Project Due Date: 9/9/2026
 ; Project Name: Adder
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description: Takes in numbers and adds them, exiting when given a zero or if it overflows
 ;*************************************************************************
;data section: contains initialized data, like variables and constants
section .data
    prompt db `Typa da numbera! 1 through 9 please. Or press 0 to exit.\n`
    pLen equ $ - prompt ; heh. p len. heh.        ...sorry
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
    input resb 1
    total resb 32
    
    macroHoldA: resb 32
    macroHoldB: resb 32
    macroRet: resb 32
;text section: contains the code for the program
section .text
print: ; ecx = msg, edx = len, macroRet = where to return to |  Doesn't override eax or ebx
    mov [macroHoldA], eax ; save the eax value
    mov [macroHoldB], ebx ; save the ebx value
    mov eax, 4 ; syscall = sys_write
    mov ebx, 1 ; output = std_out
    int 0x80
    mov eax, [macroHoldA] ; give eax back its old value
    mov ebx, [macroHoldB] ; give ebx back its old value
    jmp [macroRet]
read: ; ecx = place to put result in, edx = len, macroRet = where to return to | Doesn't override eax or ebx
    mov [macroHoldA], eax ; save the eax value
    mov [macroHoldB], ebx ; save the ebx value
    mov eax, 3 ; syscall = sys_read
    mov ebx, 0 ; output = std_in
    int 0x80
    mov eax, [macroHoldA] ; give eax back its old value
    mov ebx, [macroHoldB] ; give ebx back its old value
    jmp [macroRet]
global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    mov ecx, prompt
    mov edx, pLen
    mov dword [macroRet], ret1
    jmp print
    ret1:
    
    mov eax, 0
    
    cycle:
        mov ecx, input
        mov edx, 1
        mov dword [macroRet], ret2
        jmp read
        ret2:
        
        sub byte [input], 48
        
        mov ecx, input
        mov edx, 1
        mov dword [macroRet], ret3
        jmp print
        ret3:
        
        cmp byte [input], 0
        je end
        
        mov ebx, eax
        add eax, [input]
        cmp eax, 9
        jg overshot
        
    jmp cycle
    
    overshot:
        mov eax, ebx
    end:
        add eax, 48
        mov ecx, eax
        mov edx, 1
        mov dword [macroRet], ret4
        jmp print
        ret4:
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
