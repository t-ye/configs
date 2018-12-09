/*
 * Filename: FILENAME.s
 * Author: Thurman Ye
 * Userid: cs30xqy
 * Description: Contains the implementation for FILENAME.
 * Date: DATE
 * Sources of Help: N/A
 */
@ Directives
	.cpu	cortex-a53		@ Version of our Pis
	.syntax	unified			@ Modern ARM syntax

	.global FILENAME  		@ Function to export

	.equ	FP_OFF, 4		@ (# saved regs - 1) * bytes/reg


	.text				@ Switch to text segment
	.align 2			@ Align on 4-byte instructions

FILENAME:
	push	{fp, lr}		@ Save caller's fp, ret. address
	add	fp, sp, FP_OFF		@ Move fp to base of saved regs


return:
	sub	sp, fp, FP_OFF		@ Move sp to top of saved regs
	pop	{fp, pc}		@ Restore caller's stack frame
