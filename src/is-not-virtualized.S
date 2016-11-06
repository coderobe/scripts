.global main
main:
  mov $0x1, %eax
  cpuid
  mov %ecx, %eax
  shr $0x1f, %eax
  ret
