global _start   ; declares for linker

;
; variables
;
letter: db 'hello', 0xa ;string
len: equ $-letter
int: dw 20, 0 ; integer


_start:
  ;
  ; registers
  ;
  mov eax, 1
  mov ebx, 1
  mov ecx, 1
  mov edx, 1
  
  mul eax ; multipy
  div eax ; divide
  sub eax, 2
  add eax, 4

  ;
  ;   conditionals
  ;
  cmp eax, ebx
  and ecx, edx  ; and this too
  or ecx, ebx ; or this
  jne jumpy ; if true
  jmp jumly ; else

  int 0x80 ; interupt tells kernel to run on os

  ;
  ; print statement
  ;
  mov eax, 4 ; write mode
  mov ebx, 1 ; standard output
  mov ecx, letter ; moves letter into standard output
  mov edx, len ; length of the string
  
  int 0x80

  mov eax, 1 ; sets the register to exit

  int 0x80



;
; loops
;

;
; while loop
;
jumpy:  ;functions jumped to
  cmp eax, 1
  jle exit ; runs this function after while loop
  ;
  ; your code
  ;
  jmp jumpy ; recursion back to jumpy

;
; for loop
;
jumly:  ;functions jumped to
  mov eax, 0 ;set eax to 0
  cmp eax, 4 ; if eax = 4
  jle exit  ; run exit
  ;
  ; your code
  ;
  add eax, 1 ; add 1 to eax 
  jmp jumly


exit: 
  xor eax, eax  ; 
  mov eax, 1    ; exits script
  int 0x80      ;
