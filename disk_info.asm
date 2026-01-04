; Получение информации о дисках через int 0x13 (BIOS) или sys_ioctl (Linux)
global get_disk_info
section .text

get_disk_info:
    ; Пример для Linux: вызов ioctl для /dev/sdX
    mov rax, 16          ; sys_ioctl
    mov rdi, [disk_fd]   ; файловый дескриптор диска
    mov rsi, 0x5305     ; команда BLKGETSIZE64
    mov rdx, disk_size  ; буфер для размера (в байтах)
    syscall
    ret

section .data
disk_size dq 0
disk_fd  dq 0
