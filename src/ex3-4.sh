#!/bin/bash

scores=()   

while true; do
    echo "============================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급(GPA) 확인"
    echo "5) 종료"
    echo "============================="
    
    read -p "메뉴 번호를 선택하시오: " menu
    echo

    case $menu in
        1)
            while true; do
                read -p "성적을 추가하시오: " score

                if (( $(echo "$score < 0" | bc -l) )) || (( $(echo "$score > 100" | bc -l) )); then
                    echo "점수는 0~100 사이여야 합니다."
                    continue
                fi

                scores+=("$score")
                break
            done
            ;;

        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "저장된 점수가 없습니다."
            else
                echo "입력된 점수 목록:"
                for s in "${scores[@]}"; do
                    echo "$s"
                done
            fi
            ;;

        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "점수가 없어 평균을 계산할 수 없습니다."
            else
                sum=0
                for s in "${scores[@]}"; do
                    sum=$(echo "$sum + $s" | bc -l)
                done
                avg=$(echo "$sum / ${#scores[@]}" | bc -l)
                echo "평균 점수: $avg"
            fi
            ;;

        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "점수가 없어 등급을 계산할 수 없습니다."
            else
                sum=0
                for s in "${scores[@]}"; do
                    sum=$(echo "$sum + $s" | bc -l)
                done
                avg=$(echo "$sum / ${#scores[@]}" | bc -l)

                if (( $(echo "$avg >= 90" | bc -l) )); then
                    grade="A"
                else
                    grade="B"
                fi

                echo "평균 등급(GPA): $grade"
            fi
            ;;

        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;
        
        *)
            echo "잘못된 입력입니다. 1~5번 중 고르세요."
            ;;
    esac

    echo
done

