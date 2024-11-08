#!/bin/sh

# 내부 함수 정의
run_ls() {
  # 입력 받은 옵션을 ls 명령어에 전달
  ls $1
}

# 사용자로부터 옵션 입력 받기
echo "옵션을 입력하세요 (예: -l, -a, -lh 등):"
read option

# 내부 함수 호출
run_ls "$option"

