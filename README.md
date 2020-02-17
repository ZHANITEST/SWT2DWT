# SWT2DWT

Simple and dirty, SWT java code to DWT dlang code converter.

# 적용된 룰 (Replace rules)
1. (Java) String => (D) string
2. (Java) package => (D) module

If I feel to need more rules, I will add it.

# QnA
## Can you have any update plan for fresh?
No.

## How to build it?
```
git clone https://github.com/ZHANITEST/SWT2DWT
cd SWT2DWT
dmd swt2dwt.d
```
And feel free to `cp` in your `dub` project.

## How to use it?
```
swt2dwt <source directory name>
```

## I don't wanna all change my d code.
Check out number 20 lines. And feel free to modify it.
