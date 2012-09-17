#
# Computes Fibonacci of number pointed by label "total"
#

.data

	total:			.byte 0x2E	# Fibonacci Number to be computed

.text
.globl main

main:
	
	# T0 for total value
	# T1 for counter value
	# T2 for prevResult value
	# T3 for newResult value
	# S0 for result value

	la $t0, total				# $t0 = address( total )
	lb $t0, 0( $t0 )			# $t0 = value( total )
	
	addi $s0, $0, 1				# result = 1

	addi $t1, $0, 1				# counter = 1
	addi $t2, $0, 0				# prevResult = 0

	j loop						# loop()

loop:

	add $t3, $s0, $0			# newResult = result
	add $s0, $s0, $t2			# result = result + prevResult
	add $t2, $t3, $0			# prevResult = newResult

	addi $t1, $t1, 1			# counter = counter + 1

	blt $t1, $t0, loop			# if ( counter lt total ) loop

	li $v0, 10					# Set return value 10
	syscall						# Syscall with return value