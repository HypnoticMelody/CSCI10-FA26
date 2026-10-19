;*************************************************************************
 ; Your Name: Melody Scott
 ; Project Due Date: 10/21/2026
 ; Project Name: Color Stacker
 ; CSCI-10 M2465: Computer Architecture and Organization
 ; Fall 2026
 ; Project Description: Takes in an instruction and does stuff to like, print out a buncha stuff according to what stuff you gave it and stuff
 ;*************************************************************************
;data section: contains initialized data, like variables and constants
section .data
start db `Enter color stack!\n`
startLen equ $ - start
end db `Done\n`
endLen equ $ - end
dummy db `Use stuff from [r,b,g,p,q], silly!\n`
dummyLen equ $ - dummy

r db `RED`
rLen equ $ - r
b db `BLUE`
bLen equ $ - b
g db `GREEN`
gLen equ $ - g
p db `PURPLE`
pLen equ $ - p
l db ` light!\n`
lLen equ $ - l
;bss section: contains uninitialized data, declared but not assigned data yet (stands for Block Starting Symbol)
section .bss
input resb 1
;text section: contains the code for the program
section .text
global main
red:
    mov eax, 4
    mov ebx, 1
    mov ecx, r
    mov edx, rLen
    int 0x80
    jmp light
blue:
    mov eax, 4
    mov ebx, 1
    mov ecx, b
    mov edx, bLen
    int 0x80
    jmp light
green:
    mov eax, 4
    mov ebx, 1
    mov ecx, g
    mov edx, gLen
    int 0x80
    jmp light
purple:
    mov eax, 4
    mov ebx, 1
    mov ecx, p
    mov edx, pLen
    int 0x80
light:
    mov eax, 4
    mov ebx, 1
    mov ecx, l
    mov edx, lLen
    int 0x80
    jmp ejectStack
main:
    mov ebp, esp; for correct debugging 
    ;WRITE YOUR CODE UNDER THIS LINE***********************************
    ;Red ('r'), Blue ('b'), Green ('g'), Purple ('p'). You should also have an option for Quit ('q')
    ;rbygscq, rseq, qrsxyzq, lightq
    makeStack:
        mov eax, 3
        mov ebx, 0
        mov ecx, input
        mov edx, 1
        int 0x80
        
        cmp byte [input], "r"
        jz goodToGo
        cmp byte [input], "b"
        jz goodToGo
        cmp byte [input], "g"
        jz goodToGo
        cmp byte [input], "p"
        jz goodToGo
        cmp byte [input], "q"
        jz ejectStack
        
        jmp wrongSymbol
        
        goodToGo:
        push byte [input]
        jmp makeStack
    
    ejectStack:
        cmp esp, 0xbfffeffc
        jz endEject
        pop ecx
        
        cmp ecx, "r"
        jz red
        cmp ecx, "b"
        jz blue
        cmp ecx, "g"
        jz green
        cmp ecx, "p"
        jz purple
    wrongSymbol: ; used something other than r,b,g,p,q
        mov eax, 4
        mov ebx, 1
        mov ecx, dummy
        mov edx, dummyLen
        int 0x80
    endEject:
        mov eax, 4
        mov ebx, 1
        mov ecx, end
        mov edx, endLen
        int 0x80
    
    ;Exit the program
    ;Your program will stop running after this executes!
    mov eax, 1 ;sys_exit system call number
    mov ebx, 0 ;sys_exit, return 0 status on exit - 'No Errors'
    int 80h ;interrupt to invoke a system call (and exit the program)

