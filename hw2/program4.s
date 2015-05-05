	.file	"linux.s"
        .text
	.globl	f
f:

### This is where your code begins ...

		#if two arrays aren't equal, return 0
		movl	(%rsi), %eax
		cmpl	(%rdi), %eax
		jne 	fail
		
loop:	cmpl	$0, %eax
		je		done

		addq 	$4, %rdi
		addq	$4, %rsi
		decl	%eax
		
		movl	(%rsi), %edx
		xchgl	(%rdi), %edx
		movl	%edx, (%rsi)

		jmp		loop

done:

		movl	$1, %eax
		ret

fail:
		movl	$0, %eax
		ret
