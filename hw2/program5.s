	.file	"linux.s"
        .text
	.globl	f
f:

### This is where your code begins ...
#rdi is first array
#rsi is second array
	#if the two arrays have the same length
		movq	%rsi, %r9
		movl	$0, %esi	#just need an extra 32bit register

		movl	(%rdi),	%eax		#put one of the lengths in a temp
		cmpl	(%r9), %eax		#compare temp to other array length
		jne		diff
		
loop:	cmpl	$0,	%eax			#check if array is empty
		je		done
		decl	%eax
	#ccmpare pairwise fashion
		addq	$4, %rdi
		addq	$4, %r9
	#dot product
		movl	(%rdi), %edx	
		imull	(%r9), %edx
		addl	%edx, %esi
	#perform swapping if needed. Ineficient use of registers, but nescesary?	
		movl	(%rdi), %edx	
		cmpl	%edx, (%r9)
		jl		swap
		jmp		loop
swap:
	#put the minimum value into rdi
	#put max value into rsi
		xchgl	%edx, (%r9)
		movl	%edx, (%rdi)
		jmp 	loop
		
	#if the two arrays have different length
diff:
	#return the sum of the lengths
		addl	(%r9), %eax
	ret
			
done:
### This is where your code ends ...
	movl	%esi, %eax

	ret
