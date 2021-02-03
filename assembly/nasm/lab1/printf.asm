; Вхід: SI (зміщення, по якому знаходиться початок рядка для друку)
; Вихід: -
printf:  
       pusha  

; 	Записуємо в AL поточний символ по зміщенню SI
       print_loop:
               mov al, [si]
               cmp al, 0
               jne print_char ; Якщо це ще не кінець рядка
               popa
               ret

       print_char:
               mov ah, 0x0e
               int 0x10 ; Друкуємо символ, що знаходиться в AL
               add si, 1 ; Переходимо до наступного символа в рядку
               jmp print_loop
