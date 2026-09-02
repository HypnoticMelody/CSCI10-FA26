 ;*************************************************************************
 ; Your Name: blahbladhlbaldhadlakjdskblskjd
 ; Project Due Date:  bahfhlfskk
 ; Project Name: gyauedasf
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description: BSD<MGFBASNBAS<MBM
 ;*************************************************************************
;data section: contains initialized data, like variables and constants
section .data
    star db `*`
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
    count resb 32
;text section: contains the code for the program
section .text
global main
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    cycle:
        inc dword [count]
        mov eax, 4
        mov ebx, 1
        mov ecx, star
        mov edx, 1
        int 0x80
        
        cmp dword [count], 5
        jge end
        
        jmp cycle
    end:
    
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)
