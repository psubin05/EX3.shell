#!/bin/bash

# 사용자에게 폴더 이름을 입력 받음
read -p "폴더 이름을 입력하세요: " folder_name

# 폴더가 있는지 확인하고 없으면 생성
if [ ! -d "$folder_name" ]; then
    echo "$folder_name 폴더가 없습니다. 폴더를 생성합니다."
    mkdir "$folder_name"
else
    echo "$folder_name 폴더가 이미 존재합니다."
fi

# 폴더 안에 5개의 파일 생성
for i in {0..4}
do
    touch "$folder_name/file$i.txt"
done

echo "5개의 파일이 생성되었습니다."

# 생성된 폴더를 압축
tar -cvf "$folder_name.tar" "$folder_name"
echo "$folder_name 폴더가 압축되었습니다."

# 압축을 해제할 새로운 폴더 생성
new_folder="$folder_name/$folder_name"
mkdir -p "$new_folder"
echo "$new_folder 폴더가 생성되었습니다."

# 새로운 폴더에 압축 해제
tar -xvf "$folder_name.tar" -C "$new_folder"
echo "$folder_name.tar 파일이 $new_folder 폴더에 압축 해제되었습니다."

