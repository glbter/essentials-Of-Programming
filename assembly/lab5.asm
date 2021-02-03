TITLE LB5
;------------------------------------------------------------------------------
;ЛАБОРАТОРНА РОБОТА No5 УПРАВЛІННЯ ХОДОМ ВИКОНАННЯ ПРОГРАМИ НА АСЕМБЛЕРІ АРХІТЕКТУРІ ІА-32 (Х86) У REAL ADRESS MODE

;------------------------------------------------------------------------------
; Архітектура комп’ютера
; Завдання:              Дослідження роботи стеку МПС
; ВУЗ:                  КНУУ "КПІ"
; Факультет:    ФІОТ
; Курс:                2
; Група:       ІТ-91 
;------------------------------------------------------------------------------
				;I.ЗАГОЛОВОК ПРОГРАМИ
IDEAL ; Директива - тип Асемблера TASM
MODEL small ; Директива - тип моделі пам'яті
STACK 512 ; Директива - розмір стеку в байтах
DATASEG 
;згенерований масив випадкових чисел
array2Db db 0Eh, 0Fh, 0Bh, 0Ch, 0Bh, 0Eh, 0Ah, 0Ah, 0Ah, 0Ch, 0Ah, 0Eh, 0Ch, 0Ah, 0Dh, 0Eh
          db 0Fh, 0Dh, 0Fh, 0Ch, 0Ch, 0Ah, 0Eh, 0Dh, 0Fh, 0Bh, 0Bh, 0Eh, 0Fh, 0Ah, 0Eh, 0Ch
          db 0Bh, 0Eh, 0Ch, 0Dh, 0Fh, 0Eh, 0Ah, 0Dh, 0Fh, 0Dh, 0Bh, 0Dh, 0Eh, 0Eh, 0Fh, 0Ah
          db 0Ch, 0Bh, 0Dh, 0Dh, 0Dh, 0Eh, 0Dh, 0Ah, 0Ch, 0Ch, 0Eh, 0Ah, 0Ah, 0Ah, 0Ah, 0Ah
          db 0Ah, 0Dh, 0Eh, 0Eh, 0Bh, 0Ah, 0Bh, 0Eh, 0Ah, 0Ah, 0Ch, 0Fh, 0Eh, 0Bh, 0Eh, 0Ah
          db 0Dh, 0Ah, 0Eh, 0Ah, 0Ch, 0Bh, 0Ch, 0Fh, 0Ch, 0Ch, 0Dh, 0Ch, 0Dh, 0Ch, 0Eh, 0Bh
          db 0Fh, 0Eh, 0Fh, 0Ch, 0Bh, 0Bh, 0Fh, 0Bh, 0Bh, 0Ch, 0Ah, 0Bh, 0Bh, 0Ch, 0Ah, 0Eh
          db 0Dh, 0Bh, 0Bh, 0Ah, 0Ah, 0Ch, 0Ch, 0Bh, 0Ah, 0Eh, 0Ch, 0Bh, 0Dh, 0Eh, 0Eh, 0Ah
          db 0Ch, 0Dh, 0Dh, 0Eh, 0Bh, 0Ah, 0Bh, 0Fh, 0Fh, 0Dh, 0Ch, 0Dh, 0Dh, 0Bh, 0Dh, 0Fh
          db 0Fh, 0Bh, 0Bh, 0Fh, 0Dh, 0Fh, 0Bh, 0Dh, 0Fh, 0Dh, 0Dh, 0Fh, 0Bh, 0Fh, 0Fh, 0Eh
          db 0Bh, 0Eh, 0Eh, 0Dh, 0Eh, 0Bh, 0Fh, 0Bh, 0Fh, 0Ah, 0Fh, 0Ah, 0Bh, 0Eh, 0Ah, 0Fh
          db 0Bh, 0Ah, 0Ch, 0Ah, 0Eh, 0Ch, 0Bh, 0Bh, 0Eh, 0Ch, 0Fh, 0Fh, 0Ah, 0Eh, 0Eh, 0Dh
          db 0Ch, 0Bh, 0Fh, 0Dh, 0Dh, 0Ah, 0Ch, 0Dh, 0Bh, 0Ch, 0Bh, 0Dh, 0Bh, 0Fh, 0Fh, 0Fh
          db 0Ch, 0Ch, 0Fh, 0Ch, 0Ah, 0Ch, 0Ch, 0Ah, 0Ch, 0Bh, 0Ah, 0Fh, 0Ch, 0Fh, 0Ah, 0Dh
          db 0Ah, 0Eh, 0Fh, 0Fh, 0Bh, 0Ch, 0Fh, 0Eh, 0Ah, 0Eh, 0Ch, 0Fh, 0Bh, 0Ah, 0Eh, 0Bh
          db 0Ah, 0Eh, 0Ch, 0Fh, 0Eh, 0Eh, 0Ch, 0Ch, 0Eh, 0Ah, 0Ah, 0Bh, 0Dh, 0Dh, 0Dh, 0Bh

