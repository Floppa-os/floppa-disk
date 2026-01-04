global create_partition
section .text

create_partition:
    ; 1. Чтение MBR/GPT (первый сектор диска)
    mov rax, 0          ; sys_read
    mov rdi, [disk_fd]
    mov rsi, mbr_buffer
    mov rdx, 512
    syscall

    ; 2. Модификация таблицы разделов (пример для MBR)
    ; Смещение 0x1BE — первая запись раздела
    mov byte [mbr_buffer + 0x1BE], 0x80  ; активный раздел
    mov byte [mbr_buffer + 0x1BF], 0x0C  ; тип FAT32
    ; ... заполнение LBA, размера и т.д.

    ; 3. Запись изменённой MBR
    mov rax, 1          ; sys_write
    mov rdi, [disk_fd]
    mov rsi, mbr_buffer
    mov rdx, 512
    syscall
    ret

section .bss
mbr_buffer resb 512
