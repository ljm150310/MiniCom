.syntax unified
.cpu cortex-m3 
.thumb

.equ SRAM_ORIGIN,  0x20000000
.equ SRAM_SIZE,    0x00005000
.equ _estack,      SRAM_ORIGIN + SRAM_SIZE

.section .vectors
.align 2
_vector_table:
    .word _estack
    .word Reset_Handler
    .word Default_Handler
    .word Default_Handler
    .word Default_Handler
    .word Default_Handler
    .word Default_Handler
    .word 0
    .word 0
    .word 0
    .word 0
    .word Default_Handler
    .word 0
    .word 0
    .word Default_Handler
    .word Default_Handler

.section .text
.align 2
.global Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
    ldr sp, =_estack
    bl main
    b .

.type Default_Handler, %function
Default_Handler:
    b .
