#!/bin/sh
height=$1  # 키 (cm)
weight=$2  # 몸무게 (kg)

# 키를 미터로 변환
height_meters=$(echo "$height / 100" | bc -l)

# BMI 계산
bmi=$(echo "scale=2; $weight / ($height_meters * $height_meters)" | bc)

# BMI 범위에 따른 출력
if [ $(echo "$bmi < 18.5" | bc) -eq 1 ]; then
    echo "저체중"
elif [ $(echo "$bmi < 23" | bc) -eq 1 ]; then
    echo "정상체중"
else
    echo "과체중"
fi

