1. 디렉토리 구조 생성(adddir.sh)
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
2. 계산기v1
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
3. 계산기v2
========================================================
#!/bin/bash

echo -n "Enter A : "
read NUM1
echo -n "Enter Operator : "
read OPER1
case $OPER1 in
    '+'|'-'|'*'|'/') ;;
    *) echo "Your choice must be +, -, *, /."
       exit 1 ;;
esac
echo -n "Etner B : "
read NUM2
case $OPER1 in
    '+') echo "$NUM1 + $NUM2 = $(expr $NUM1 + $NUM2)" ;;
    '-') echo "$NUM1 - $NUM2 = $(expr $NUM1 - $NUM2)" ;;
    '*') echo "$NUM1 * $NUM2 = $(expr $NUM1 \* $NUM2)" ;;
    '/') echo "$NUM1 / $NUM2 = $(expr $NUM1 / $NUM2)" ;;
    *) echo "Your choice must be +, -, *, /."
       exit 1 ;;
esac
========================================================
4. 호스트 생성v1
==================================================================
#!/bin/bash
#   /etc/hosts
#   ############# START: hosts.sh added #############
#   192.168.10.11    server11.example.com    server11
#   192.168.10.12    server12.example.com    server12
#   192.168.10.13    server13.example.com    server13
#   ...
#   192.168.10.19    server19.example.com    server19
#   ############# END: hosts.sh added #############

for i in $(seq 1 9)
do
    IPADDR=192.168.10.1$i
    echo "$IPADDR    server1$i.example.com    server1$i" >> hosts
done
==================================================================
5. 호스트 생성v2
==================================================================
#!/bin/bash
#   /etc/hosts
#   ############# START: hosts.sh added #############
#   192.168.10.9     server9.example.com     server9
#   192.168.10.10    server10.example.com    server10
#   -> My own IP shouldn't written in file!
#   192.168.10.11    server11.example.com    server11
#   ...
#   192.168.10.19    server19.example.com    server19
#   ############# END: hosts.sh added #############

for i in $(seq 9 19)
do
    IPADDR=192.168.10.$i
    IP=$(ip addr show ens160 | grep 'inet ' | awk '{print $2}' \
                   | awk -F/ '{print $1}' | awk -F. '{print $4}')
    [ "$IP" = "$i" ] && continue
    echo "$IPADDR    server$i.example.com    server$i" >> hosts
done
==================================================================
6. 사용자 추가v1
=========================================================
#!/bin/bash
#   With "user.list" file, you can create users
#   -> must exist that file!
#   useradd <USERNAME>
#   echo <PASSWD> | passwd --stdin <USERNAME>

USERLIST=user.list

cat $USERLIST | while read UNAME UPASS
do
    useradd $UNAME
    [ $? -eq 0 ] && echo "[  OK  ] $UNAME" \
                 || echo "[ FAIL ] $UNAME"
    echo $UPASS | passwd --stdin $UNAME >/dev/null 2>&1
done
=========================================================
7. 사용자 추가v2
=========================================================
#!/bin/bash
#   With "user.list" file, you can create users
#   -> must exist that file!
#   -> this version won't need it ;)
#   useradd <USERNAME>
#   echo <PASSWD> | passwd --stdin <USERNAME>

USERLIST=/root/vscode/bin/user.list
> $USERLIST

for i in $(seq 1 20)
do
    echo "user$i user$i" >> $USERLIST
done

cat $USERLIST | while read UNAME UPASS
do
    useradd $UNAME
    [ $? -eq 0 ] && echo "[  OK  ] $UNAME" \
                 || echo "[ FAIL ] $UNAME"
    echo $UPASS | passwd --stdin $UNAME >/dev/null 2>&1
done
=========================================================
8. 사용자 삭제
=========================================================
#!/bin/bash
#   With "user.list" file, you can delete users
#   -> must exist that file!
#   userdel -r <USERNAME>

USERLIST=user.list
PASSWD=/etc/passwd

cat $USERLIST | while read UNAME UPASS
do
    grep -q -w $UNAME $PASSWD && userdel -r $UNAME \
    && echo "[DELETE] $UNAME" \
    || echo "[ FAIL ] $UNAME"
done
=========================================================
9. 사용자 관리
=========================================================
#!/bin/bash
#   You can manage general users
#   It can add, verify, delete users and also exit this script
#   Not select exit, script will shows endlessly
#   This Script will updates contiunally
#   So, if any notice or ideas, please contact vataltrick@gmail.com :)

export PASSWD=/etc/passwd
export USERLIST=/root/vscode/bin/user.list

Menu(){
cat << EOF
===================
    1) Create 
    2) Verify
    3) Delete
    4) Exit
===================
EOF
}
Goback(){
echo -n "If you want go back to menu, press any keys"
read ANYKEY
case $ANYKEY in
    *) ;;
esac
}
Userverify(){
awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd | nl
}
Useradd(){
> $USERLIST
RANGE=$(seq 1 $WANTS)
for i in $RANGE
do
    echo "user$i user$i" >> $USERLIST
done
cat $USERLIST | while read UNAME UPASS
do
    useradd $UNAME
    [ $? -eq 0 ] && echo "[  OK  ] $UNAME" \
                 || echo "[ FAIL ] $UNAME"
    echo $UPASS | passwd --stdin $UNAME >/dev/null 2>&1
done
}
Userdel(){
USERLIST=user.list
cat $USERLIST | while read UNAME UPASS
do
    grep -q -w $UNAME $PASSWD && userdel -r $UNAME \
    && echo "[DELETE] $UNAME" \
    || echo "[ FAIL ] $UNAME"
done
}
while true
do
    clear
    Menu
    echo -n "Select Menu : "
    read CHOICE
    case $CHOICE in
        1) echo ;
           echo -n "Enter how many you create wants : "
           read WANTS
           case $WANTS in
               *[0-9]*) Useradd ;;
               *) echo "Wrong choice. Please try again" ;;
           esac ;
           echo ;
           Goback ;;
        2) echo ;
           Userverify ;
           echo ;
           Goback ;;
        3) echo ;
           Userdel ;
           echo ;
           Goback ;;
        4) echo ;
           echo "Goodbye" ;
           sleep 1.2 ;
           clear ;
           break ;;
        *) echo "Wrong choice. Please select(1,2,3,4) again"
           sleep 1.2 ; continue ;;
    esac
done
=========================================================
10. 



















