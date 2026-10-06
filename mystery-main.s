# Write the assembly code for the main function of the mystery program

.text
.global main
main:
  # Prologue: push rbx and r12, then sub 8 from rsp
  # (two pushes leave the stack off by 8)

  # if (argc != 3) jump to error

  # Save argv in rbx

  # a = atol(argv[1]): put 8(%rbx) in rdi, call atol, move rax to r12

  # b = atol(argv[2]): put 16(%rbx) in rdi, call atol

  # result = crunch(a, b): a into rdi, b into rsi, call crunch

  # Compare result with 0: jl to print_hat, je to print_tea,
  # otherwise fall through to print_beer

print_beer:
  # put address of beer_msg in rdi, call puts, jump to success

print_hat:
  # put address of hat_msg in rdi, call puts, jump to success

print_tea:
  # put address of tea_msg in rdi, call puts, fall through to success

success:
  # return 0: put 0 in rax, jump to done

error:
  # put address of error_msg in rdi, call puts, put 1 in rax

done:
  # Epilogue: add 8 to rsp, pop r12, pop rbx, ret

.data
error_msg:
  .asciz "Two arguments required."
hat_msg:
  .asciz "hat"
tea_msg:
  .asciz "tea"
beer_msg:
  .asciz "beer"
