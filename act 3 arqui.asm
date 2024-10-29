.model small
.stack 100h
.data
    contador db 0           ; Variable para almacenar el contador
    msg db "El valor final es: $"

.code
main proc
    ; Inicializar el segmento de datos
    mov ax, @data
    mov ds, ax

    ; Mostrar el mensaje inicial
    mov ah, 09h            ; Función de DOS para mostrar cadena
    lea dx, msg            ; Cargar la dirección del mensaje
    int 21h                ; Llamar a DOS para mostrar el mensaje

    ; Bucle para contar de 1 a 15
    mov contador, 1        ; Inicializar contador a 1

count_loop:
    cmp contador, 16       ; Comparar contador con 16
    je end_loop            ; Si contador es igual a 16, salir del bucle
    inc contador           ; Incrementar el contador
    jmp count_loop         ; Volver al inicio del bucle

end_loop:
    dec contador           ; Reducir el contador en 1 para que sea 15

    ; Convertir el valor final a ASCII y mostrarlo
    mov al, contador       ; Cargar el valor final (15) en AL
    call print_value       ; Llamar a la rutina para mostrar el valor final

    ; Salir del programa
    mov ax, 4C00h          ; Función de DOS para salir
    int 21h                ; Interrupción para salir

main endp

; Rutina para convertir el valor final a ASCII y mostrarlo
print_value proc
    ; Manejar los números de dos dígitos (por si acaso)
    mov ah, 0              ; Limpiar AH para que solo se muestren los dígitos
    mov bx, 10             ; Divisor para convertir a decimal

    ; Para mostrar el número en formato ASCII
    xor dx, dx             ; Limpiar DX para la división
    div bx                 ; Dividir AL entre 10 (esto manejará 0-15)
    
    ; Mostrar decenas
    add dl, '0'            ; Convertir el dígito de las decenas a ASCII
    mov ah, 02h            ; Función para mostrar carácter
    int 21h                ; Mostrar carácter de decenas (si es necesario)

    ; Mostrar unidades
    mov al, ah             ; Recuperar el dígito de las unidades
    add al, '0'            ; Convertir el dígito a ASCII
    mov dl, al             ; Mover el valor convertido a DL
    mov ah, 02h            ; Función para mostrar carácter
    int 21h                ; Mostrar carácter de unidades

    ret
print_value endp
end main

