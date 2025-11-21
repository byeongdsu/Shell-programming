#!/bin/bash

if [ ! -d "DB" ]; then
    echo "DB 폴더가 없어 생성합니다."
    mkdir DB
else
    echo "DB 폴더가 이미 존재합니다."
fi

echo "DB 폴더에 5개의 파일을 생성합니다."
for i in {1..5}; do
    echo "sample text $i" > DB/file$i.txt
done

echo "DB 폴더를 압축합니다."
tar -czf DB_files.tar.gz DB

if [ ! -d "train" ]; then
    mkdir train
    echo "train 폴더 생성 완료."
else
    echo "train 폴더가 이미 존재합니다."
fi

echo "train 폴더에 DB 파일 링크를 만듭니다."
for i in {1..5}; do
    ln -sf ../DB/file$i.txt train/file$i.txt
done

echo "작업 완료"
