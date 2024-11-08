#!/bin/bash

# 사용자로부터 폴더 이름 입력 받기
echo "폴더 이름을 입력하세요:"
read folder_name

# 입력된 이름으로 폴더 생성 (존재하지 않을 때만)
if [ ! -d "$folder_name" ]; then
  mkdir "$folder_name"
  echo "$folder_name 폴더가 생성되었습니다."
fi

# 폴더 내 기존 파일 목록 출력
echo "[$folder_name] 폴더에 이미 존재하는 파일 목록:"
cd "$folder_name"
ls -1 2>/dev/null || echo "폴더가 비어 있습니다."

# 사용자로부터 새로 생성할 파일 이름 입력 받기
echo "새로 생성할 파일 이름을 입력하세요 (공백으로 구분하여 5개 이상):"
read -p "파일 이름: " filenames  # 여러 파일 이름을 공백으로 구분하여 입력 받기

# 입력받은 파일 이름으로 파일 생성
for file in $filenames; do
  touch "$file"
  echo "$file 파일이 생성되었습니다."
done

# 각 파일 이름대로 하위 폴더 자동 생성 및 링크 파일 생성
for file in $filenames; do
  subfolder="${file%.*}"  # 파일명에서 확장자 제거하여 폴더명 생성
  mkdir -p "$subfolder"  # 하위 폴더가 없으면 생성
  ln -sf "../$file" "$subfolder/$file"  # 파일 링크 생성 (기존에 존재하면 덮어쓰기)
  
  # 생성된 폴더 및 링크 경로 출력
  linked_file=$(readlink -f "$subfolder/$file")  # 링크의 실제 경로 확인
  echo "$subfolder 폴더가 생성되었고, 링크 생성: $linked_file"
done

echo "작업이 완료되었습니다."

