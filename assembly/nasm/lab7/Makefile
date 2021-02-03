# <файл> : <залежності>. Цей фрагмент викликається при команді make

main.bin: main.asm printf.asm  
# Компіляція в бінарний файл
	nasm -fbin main.asm -o main.bin       
# Дозаповнення бінарного файлу нулями, щоб його розмір був достатнім, щоб створити ISO файл 
	truncate main.bin -s 1200k 
# Створюємо ISO файл з бінарного файлу
	mkisofs -o interface.iso -b main.bin ./ 
# Очищення поточної директорії. Цей фрагмент викликається по команді make clean
clean: 
	rm main.bin
	rm interface.iso

# Запуск QEMU. Цей фрагмент викликається по команді make run

run: 
	qemu-system-x86_64 main.bin
