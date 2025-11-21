#!/bin/bash

read -p "몇 개의 x 값을 입력하시겠습니까? " n

for ((i=1; i<=n; i++)); do
    read -p "$i 번째 x 값 입력: " x
    y=$(echo "0.5 * $x * $x" | bc -l)
    echo "x = $x → y = $y"
    echo
done
