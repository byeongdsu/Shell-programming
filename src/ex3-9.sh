#!/bin/bash

DB_FILE="DB.txt"

if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true; do
    echo "=========================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "=========================="

    read -p "메뉴 번호를 선택하세요: " menu
    echo

    case "$menu" in
        1)
            read -p "이름: " name
            read -p "생일 또는 전화번호: " info
            echo "M|$name|$info" >> "$DB_FILE"
            echo "팀원 정보가 저장되었습니다."
            ;;

        2)
            read -p "날짜: " date
            read -p "팀원 이름: " members
            read -p "수행 내용: " work
            echo "L|$date|$members|$work" >> "$DB_FILE"
            echo "수행 내용이 저장되었습니다."
            ;;

        3)
            read -p "검색할 이름: " qname
            echo "이름 '$qname' 검색 결과"
            grep "$qname" "$DB_FILE" || echo "검색 결과가 없습니다."
            ;;

        4)
            read -p "검색할 날짜: " qdate
            echo "날짜 '$qdate' 검색 결과"
            grep "$qdate" "$DB_FILE" || echo "검색 결과가 없습니다."
            ;;

        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;

        *)
            echo "잘못된 입력입니다. 1~5 중에서 선택하세요."
            ;;
    esac

    echo
done
