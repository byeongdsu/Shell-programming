#include <stdio.h>

int main(int argc, char *argv[]) {

	printf("==프로그램 시작==\n");
	
	if (argc < 3) {
		printf("2개 이상의 인자를 입력하시오.\n");
		printf("==프로그램 종료==\n");
		return 1;
	}

	printf("입력된 인자 개수: %d\n", argc - 1);

	for (int i = 1; i < argc; i++) {
		printf("argv[%d] = %s\n", i, argv[i]);
	}

	printf("==프로그램 종료==\n");
	return 0;
}
