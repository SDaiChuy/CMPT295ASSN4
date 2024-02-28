# add a header comment block
# calculator.s is an x86-64 assembly calculator
# 2/20/23
# Steven Dai Chuy

	.globl	lessThan # Make sure you change the name of this function - see XX function below
	.globl	plus
	.globl	minus
	.globl	mul


lessThan: # Description: Compares two integers and sets the result based on the comparison
			# 1 if the first integer is less than the second, 0 otherwise
    # Change the name of this function to something more descriptive and add a description above
	xorl	%eax, %eax
	cmpl	%esi, %edi
	setl	%al         # See Section 3.6.2 of our textbook for a  
	ret                 # description of the set* instruction family

plus: # Description: Performs integer addition
# Requirement:
# - you cannot use add* instruction
# - you cannot use a loop


# Put your code here
# Using the negates, XOR and AND instead of add  
	xorl	%eax, %eax 			# clearing the result register (%eax)
	xorl	%edx, %edx  			# clearing variable register (%edx)
	xorl	%ecx, %ecx			# clearing variable register (%ecx)
	movl	%esi, %edx			# move the x (%esi) variable into another register (%edx)
	movl	%edi, %ecx			# move the y (%edi) variable into another register (%ecx)
	lea 	(%edx, %ecx), %eax		# adding the integers x (%edi) and y (%esi) into result 
	ret

minus: # Description: Performs integer subtraction
# Requirement:
# - you cannot use sub* instruction
# - you cannot use a loop

# Put your code here
#using addl and adcl instead of sub
	xorl	%eax, %eax			# clearing result register
	xorl	%edx, %edx  			# clearing variable register (%edx)
	xorl	%ecx, %ecx			# clearing variable register (%ecx)
	movl	%esi, %edx			# move the x (%esi) variable into another register (%edx)
	movl	%edi, %ecx			# move the y (%edi) variable into another register (%ecx)
	negl	%ecx				# negating the y (%ecx) variable
	lea	(%edx, %ecx), %eax		# adding the ineger x (%edx) with negated y (%ecx) into result
	negl	%eax				# negatiing the result (%eax)
	ret							# return the the result (%eax)

mul: # Description: Performs integer multiplication - when both operands are non-negative!
# You can assume that both operands are non-negative.
# Requirements:
# - you cannot use imul* instruction 
#   (or any kind of instruction that multiplies such as mul)
# - you must use a loop

# algorithm:
# set result variable to 0.
# Loop: while the second operand is greater than counter
#    1. add x into the result variable
#	 2.	increment the counter variable
# End loop when y and the counter are the same   
# return

# Put your code here
# using shifts instead of mul
  xorl  %eax, %eax		# clearing result register
  xorl  %edx, %edx		# clearing the variable register (%edx)
  xorl 	%ecx, %ecx		# clearing the variable register (%ecx)
  xorl	%ebx, %ebx		# clearing the variable register (%ebx)	
  movl  %esi, %edx		# moving x (%esi) into a register (%edx) 
  movl  %edi, %edx		# moving y (%edi) into a register (%edx)
  jmp   .L2			# jump to the compare loop
.L3:
  addl  %esi, %eax 		# Add x to the result stored in eax
  addl  $1, %ebx 		# increment the counterby 1 stored in ebx
.L2:
  cmpl  %edx, %ebx 		# Compare the value of y (%edx) with counter (%ebx)
  jne   .L3			# jump to L3 loops if y (%edx) is larger the counter (%ebx)
  ret				# return the result
