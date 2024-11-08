#!/bin/bash

# 파일 이름을 지정합니다.
FILE="DB.txt"

# 사용자가 입력한 인자를 확인합니다.
if [ $# -ne 1 ]; then
  echo "사용법: $0 이름"
  exit 1
fi

# 입력된 이름을 변수에 저장합니다.
NAME=$1

# DB.txt 파일에서 해당 이름을 검색하여 출력합니다.
if grep -q "^$NAME " "$FILE"; then
  grep "^$NAME " "$FILE"
else
  echo "$NAME에 대한 정보를 찾을 수 없습니다."
fi

