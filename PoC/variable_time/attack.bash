#!/bin/bash

folder=/Users/michaelhu/Libraries/llvm-project/build/bin

$folder/clang main.c -O1 -S -emit-llvm --analyze
$folder/llc main.ll
clang -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX14.2.sdk -arch arm64 main.c

v=$[ $RANDOM % 256 ]
for i in {0..20}
do
  taskset -c 1 ./a.out $v
  sleep 0.1
done
