.model small
.stack 100h
.data
num1 db 5 ; Primer número
num2 db 3 ; Segundo número
result db ? ; Aquí guardaremos el resultado
msg db "El resultado es: $";

.code
main proc
mov ax, @data ; Cargar el segmento de datos
mov ds, ax ; Inicializar DS

; Sumar los números
mov al, num1 ; Cargar el primer número en AL
sub al, num2 ; Sumar el segundo número a AL
mov result, al ; Almacenar el resultado

; Convertir el resultado a ASCII y mostrarlo
add result, 30h ; Convertir el número a carácter ASCII (5 -&gt; &#39;5&#39;)
mov ah, 09h ; Función de DOS para mostrar cadena
lea dx, msg ; Cargar la dirección del mensaje
int 21h ; Llamar a DOS para mostrar el mensaje

mov dl, result ; Cargar el resultado en DL
mov ah, 02h ; Función de DOS para mostrar carácter
int 21h ; Mostrar el carácter

; Salir del programa
mov ax, 4C00h ; Función de DOS para salir
int 21h ; Llamar a DOS para salir
main endp
end main