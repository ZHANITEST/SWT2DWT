# SWT2DWT
![On no!](https://raw.githubusercontent.com/ZHANITEST/SWT2DWT/master/2020-02-18%2001_58_02-.png)
Simple and dirty, SWT java code to DWT dlang code converter.

# 적용된 룰 (Replace rules)
1. (Java) String => (D) string
2. (Java) package => (D) module

If I feel to need more rules, I will add it.

# QnA
## Are you have any update plan for fresh?
No.

## How to build it?
```
git clone https://github.com/ZHANITEST/SWT2DWT
cd SWT2DWT
dmd swt2dwt.d
```
And `cp` in your `dub` project.

## How to use it?
First, u need to split a `main` method from your SWT design code.

Default, `swt2dwt` will change all d code in `source` without `app.d`. That's it. 

```
swt2dwt <source directory name> // ex) swt2dwt source
```

## I don't wanna all change my d code.
Check out number 20 lines. Or, find a `string[] doNotChange` line. And feel free to modify it.
