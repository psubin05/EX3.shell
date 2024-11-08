#!/bin/bash

# 파일 이름을 지정합니다.
FILE="DB.txt"

# 사용자가 입력한 인자를 확인합니다.
if [ $# -ne 2 ]; then
  echo "사용법: $0 이름 전화번호"
  exit 1
fi

# 인자들을 변수에 저장합니다.
NAME=$1
PHONE=$2

# 파일이 없으면 새로 생성합니다.
if [ ! -f "$FILE" ]; then
  touch "$FILE"
fi

# 입력한 이름과 전화번호를 DB.txt 파일에 추가합니다.
echo "$NAME $PHONE" >> "$FILE"
echo "$NAME $PHONE 정보를 DB.txt에 추가했습니다."