birthdays db 0, 5, 1, 3, 2, 0, 0, 2 
          db 1, 6, 0, 6, 2, 0, 0, 1 
          db 2, 5, 1, 1, 2, 0, 0, 1 
		  db 0, 5, 1, 3, 2, 0, 0, 2 
          db 1, 6, 0, 6, 2, 0, 0, 1 
          db 2, 5, 1, 1, 2, 0, 0, 1
          db 0, 5, 1, 3, 2, 0, 0, 2 
          db 1, 6, 0, 6, 2, 0, 0, 1 

exCode db 0 

color db 6h ; Колір

birthdays_len = $ - birthdays
CODESEG
Start:
mov ax, @data ; ax <- @data
mov ds, ax ; ds <- ax
mov es, ax ; es <- ax
mov si, offset array2Db ; Записуємо в SI зміщення  array2Db
mov bx, 10h ; розмір масиву
mov dx,1340 ; Початок виводу прямокутника
call write_array ; Виводимо початковий масив
mov ah, 08h
int 21h
mov cx, 8 ; Записуємо кількість рядків масиву з датами
xor si, si ; Обнулюємо SI
xor ax, ax ; Обнулюємо AX
mov di, 102 ; Визначаємо координати верхнього лівого кута (i,j) для запису у великій масив. 
			; Враховуючи, що ми 6 варіант, то (6,6) відповідає 16*6+6 = 102
w1:
push cx ; Записуємо в стек CX
mov cx, 8 ; Записуємо кількість ствопців масиву з датами
w2:
mov al, [birthdays + si] ; Записуємо в AL елемент з масиву з датами
mov [array2Db + di], al ; Записуємо у великій масив елемент з масиву з датами
inc di ; DI++
inc si ; SI++
loop w2
add di, 8h ; Переходимо на наступний рядок
pop cx
loop w1
mov si, offset array2Db ; Записуємо в SI зміщення  array2Db
mov bx,10h ; розмір масиву
mov dx, 1340 ; Початок виводу прямокутника
call write_array ; Виводимо початковий масив із датами в середині
mov ah, 08h
int 21h

mov bx,0100h ; Розмір почткового масиву
call selection_sort ; Викликаємо метод сортування


mov si, offset array2Db ; Записуємо в SI зміщення  array2Db
mov bx, 10h ; розмір масиву
mov dx,1340 ; Початок виводу прямокутника
call write_array ; Виводимо  посортований початковий масив із датами в середині
mov ah, 08h
int 21h

;вихід із програми
mov ah, 049h
int 21h
Exit:
mov ah, 04Ch ; 4ch - функція виходу з програми для переривання 21h
mov al, [exCode] ; Вхідний параметр для функції 4ch - вихідний статус програми int 21h
int 21h


; Процедура, що друкує  масив в відеопам'ять
PROC write_array
; Параметри 
; зміщення  на екрані - DX
; кількість рядків масиву - BX
; початкове зміщення - SI
mov ax, 0B800h; Сегментна адреса відеопам'яті
mov di, dx; Записуємо зміщення на екрані з регістру dx
mov es, ax 
mov cx, bx ; Кількість ітерацій у зовнішньому циклі
l1:
push cx ; Записуємо у стек значення регістру cx
mov cx, bx ; Кількість ітерацій у внутрішньому циклі
l2:
	movsb ; ES:DI <- DS:SI DI++ та SI++
	push si ; Записуємо в стек значення SI
	mov si, offset color ; Записуємо байт кольору в SI
	movsb ; Записуємо колір
	pop si
	loop l2
add di, 128 ; 160 - 32 = 128
pop cx
loop l1
ret
ENDP

; Процедура, що сортує масив за допомогою алгоритму сортування selection sort
PROC selection_sort
; Параметри
; розмір масиву - BX
mov cx, bx ; Записуємо розмір масиву з BX в CX
for1:
push cx ; Заносимо значення CX в стек
mov di,bx ; Записуємо розмір масиву з BX в DI
sub di, cx ; Вираховуємо скільки елементів залишилося посортувати
push di ; Заносимо значення DI в стек
mov si, di ; Записуємо значення DI в SI
inc si ; Визначаємо перший елемент який будем порівнювати з нашим мінімум
for2:
	mov ah, [array2Db + si] ; Елемент який може бути мінімумом
	mov al, [array2Db + di] ; Елемент який зараз є мінімумом
	cmp ah, al ; Порвнюємо їх
		JL less  ; Ми знайшли новий мінімум і потрібно змінити значення DI
		JMP continue ; Мінімум не змінюється
	less:
	mov di, si ; Змінюємо номер мінімумуму
	continue:
	inc si ; Переходимо до наступного елементу
	loop for2
mov si, di ; Зберігаємо в SI номер мінімума
pop di ; Дістаємо номер елементу який з самого початку вважався мінімумом
mov al, [array2Db + si] ; Записуємо мінімум в AL
mov ah, [array2Db + di] ; Записуємо елемент з яким потрібно поміняти мінімум
mov [array2Db + si], ah ; Робимо swap
mov [array2Db + di], al ; 
pop cx ; Дістаємо із стеку CX
loop for1
ret 
ENDP


END Start
