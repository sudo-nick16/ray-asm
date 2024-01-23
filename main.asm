section .data
msg db "hello world", 0xa
len equ $- msg
title db "deez asm", 0xa

extern InitWindow
extern WindowShouldClose
extern BeginDrawing
extern DrawRectangle
extern EndDrawing
extern CloseWindow
extern ClearBackground

section .text
global _start
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, len
	syscall

	mov rdi, 400
	mov rsi, 400
	mov rdx, title
	call InitWindow

L:
	call WindowShouldClose
	cmp rax, 0
	jne exit

	call BeginDrawing

	mov rdi, 0x00000000
	call ClearBackground

	mov rdi, 0
	mov rsi, 0
	mov rdx, 100
	mov rcx, 100
	mov r8, 0xFF0000FF

	call DrawRectangle

	call EndDrawing

	jmp L

exit:
	call CloseWindow
	mov rax, 60
	mov rdi, 0
	syscall
