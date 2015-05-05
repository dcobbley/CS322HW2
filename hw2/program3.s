	.file	"linux.s"
        .text
	.globl	f
f:

### This is where your code begins ...
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#		movq	%rdi, %rdx		#copy starting address	
#loop1:	addq	$4, %rdx		#move up to first element
#		movl	(%rdx), %eax	#catch the first element in the array
#		cmpl	$0, %eax		#check if the array is empty
#		jne		loop1
#		subq	$4, %rdx		#point to the last element
#
#loop2:	cmpq	%rdx, %rdi		#compare if rdi less than rdx
#		jnl		done
#		movl	(%rdi), %ecx	#grab value from end
#		movl	(%rdx), %eax	#grab element from the start
#		movl	%eax, (%rdi)	#put end in the start
#		movl	%ecx, (%rdx)	#put start into end
#		addq	$4, %rdi		#increment head
#		subq	$4, %rdx		#decrement end
#		jmp		loop2
		
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		movq	(%rdi), %rax	#grab first element in array
		cmpq	$0, %rax		#check if array contains 0 elements
		je		done
		cmpq	$1, %rax		#check if array contains only 1 element
		je		done

		addq	$4, %rdi		#increment forward
		movq	%rdi, %rdx		#copy starting address


		imulq	$4, %rax		#multiply 4 times the number in eax for # of bytes
		addq	%rax, %rdx		#go to the end of the array
		subq	$4, %rdx

loop2:	cmpq	%rdx, %rdi
		jnl		done
		movl	(%rdi), %ecx	#grab value from end
		movl	(%rdx), %eax	#grab element from the start
		movl	%eax, (%rdi)	#put end in the start
		movl	%ecx, (%rdx)	#put start into end
		addq	$4, %rdi		#increment head
		subq	$4, %rdx		#decrement end
		jmp		loop2
		


done:
        movl    $1, %eax     
### This is where your code ends ...

	ret
