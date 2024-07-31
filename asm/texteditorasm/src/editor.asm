section .data
    prompt db 'Simple Text Editor (type "exit" to quit):', 10, 0
    prompt_len equ $ - prompt
    filename db 'file.txt', 0
    buffer times 1024 db 0
    msg_file_saved db 'File saved successfully.', 10, 0
    msg_exit db 'Exiting editor...', 10, 0
    msg_error db 'Error occurred.', 10, 0

section .bss
    file_descriptor resd 1
    bytes_read resd 1  ; Переменная для хранения количества прочитанных байтов

section .text
    global _start

_start:
    ; Основной цикл
main_loop:
    ; Вывод приглашения
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Чтение команды пользователя
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, buffer
    mov edx, 1024       ; Максимальный размер буфера
    int 0x80
    mov [bytes_read], eax ; Сохраняем количество прочитанных байтов

    ; Удаление символа новой строки
    mov byte [buffer + eax - 1], 0

    ; Проверка на команду "exit"
    cmp eax, 4          ; длина "exit" = 4
    je exit_editor
    mov ecx, buffer
    mov edx, 4
    cmp dword [ecx], 'exit'
    je exit_editor

    ; Открытие файла для записи
    mov eax, 5          ; sys_open
    mov ebx, filename
    mov ecx, 2 | 64   ; O_RDWR | O_CREAT
    mov edx, 0644       ; rw-r--r--
    int 0x80
    cmp eax, 0
    jl open_error       ; Если eax < 0, произошла ошибка
    mov [file_descriptor], eax

    ; Запись в файл
    mov eax, 4          ; sys_write
    mov ebx, [file_descriptor]
    mov ecx, buffer
    mov edx, [bytes_read] ; Используем сохраненное количество прочитанных байтов
    int 0x80

    ; Закрытие файла
    mov eax, 6          ; sys_close
    mov ebx, [file_descriptor]
    int 0x80

    ; Вывод сообщения о сохранении
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_file_saved
    mov edx, 24
    int 0x80

    ; Возврат в основной цикл
    jmp main_loop

open_error:
    ; Вывод сообщения об ошибке
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_error
    mov edx, 17
    int 0x80
    jmp main_loop

exit_editor:
    ; Вывод сообщения об выходе
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_exit
    mov edx, 18
    int 0x80

    ; Завершение программы
    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80
