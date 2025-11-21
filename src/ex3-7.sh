#!/bin/bash

while true; do
	echo "========================="
	echo "1) 사용자 정보"
	echo "2) GPU/CPU 사용률 확인"
	echo "3) 메모리 사용량 확인"
	echo "4) 디스크 사용량 확인"
	echo "5) 종료"
	echo "========================="

	read -p "메뉴 번호를 선택하시오: " menu
	echo
	
	case "$menu" in
		1)
			echo "-----[1]사용자 정보-----"
			echo "현재 사용자: $(whoami)"
			echo 
			echo "현재 로그인 중인 사용자:"
			who
			;;
		
		2) 
			echo "-----[2]GPU/CPU 사용률-----"
			if command -v nvidia-smi >/dev/null 2>&1; then
				echo "GPU  상태 - nvidia-smi"
				nvidia-smi
			else
				echo "CPU 사용률을 표시합니다."
				echo "CPU 사용률 - top"
				top -b -n 1 | head -n 5
			fi
			;;

		3) 
			echo "-----[3]메모리 사용량-----"
			free -h
			;;
		
		4)
			echo "-----[4]디스크 사용량-----"
			df -h
			;;
	
		5) 
			echo "프로그램을 종료합니다."
			exit 0
			;;
	esac
	
	echo
done 
