.text
.global array_max
array_max:
  # max = 0, i = 0
  mov $0, %rax
  mov $0, %rcx

loop:
  # if (i >= n) jump to done
  cmp %rdi, %rcx
  jae done

  # Load items[i]
  mov (%rsi,%rcx,8), %rdx

  # if (items[i] <= max) skip the update
  cmp %rax, %rdx
  jbe next

  # max = items[i]
  mov %rdx, %rax

next:
  # i++, then loop again
  inc %rcx
  jmp loop

done:
  # max is already in rax
  ret
