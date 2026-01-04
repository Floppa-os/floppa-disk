global _start
extern get_disk_info, create_partition, print_string

section .text
_start:
    ; Инициализация: открытие диска
    mov rax, 2          ; sys_open
    mov rdi, disk_path
    mov rsi, 2          ; O_RDWR
    syscall
    mov [disk_fd], rax

    ; Получение информации о диске
    call get_disk_info

    ; Создание раздела
    call create_partition

    ; Вывод результата
    mov rdi, success_msg
    mov rdx, success_len
    call print_string

    ; Выход
    mov rax, 60         ; sys_exit
    mov rdi, 0
    syscall

section .data
disk_path  db '/dev/sdb', 0
success_msg db 'Partition created!', 0xA, 0
success_len equ $ - success_msg

section .bss
disk_fd resq 1
