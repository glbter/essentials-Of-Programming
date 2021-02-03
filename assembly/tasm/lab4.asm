TITLE LB4
;------------------------------------------------------------------------------
;ЛЕКЦИЯ  №4
;------------------------------------------------------------------------------
; Програмування 3. Архітектура комп’ютера
; Завдання:              Основи адресації операндів 
; ВУЗ:                  КНУУ "КПІ"
; Факультет:    ФІОТ
; Курс:                2
; Група:       ІТ-91 
;------------------------------------------------------------------------------
; Автор:        __ __ __
; Дата:         __/__/__
;---------------------------------
				;I.ЗАГОЛОВОК ПРОГРАМИ
IDEAL ; Директива - тип Асемблера TASM
MODEL small ; Директива - тип моделі пам'яті
STACK 512 ; Директива - розмір стеку в байтах
DATASEG 
arr_stack dw 07BA7h, 07D9Dh, 0299Bh, 0A157h, 0AA4Bh, 08CC9h, 0A49Dh, 00906h
          dw 07F8Ch, 0219Eh, 0B7B5h, 01068h, 02D53h, 0219Fh, 086D5h, 0D264h
          dw 0AB8Ah, 058B0h, 0BD72h, 072B8h, 03C77h, 0F6B3h, 0A0A3h, 0802Ah
          dw 048F3h, 08DBDh, 0C026h, 09C1Fh, 037EDh, 0B8A3h, 0C0BAh, 00D2Eh
          dw 08B0Bh, 0BD61h, 05032h, 0460Ah, 0ACB4h, 0B1DBh, 081F4h, 0C7CDh
          dw 0538Dh, 09557h, 09912h, 0717Ch, 09820h, 02448h, 09E87h, 0391Eh
          dw 0EAB1h, 0EEE7h, 00E7Eh, 0D3D6h, 09985h, 072EEh, 0C09Bh, 03D43h
          dw 080E3h, 0783Ch, 0D835h, 05434h, 07B25h, 078DEh, 039CFh, 01E1Dh
exCode db 0 
variant dw 6 ; кількість копіювань масиву
birhdays db '130502 240902 021101' 
birhdays_len dw  20
CODESEG
Start:
mov ax, @data ; ax &lt;- @data
mov ds, ax ; ds &lt;- ax
mov es, ax ; es &lt;- ax
mov bx, 480h ; Зміщення в DS, з якого починаємо запис масиву
mov cx, [variant] ; Записуємо номер варіанту в cx
; Цикл, який записує масив у DS необхідну к-сть разів
b1:
push cx
call write_array
call write_line
pop cx
loop b1

xor si,si
mov cx, 64 ; Кількість слів (DW) в масиві
b2:
mov ax, [arr_stack + si];
push ax
add si, 2
loop b2


mov bp, sp
add bp, 60h;
mov cx, [birhdays_len]
xor si,si
b3:
mov al, [birhdays + si]
mov [bp], al
add si, 1
add bp, 1
loop b3
; Виділення нової ділянки пам’яті
mov ah, 048h ; Ознака переривання
mov bx, 02h ; Розмір нової ділянки у параграфах
int 21h
mov es, ax ; Ініціалізація сегментного регістру новою адресою
mov di, 0 ;
mov cx, 64
l4:
pop dx ; Дістаємо зі стеку останні два байти масиву, кладемо в DX
mov [word es:di], dx ; Записуємо їх у додатково виділену пам’ять зі зміщенням DI
add di, 2 ; Рухаємося в ES вперед на слово
loop l4
mov ah, 049h
int 21h
Exit:
mov ah, 04Ch ; 4ch - функція виходу з програми для переривання 21h
mov al, [exCode] ; Вхідний параметр для функції 4ch - вихідний статус програми int 21h
int 21h
; Процедура, що копіює існуючий масив в сегменті DS
PROC write_array
mov cx,64 ; Кількість слів у масиві
xor si,si ; Очищення регістру si
f1:
mov ax, [arr_stack + si] ; Записуємо адресу слова в ax
mov [word bx], ax ; Записуємо AX в DS:BX
add si,2 ; Збільшуємо зміщення в масиві на розмір слова
add bx,2 ; Збільшуємо зміщення в DS на розмір слова
loop f1 
ret
ENDP
; Процедура, що додає рядок символів 01h під масивом в DS
PROC write_line
mov cx,8 ; Кількість бай в рядку
mov ax, 01h ; Записуємо в AX значення 01h
f2:
mov [bx], ax ; Записуємо AX в DS:BX
add bx,2 ; Збільшуємо зміщення в DS на розмір слова
loop f2
ret
ENDP
END Start







