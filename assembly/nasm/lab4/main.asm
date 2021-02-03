section .text
    global _start
    global main
    global write_array
    global write_line
    
_start:
    call main    
main:
    mov rbx, arr_to_copy_in;0x40209A;0x4020A0;0x401140 ; Зміщення в DS, з якого починаємо запис масиву
    mov rcx, [variant] ; Записуємо номер варіанту в cx
    mov rax, arr_stack

    mov rcx, 16 ; 64 elems / 4 step
    call write_array

    xor rsi, rsi
    mov rcx, 16 ;64 / 4; Кількість слів (DW) в масиві
    b2:
        mov rax, [arr_stack + rsi];
        push rax
        add rsi, 8 ;because rax = 2*eax bit = 4 * ax bit
    loop b2


    mov rbp, rsp
    add rbp, 30h ;60h
    mov rcx, 3;[birhdays_len]
    xor rsi, rsi
    b3:
        mov rax, [birhdays + rsi]
        mov [rbp], rax
        add rsi, 8
        add rbp, 8
    loop b3

    ret
 
 
 
; Процедура, що додає рядок символів 01h під масивом в DS
; input
;     null
; output
;     null

write_line:
    push rcx
    push rax
    push rbx
    
    mov ecx,8 ; Кількість бай в рядку
    mov eax, 1 ; Записуємо в AX значення 01h
    write_line_loop:
        mov [ebx], ax ; Записуємо AX в DS:BX -----------
        add ebx, 2 ; Збільшуємо зміщення в DS на розмір слова
        loop write_line_loop
        
    pop rbx
    pop rax
    pop rcx
    ret
    
 ; Процедура, що копіює існуючий масив в сегменті DS
; input  
;     eax - address of array
;     ebx - зміщення в eds
;     ecx - Кількість слів у масиві
; output
write_array:
    ;mov ecx,64 ; Кількість слів у масиві
    xor rsi, rsi ; Очищення регістру si
    write_array_loop:
        add rax, rsi ; Адресу слова в ax
        mov [rbx], rax ; Записуємо AX в DS:BX ----------
        add rsi, 8 ;2 ; Збільшуємо зміщення в масиві на розмір слова
        add rbx, 8 ;2 ; Збільшуємо зміщення в DS на розмір слова
        loop write_array_loop
    ret    
    
section .data

arr_stack dw 07BA7h, 07D9Dh, 0299Bh, 0A157h, 0AA4Bh, 08CC9h, 0A49Dh, 00906h
          dw 07F8Ch, 0219Eh, 0B7B5h, 01068h, 02D53h, 0219Fh, 086D5h, 0D264h
          dw 0AB8Ah, 058B0h, 0BD72h, 072B8h, 03C77h, 0F6B3h, 0A0A3h, 0802Ah
          dw 048F3h, 08DBDh, 0C026h, 09C1Fh, 037EDh, 0B8A3h, 0C0BAh, 00D2Eh
          dw 08B0Bh, 0BD61h, 05032h, 0460Ah, 0ACB4h, 0B1DBh, 081F4h, 0C7CDh
          dw 0538Dh, 09557h, 09912h, 0717Ch, 09820h, 02448h, 09E87h, 0391Eh
          dw 0EAB1h, 0EEE7h, 00E7Eh, 0D3D6h, 09985h, 072EEh, 0C09Bh, 03D43h
          dw 080E3h, 0783Ch, 0D835h, 05434h, 07B25h, 078DEh, 039CFh, 01E1Dh
exCode db 0 
variant dw 1;6 ; кількість копіювань масиву
birhdays db ' -130502 240902 021101- ', 0 
birhdays_len dw  24

arr_to_copy_in dw 0, 0, 0, 0, 0, 0, 0, 0
                dw 0, 0, 0, 0, 0, 0, 0, 0
                dw 0, 0, 0, 0, 0, 0, 0, 0
                dw 0, 0, 0, 0, 0, 0, 0, 0
                dw 0, 0, 0, 0, 0, 0, 0, 0
                dw 0, 0, 0, 0, 0, 0, 0, 0
                dw 0, 0, 0, 0, 0, 0, 0, 0
                dw 0, 0, 0, 0, 0, 0, 0, 0
 
