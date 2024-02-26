	.file	"main.c"
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, 88(%rsp)
	movq	%r8, 96(%rsp)
	movq	%r9, 104(%rsp)
	leaq	88(%rsp), %rsi
	movq	%rsi, 40(%rsp)
	movl	$1, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, %r8
	movq	%rbx, %rdx
	call	__mingw_vfprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "%d < %d -> %d\12\0"
.LC1:
	.ascii "%d + %d = %d\12\0"
.LC2:
	.ascii "%d - %d = %d\12\0"
.LC3:
	.ascii "%d * %d = %d\12\0"
	.align 8
.LC4:
	.ascii "Must supply 2 integers arguments.\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	%ecx, %ebx
	movq	%rdx, %rsi
	call	__main
	cmpl	$3, %ebx
	jne	.L3
	movq	8(%rsi), %rcx
	call	atoi
	movl	%eax, %ebx
	movq	16(%rsi), %rcx
	call	atoi
	movl	%eax, %esi
	movl	%eax, %edx
	movl	%ebx, %ecx
	call	lessThan
	movl	%eax, %r9d
	movl	%esi, %r8d
	movl	%ebx, %edx
	leaq	.LC0(%rip), %rcx
	call	printf
	movl	%esi, %edx
	movl	%ebx, %ecx
	call	plus
	movl	%eax, %r9d
	movl	%esi, %r8d
	movl	%ebx, %edx
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	%esi, %edx
	movl	%ebx, %ecx
	call	minus
	movl	%eax, %r9d
	movl	%esi, %r8d
	movl	%ebx, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	%esi, %edx
	movl	%ebx, %ecx
	call	mul
	movl	%eax, %r9d
	movl	%esi, %r8d
	movl	%ebx, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$0, %eax
.L2:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L3:
	leaq	.LC4(%rip), %rcx
	call	printf
	movl	$1, %eax
	jmp	.L2
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	lessThan;	.scl	2;	.type	32;	.endef
	.def	plus;	.scl	2;	.type	32;	.endef
	.def	minus;	.scl	2;	.type	32;	.endef
	.def	mul;	.scl	2;	.type	32;	.endef
