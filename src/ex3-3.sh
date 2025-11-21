#!/bin/bash

read -p "과목 수를 입력하시오: " n

sum=0

for ((i=1; i<=n; i++)); do
    while true; do
        read -p "$i 번째 과목 점수를 입력하시오: " score

        if (( $(echo "$score < 0" | bc -l) )) || (( $(echo "$score > 100" | bc -l) )); then
            echo "점수는 0에서 100 사이여야 합니다."
            continue
        fi

        break
    done

    if (( $(echo "$score >= 90" | bc -l) )); then
        grade="A"
    else
        grade="B"
    fi

    echo "$i 번째 과목 등급: $grade"

    sum=$(echo "$sum + $score" | bc -l)
done

avg=$(echo "$sum / $n" | bc -l)

if (( $(echo "$avg >= 90" | bc -l) )); then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "평균 등급: $avg_grade"

