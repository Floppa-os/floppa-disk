global print_string, hex_to_str
section .text

print_string:
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, rdi        ; строка в rdi
    mov rdx, rsi        ; длина в rdx
    syscall
    ret

hex_to_str:
    ; Конвертация числа в шестнадцатеричную строку
    ; Реализация опущена для краткости
    ret
