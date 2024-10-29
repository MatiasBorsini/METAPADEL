.model small
.stack 100h
.data
    num1 db 3           ; Primer número
    num2 db 3           ; Segundo número
    result dw ?         ; Aquí guardaremos el resultado
    msg db "El resultado es: $"
    newline db 13, 10, '$'  ; Salto de línea (CR + LF)

.code
main proc
    ; Inicialización de segmento de datos
    mov ax, @data       ; Cargar el segmento de datos
    mov ds, ax          ; Inicializar DS con el segmento de datos

    ; Multiplicar los números
    mov al, num1        ; Cargar el primer número en AL
    mov bl, num2        ; Cargar el segundo número en BL
    mul bl              ; Multiplicar AL por BL (resultado en AX)
    mov result, ax      ; Almacenar el resultado en 'result' (AX)

    ; Mostrar el mensaje "El resultado es: "
    mov ah, 09h         ; Función de DOS para mostrar cadena
    lea dx, msg         ; Cargar la dirección del mensaje
    int 21h             ; Llamar a DOS para mostrar el mensaje

    ; Convertir el resultado a ASCII y mostrarlo
    mov ax, result      ; Cargar el resultado en AX
    add ax, 30h         ; Convertir el valor numérico a carácter ASCII (0-9)
    mov dl, al          ; Mover el carácter a DL para mostrarlo
    mov ah, 02h         ; Función de DOS para mostrar carácter
    int 21h             ; Mostrar el carácter (resultado)

    ; Salto de línea
    mov ah, 09h         ; Función de DOS para mostrar cadena
    lea dx, newline     ; Cargar la dirección del salto de línea
    int 21h             ; Mostrar el salto de línea

    ; Salir del programa
    mov ax, 4C00h       ; Función de DOS para salir
    int 21h             ; Llamar a DOS para salir
main endp
end main
