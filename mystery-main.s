.text
.global main
main:
  # Prologue: save rbx and r12, then realign the stack
  push %rbx
  push %r12
  sub $8, %rsp

  # if (argc != 3) jump to error
  cmp $3, %edi
  jne error

  # Save argv in rbx
  mov %rsi, %rbx

  # a = atol(argv[1])
  mov 8(%rbx), %rdi
  call atol
  mov %rax, %r12

  # b = atol(argv[2])
  mov 16(%rbx), %rdi
  call atol

  # result = crunch(a, b)
  mov %r12, %rdi
  mov %rax, %rsi
  call crunch

  # Branch on the sign of result
  cmp $0, %rax
  jl print_hat
  je print_tea

print_beer:
  # Print "beer"
  mov $beer_msg, %rdi
  call puts
  jmp success

print_hat:
  # Print "hat"
  mov $hat_msg, %rdi
  call puts
  jmp success

print_tea:
  # Print "tea"
  mov $tea_msg, %rdi
  call puts

success:
  # Return 0
  mov $0, %rax
  jmp done

error:
  # Print error and return 1
  mov $error_msg, %rdi
  call puts
  mov $1, %rax

done:
  # Epilogue: undo the alignment, restore registers in reverse order
  add $8, %rsp
  pop %r12
  pop %rbx
  ret

.data
error_msg:
  .asciz "Two arguments required."
hat_msg:
  .asciz "hat"
tea_msg:
  .asciz "tea"
beer_msg:
  .asciz "beer"
