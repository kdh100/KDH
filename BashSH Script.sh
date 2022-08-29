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
=======================================================================
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
=======================================================================
10. 사용자 관리v2
=======================================================================
#!/bin/bash
#   You can manage general users
#   It can add, verify, delete users and also exit this script
#   Not select exit, script will shows endlessly
#   This Script will updates contiunally
#   So, if any notice or ideas, please contact vataltrick@gmail.com :)

export PASSWD=/etc/passwd

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
echo "(Verify a Users)"
awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd | nl
}

Useradd(){
echo "(Create a User)"
echo -n "Enter user's name : "
read NAME
grep -w $NAME $PASSWD >/dev/null 2>&1
if [ $? -eq 0 ] ; then
useradd $NAME
echo $NAME | passwd --stdin $NAME >/dev/null 2>&1
cat << EOF
===============================
$NAME has successfully created!
===============================
EOF
else
cat << EOF
============================
$NAME account alreay exists!
============================
EOF
fi
}

Userdel(){
echo "(Delete a User)"
echo -n "Enter user's name : "
read NAME
grep -w $NAME $PASSWD >/dev/null 2>&1
if [ $? -eq 0 ] ; then
userdel -r $NAME
cat << EOF
===============================
$NAME has successfully deleted!
===============================
EOF
else
cat << EOF
========================================
Wrong User Name Choose. Please try again
========================================
EOF
fi
}

while true
do
    clear
    Menu
    echo -n "Select Menu : "
    read CHOICE
    case $CHOICE in
        1) echo ;
           Useradd ;
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
=======================================================================
11. 서비스 점검
====================================================================
#!/bin/bash

MAIN=/test/main.example.com.txt
SRV1=/test/server1.example.com.txt
DIFF=/test/diffservice.txt

systemctl -t service | \
sed -n '2,/^LOAD/p' | sed '$d' | \
awk '{print $1, $3}' | grep -v '●' > /test/main.example.com.txt

ssh server1 systemctl -t service | \
sed -n '2,/^LOAD/p' | sed '$d' | \
awk '{print $1, $3}' | grep -v '●' > /test/server1.example.com.txt

diff $MAIN $SRV1 > /test/diffservice.txt

echo "+==============[ Main ]==============+"
cat $DIFF | fgrep '<' | cut -c2-
echo "+====================================+"

echo "+============[ Server1 ]============+"
cat $DIFF | fgrep '>' | cut -c2-
echo "+===================================+"
====================================================================
12. 보고서 점검
===================================================
#!/bin/bash

F_LIST=/root/vscode/bin/file_list.txt
# /root/vscode/bin/file_list.txt
# cp /etc/passwd /etc/hosts /etc/group /root/vscode/bin
T_FILE=/tmp/tmp1
F_RESULT=/root/vscode/bin/result.`date +'%m%d'`

> $F_RESULT

for F_NAME in `cat $F_LIST`
do
    if [ -f $F_NAME.orig ] ; then
        diff $F_NAME $F_NAME.orig > $T_FILE
        if [ -s $T_FILE ] ; then
            echo "[ WARN ] : $F_NAME" >> $F_RESULT
            cp $F_NAME $F_NAME.orig
        else
            echo "[  OK  ] : $F_NAME" >> $F_RESULT
        fi
    else
        cp $F_NAME $F_NAME.orig
    fi
done

if grep WARN $F_RESULT > /dev/null 2>&1 ; then
    echo "WARNNING"
else
    echo "OK"
fi
===================================================
13. 자동 telnet & ftp
======================================================
#!/bin/bash

BASEDIR=/root/vscode/bin
FILE=$BASEDIR/server.list

CMD(){
sleep 2; echo "$NAME"
sleep 1; echo "$PASS"
sleep 3; echo 'tar czf /tmp/$(hostname).tar.gz /home'
sleep 1; echo 'exit'
}

cat $FILE | while read HOST NAME PASS
do
    # auto telnet
    CMD | telnet $HOST
    # auto ftp
    ftp -n $HOST << EOF
    user $NAME $PASS
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mget *.example.com.tar.gz
    bye
EOF
done
======================================================
14. SSH 원격 파일 이동
==================================================================
#!/bin/bash

if [ $# -ne 3 ] ; then
    echo "Usage: $0 <put|get> <filename> <directory>"
    exit 1
fi

ACT=$1
SRC=$2
DST=$3
export FILE=/root/vscode/bin/server.list

Usage(){
echo "Usage: copy.sh <put|get> <filename> <directory>"
exit 2
}

Multi_Put(){
    for i in $(cat $FILE)
    do
        echo "====== $i ======"
        scp $SRC $i:$DST
        echo ; echo
    done
}

Multi_Get(){
    for i in $(cat $FILE)
    do
        [ -d "$DST" ] && DEST=$DST/$(basename $(echo $SRC)).$i \
                      || DEST=$DST.$i
        echo "====== $i ======"
        scp $i:$SRC $DEST
        echo ; echo
    done
}

case $ACT in
    put) Multi_Put ;;
    get) Multi_Get ;;
    *) Usage ;;
esac
==================================================================
15. SSH 원격 명령어 실행
==========================================
#!/bin/bash

if [ $# -eq 0 ] ; then
    echo "Usage: $0 <CMD>"
    exit 1
fi

export FILE=/root/vscode/bin/server.list

for i in $(cat $FILE)
do
    echo "====== $i ======"
    ssh $i $*
    echo ; echo
done
==========================================
16. 파일 확장자 변경
=======================================================================
#!/bin/bash

if [ $# -ne 3 ] ; then
    echo "Usage: $0 <directory> <src_extension> <dst_extension>"
    exit 1
fi

D_WORK=$1
SRC_EXT=$2
DST_EXT=$3
T_FILE=/tmp/.tmp1

ls -1 $D_WORK | grep ".$SRC_EXT\$" > $T_FILE
for FILE in `cat $T_FILE`
do
    TRANS=$(echo $D_WORK/$FILE | sed "s/.'$SRC_EXT'\$/.'$DST_EXT'/g")
    mv $D_WORK/$FILE $TRANS
done
=======================================================================
17. 자동 마운트



























