.8086
.model small
.stack 100h
.data
	hola db 255 dup('$')
	holx db 255 dup('$')
.code
	main proc
		mov ax, @data
		mov ds, ax
		
	carga:
	
		mov ah, 1			;servicio de lectura de caracter
		int 21h	
		cmp al, 0dh			;comparo con enter
		je finCarga			;para salir de la entrada
		mov hola[bx],al		;guardo el caracter leido en hola
		mov holx[bx],al		;guardo el caracter leido en holx
		cmp al,61h
		je cambiarLetra
		inc bx				;me adelanto 1 caracter en hola
		
	jmp carga
	
	cambiarLetra:
		mov holx[bx], 78h
		inc bx
		jmp carga
		
	finCarga:
		mov ah, 9h
		mov dx, offset hola
		int 21h
		
		mov ah, 2h
		mov dl, 0dh
		int 21h
		
		mov ah, 9h
		mov dx, offset holx
		int 21h
		
		
		mov ax, 4c00h
		int 21h
	main endp
	end main
