	.file	"linux.s"
        .text
	.globl	f
f:

### This is where your code begins ...
	#shift the first array
		movl	(%rdi), %eax
		cmpl	$0, %eax
		je		done
		
		addq	$4, %rdi
		movl	(%rdi), %edx		#grab first element, and store for later

loop:	decl	%eax
		cmpl	$0, %eax
		je 		1f
		movl	4(%rdi), %ecx
		movl	%ecx, (%rdi)	
		addq	$4, %rdi
		jmp		loop			


1:	#shift the second array
		#see if rsi is empty
		movl	(%rsi), %eax
		cmp		$0, %eax
		je		secondempty

		#else move rsi's first element into rdi's last
		addq	$4, %rsi
		movl	(%rsi), %ecx
		movl	%ecx, (%rdi)

loop2:	decl	%eax
		cmpl	$0, %eax
		je		done

		movl	4(%rsi), %ecx
		movl	%ecx, (%rsi)
		addq	$4, %rsi
		jmp		loop2
		# the first array is done
		#now do the same type of deal for the second array and put edx into its end

secondempty:
		movl	%edx, (%rdi)
		# the first array is done & is the only array with anything inside

done:
		movl	%edx, (%rsi)
### This is where your code ends ...

	ret
