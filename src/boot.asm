org 0x7c00
mov si, 0

printintro:
    mov ah, 0x0e
    mov al, [intro_loading + si]
    int 0x10
    add si, 1
    cmp byte [intro_loading + si], 0
    jne printintro
    je input

input:
    mov ah, 0
    int 0x16
    mov ah, 0x0e
    int 0x10
    jmp input

intro_loading:
    db "---- Ki-OS v.0.0.1b ----", 10, 13, 0

jmp $

times 510-($-$$) db 0
dw 0xAA55
