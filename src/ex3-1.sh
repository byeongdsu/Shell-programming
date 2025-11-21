#!/bin/bash

# S#:인자의 개수(parameter count)
# $1:첫 번째 인자
# $2:두 번째 인자
# $0:스크립트 이름

if [ $# -ne 2 ]; then
	echo "사용법: $0 <정수1> <정수2>"
	exit 1
fi

a=$1
b=$2

echo "첫 번째 인자 a = $a"
echo "두 번째 인자 b = $b"

echo "$a + $b = $((a + b))"
echo "$a - $b = $((a - b))"
echo "$a * $b = $((a * b))"
echo "$a / $b = $((a / b))"
echo "$a % $b = $((a % b))"
