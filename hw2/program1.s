	.file	"linux.s"
        .text
	.globl	f
f:

### This is where your code begins ...

		movl	(%rdi), %ebx	#number of elements in array

loop:		addq	$4,%rdi		#add 4 to rdi
		addl	(%rdi), %eax	#put  element into array
		decl	%ebx			#decrement ebx 
		cmpl	$0, %ebx			#check if ebx is zero - done
		je		done
		jmp 	loop			#else loop



done:


				#Do the same for rsi
### This is where your code ends ...

	ret
