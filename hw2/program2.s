	.file	"linux.s"
        .text
	.globl	f
f:

### This is where your code begins ...

#count number of zeros in the first array
		movl    $0,	%eax        #init eax to zero incase total  = 0
		movl    (%rdi), %ecx    #number of elements in array
		cmpl    $0, %ecx        #check if array contains zero elements
		je		1f

2:		addq	$4,	%rdi		#add 4 to rdi 
		movl	(%rdi),	%edx	#put array element into temp to analyze it
		decl	%ecx			#decrement number of elements left in array to search
		cmpl	$0, %edx		#if array element == 0, increment it
		je		3f				#need to increment eax

		cmpl	$0, %ecx		#check if any elements left in array
		je		1f

		jmp 	2b				#if there are still elements in array, do loop again

3:		incl	%eax			#increment eax
		cmpl	$0, %ecx		#check if there are any elements left to check
		je		1f				#move on if not

		jmp 	2b				#if there are, jump back through the loop.

#count number of non zeros in second array
1:		movl	(%rsi), %ecx	#keep track of number of elements in the array
		cmpl	$0, %ecx		#check if there are any elements in the array
		je		1f				#move on if not

2:		addq	$4, %rsi		#add 4 to the array to increment
		movl	(%rsi), %edx	#put array element into temp to analyze
		decl	%ecx			#decrement count of elements
		cmpl	$0, %edx		#if array elements != 0, increment count
		jne		3f

		cmpl	$0, %ecx		#check if elements left in array
		je		1f

		jmp		2b

3:		incl	%eax			#increment
		cmpl	$0, %ecx
		je		1f				#no elements left to check
		jmp 	2b


1:



### This is where your code ends ...

	ret
