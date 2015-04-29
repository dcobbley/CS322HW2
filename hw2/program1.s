	.file	"linux.s"
        .text
	.globl	f
f:

### This is where your code begins ...
		movl	$0,%eax			#init eax to zero incase total sum = 0
		movl	(%rdi), %ecx	#number of elements in array
		cmpl	$0, %ecx		#check if array contains zero elements
		je		next

loop:	addq	$4,%rdi			#add 4 to rdi
		addl	(%rdi), %eax	#put  element from array
		decl	%ecx			#decrement ebx 
		cmpl	$0, %ecx		#check if ebx is zero - done

		je		next

		jmp 	loop			#else loop

next:
#Now do the same for rsi
		movl	(%rsi), %ecx	#number of elements in array
		cmpl	$0, %ecx		#check if array contains zero elements
		je		done

secloop:	addq	$4,%rsi			#add 4 to rdi
		addl	(%rsi), %eax	#put  element from array
		decl	%ecx			#decrement ebx 
		cmpl	$0, %ecx		#check if ebx is zero - done

		je		done

		jmp 	secloop			#else loop



done:
### This is where your code ends ...

	ret
