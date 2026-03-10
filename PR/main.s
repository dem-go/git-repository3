	.file	"main.cpp"
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.globl	_Z5kbhitv
	.type	_Z5kbhitv, @function
_Z5kbhitv:
.LFB2350:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	tcgetattr@PLT
	movq	-144(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-128(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-112(%rbp), %rax
	movq	-104(%rbp), %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-100(%rbp), %rax
	movq	-92(%rbp), %rdx
	movq	%rax, -36(%rbp)
	movq	%rdx, -28(%rbp)
	movl	-68(%rbp), %eax
	andl	$-11, %eax
	movl	%eax, -68(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	tcsetattr@PLT
	movl	$0, %edx
	movl	$3, %esi
	movl	$0, %edi
	movl	$0, %eax
	call	fcntl@PLT
	movl	%eax, -152(%rbp)
	movl	-152(%rbp), %eax
	orb	$8, %ah
	movl	%eax, %edx
	movl	$4, %esi
	movl	$0, %edi
	movl	$0, %eax
	call	fcntl@PLT
	call	getchar@PLT
	movl	%eax, -148(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	tcsetattr@PLT
	movl	-152(%rbp), %eax
	movl	%eax, %edx
	movl	$4, %esi
	movl	$0, %edi
	movl	$0, %eax
	call	fcntl@PLT
	cmpl	$-1, -148(%rbp)
	je	.L2
	movq	stdin(%rip), %rdx
	movl	-148(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	ungetc@PLT
	movl	$1, %eax
	jmp	.L4
.L2:
	movl	$0, %eax
.L4:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2350:
	.size	_Z5kbhitv, .-_Z5kbhitv
	.section	.rodata
.LC0:
	.string	"clear"
.LC1:
	.string	"Flappy Bird Terminal\n"
.LC2:
	.string	"Press SPACE to jump\n"
.LC3:
	.string	"Press any key to start...\n"
.LC4:
	.string	"Score: "
.LC5:
	.string	"\nGAME OVER! Score: "
.LC6:
	.string	"\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2351:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	system@PLT
	leaq	.LC1(%rip), %rdx
	leaq	_ZSt4cout(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC2(%rip), %rdx
	leaq	_ZSt4cout(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	leaq	.LC3(%rip), %rdx
	leaq	_ZSt4cout(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	call	getchar@PLT
	movl	$10, -24(%rbp)
	movl	$0, -20(%rbp)
	movl	$35, -16(%rbp)
	movl	$0, -12(%rbp)
.L21:
	call	_Z5kbhitv
	testl	%eax, %eax
	je	.L7
	call	getchar@PLT
	cmpl	$32, %eax
	jne	.L7
	movl	$1, %eax
	jmp	.L8
.L7:
	movl	$0, %eax
.L8:
	testb	%al, %al
	je	.L9
	movl	$-3, -20(%rbp)
.L9:
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	addl	%eax, -24(%rbp)
	subl	$1, -16(%rbp)
	cmpl	$0, -16(%rbp)
	jns	.L10
	movl	$35, -16(%rbp)
	addl	$1, -12(%rbp)
.L10:
	cmpl	$0, -24(%rbp)
	js	.L11
	cmpl	$18, -24(%rbp)
	jg	.L11
	cmpl	$15, -16(%rbp)
	jne	.L12
	cmpl	$4, -24(%rbp)
	jle	.L11
	cmpl	$11, -24(%rbp)
	jg	.L11
.L12:
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	system@PLT
	movl	$0, -8(%rbp)
	jmp	.L13
.L20:
	movl	$0, -4(%rbp)
	jmp	.L14
.L19:
	cmpl	$15, -4(%rbp)
	jne	.L15
	movl	-8(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jne	.L15
	leaq	_ZSt4cout(%rip), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
	jmp	.L16
.L15:
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jne	.L17
	cmpl	$4, -8(%rbp)
	jle	.L18
	cmpl	$11, -8(%rbp)
	jle	.L17
.L18:
	leaq	_ZSt4cout(%rip), %rax
	movl	$35, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
	jmp	.L16
.L17:
	leaq	_ZSt4cout(%rip), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
.L16:
	addl	$1, -4(%rbp)
.L14:
	cmpl	$39, -4(%rbp)
	jle	.L19
	leaq	_ZSt4cout(%rip), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT
	addl	$1, -8(%rbp)
.L13:
	cmpl	$19, -8(%rbp)
	jle	.L20
	leaq	.LC4(%rip), %rdx
	leaq	_ZSt4cout(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZNSolsEi@PLT
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	movl	$50000, %edi
	call	usleep@PLT
	jmp	.L21
.L11:
	leaq	.LC5(%rip), %rdx
	leaq	_ZSt4cout(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2351:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20260209"
	.section	.note.GNU-stack,"",@progbits
