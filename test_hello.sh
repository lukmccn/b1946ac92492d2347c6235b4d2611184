#!/bin/bash

# Compile hello.c
gcc hello.c -o hello
if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
fi

# Run and capture output
output=$(./hello)
expected="Hello world!"

if [ "$output" = "$expected" ]; then
    echo "Test Passed: Output matches expected '$expected'"
    rm hello
    exit 0
else
    echo "Test Failed: Expected '$expected', but got '$output'"
    rm hello
    exit 1
fi
