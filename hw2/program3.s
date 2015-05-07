	.file	"linux.s"
        .text
	.globl	f
f:
	#At start
		#registers avaliable 
		#-rax(return result here), rsi, rdx, rcx, r8, r9, r10, r11 
		#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

		#used regsiters
		#-rdi- first array
		#-rsi-	second array (not in this program)
		#others(don't use) - rbx, rbp, r12, r13, r14, r15
		#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	#during
		#registers avaliable(didn't use...)
		#-
		#used regsiters(what i did use)
		#-rdi(head), rdx(tail), eax(element counter), 

### This is where your code begins ...
		movl	(%rdi), %eax	#grab first element in array
		cmpl	$0, %eax		#Check if array has 0 elements
		je		done
		
		cmpl	$1, %eax		#check if array has 1 element
		je		done

		addq	$4, %rdi		#increment array pointer forward
		movq	%rdi, %rdx		#copy starting address

		imull	$4, %eax		#move other pointer to the end of the array
		addq	%rax, %rdx	
		subq	$4,	%rdx

loop:	cmpq	%rdx, %rdi		#begin loop of swapping
		jnl		done			#check if memory addresses have passed each other

		movl	(%rdi),	%ecx	#get the value from the beginning of the array
		movl	(%rdx),	%eax	#get the value from the end of the array
		
		movl	%eax, (%rdi)	#put the end in the start
		movl	%ecx, (%rdx)	#put the start in the end
		addq	$4,	%rdi		#incremenet head
		subq	$4, %rdx		#decrement tail

		jmp		loop

done:
		movl	$1, %eax
		ret
