	.file	"linux.s"
        .text
	.globl	f
f:

### This is where your code begins ...

		#if two arrays aren't equal, return 0
		movl	(%rsi), %eax
		cmpl	(%rdi), %eax
		jne 	fail
		
loop:	cmpl	$0, %eax	#see if array is empty
		je		done

		addq 	$4, %rdi		#increment array forward
		addq	$4, %rsi		#incremenet array forward
		decl	%eax			#decremenet counter
		
		movl	(%rsi), %edx	#move rsi to temp
		xchgl	(%rdi), %edx	#swap temp with rdi
		movl	%edx, (%rsi)	#put rdis old value into rsi

		jmp		loop

done:

		movl	$1, %eax
		ret

fail:
		movl	(%rdi), %edx
		cmpl	%edx, %eax
		jge		1f
		xchgl	%edx, %eax
1:		subl	%edx, %eax
		ret
