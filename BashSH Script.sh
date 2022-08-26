# 디렉토리 구조 생성(adddir.sh)
===============================
#!/bin/bash

DIR=/test

[ -d $DIR ] && rm -rf $DIR/*
for i in $(seq 1 4)
do
    mkdir -p $DIR/$i
    for j in $(seq 1 $i)
    do
        mkdir -p $DIR/$i/$j
    done
done

tree $DIR	
===============================
# 계산기
========================================================
#!/bin/bash

echo -n "Enter A : "
read NUM1
echo -n "Enter B : "
read NUM2

cat << EOF
========================================
    (1) +    (2) -    (3) *    (4) /    
========================================
EOF

echo -n "Enter your choice? (1/2/3/4) : "
read CHOICE

case $CHOICE in
    1) echo "$NUM1 + $NUM2 = $(expr $NUM1 + $NUM2)" ;;
    2) echo "$NUM1 - $NUM2 = $(expr $NUM1 - $NUM2)" ;;
    3) echo "$NUM1 * $NUM2 = $(expr $NUM1 \* $NUM2)" ;;
    4) echo "$NUM1 / $NUM2 = $(expr $NUM1 / $NUM2)" ;;
    *) echo "[ FAIL ] Your choice must be 1,2,3,4."
       exit 1 ;;
esac
========================================================


















