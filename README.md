# fibonacci-nasm

## recursive if-else

| v | # | 30 | 35 | 40 | 45 |
| --- | --- | --- | --- | --- | --- |
| NASM 2.15.05 | [NAMS](./fib.asm) (compiled) | - | - | - | - |
| | [Total](https://github.com/xaoc-303/fibonacci) | | | | |

## optimization

| v | # | 30 | 35 | 40 | 45 |
| --- | --- | --- | --- | --- | --- |
| NASM 2.15.05 | [NAMS](./fib.asm) (compiled) | 0,001 | 0,001 | 0,001 | 0,001 |
| | [Total](https://github.com/xaoc-303/fibonacci) | | | | |

## run

```
nasm -felf64 fib.asm && gcc -no-pie fib.o && time ./a.out 30
```
