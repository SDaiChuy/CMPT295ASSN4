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
	movl  %ecx, %edi	# moving x (%edi) into the result (%eax) register
	andl  %ecx, %esi	# moving y (%esi) into a second (%ecx) register
	
	movl  %eax, %edi		# getting the negation of y ($ecx) 
	xorl   %eax, %esi 		# bitwise to of adding x (%eax) and y (%ecx) saving into result register
	
	movl  %edi, %ecx 			# negate the result
	sall  $1,  	%edi				# return the the result (%eax)				

	movl   %esi, %eax
	
	ret

minus: # Description: Performs integer subtraction
# Requirement:
# - you cannot use sub* instruction
# - you cannot use a loop

# Put your code here
#using addl instead of sub
	#xorl  %eax, %eax	# xor'ing result register
	#xorl  %edx, %edx	# xor'ing storing register
	movl  %edi, %eax	# moving x (%edi) into the result (%eax) register
	notl  %esi			# getting the negation of y ($esi)
	addl  %esi, %eax	# adding the negation of y (esi) into the result (%eax) register
	notl  %eax			# negate the result
	ret					# return the the result (%eax)

mul: # Description: Performs integer multiplication - when both operands are non-negative!
# You can assume that both operands are non-negative.
# Requirements:
# - you cannot use imul* instruction 
#   (or any kind of instruction that multiplies such as mul)
# - you must use a loop

# algorithm:
# set result variable to 0.
# Loop: while the second operand is greater than 0
#    1. If the second operand is odd, add the first operand to the result.
#    2. Shift the first operand to the left by 1.
#    3. Shift the second operand to the right by 1.
# return

# Put your code here
# using shifts instead of mul
  #xorl  %eax, %eax		# xor'ing result register
  #xorl  %edx, %edx		# xor'ing counter register
  movl  %edi, %ecx		# moving x (%edi) into a register (%ecx) 
  movl  %esi, %ebx		# moving y (%esi) into a register (%ebx)
  jmp   .L2				# jump to the compare loop
.L3:
  addl  %edi, %eax 		# Add x to the result stored in eax
  addl  $1, %edx 		# increment the counterby 1 stored in edx
.L2:
  cmpl  %ebx, %edx 		# Compare the value of y (%ebx) with counter (%edx)
  jne   .L3				# jump to L3 loops if y (%ebx) is larger the counter (%edx)
  ret					# return the result