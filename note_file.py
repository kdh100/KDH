!# 주석
"""
# 뒤의 단일 문장은 주석 처리
' 혹은 " 3개의 중간에 들어간 장문의 문장은 주석 처리
"""

!# Variable
"""
변수 값을 다중 할당할 수 있으나 권장 하지는 않음(ex_ a = b = c = 1)
"""

lighter = 1000
cigarette = 4500
price = lighter + cigarette
print(price)

a = 'daddy'  # 문자는 ' 혹은 " 으로 묶어서 표시
b = 'mommy'
c = 'baby'
d = 'bear'
e = 'fat'
f = 'thin'
g = 'cute'
print(a, d, 'is', e)  # 문자를 붙여서 출력 시 , 혹은 + 기호 사용
print(b, d, 'is', f)
print(c, d, 'is so', g)

!# Input/Output

print('life' 'is' 'too short')
print("life" "is" "too short")
print("life" + "is" + "too short")
print("life", "is", "too short")

for i in range(10):
    print(i, end=' ')  # 변수 끝에(end) 공백(' ') 추가

print("a\tb\tc\t")  # \t 는 수평 Tab, \n 은 줄바꿈
print("a\nb\nc\n")

name = input("Enter your name: ")  # 입력 되는 모든 것을 문자열(str) 취급
print(name)

print("Press any key ....")
input()

menu = """
    1. Attack
    2. Defence
    3. Change
    4. Quit 
"""
print(menu)
choice = input("Enter you number : ")
print(choice)

!# String

fruit = 'banana'
print(fruit[0])  # 0번 글자
print(fruit[1])  # 1번 글자
print(fruit[2:4])  # 2번부터 4번 앞(3번)까지
print(fruit[:3])  # 처음 부터 3번 앞(2번)까지
print(fruit[3:])  # 3번부터 끝까지
print(fruit[-1])  # 왼쪽 에서 부터 첫번째
print(fruit[-3:])  # 왼쪽 세번째 부터 마지막 까지
print(fruit[:-3])  # 처음 부터 왼쪽 세번째 까지

x = 'banner'
x = 'n' + x[1:]  # n 문자와 x 의 두번째 부터 끝의 문자의 합

print("I eat %s apples." % "five")  # % 뒤 정의된 문자(string)을 %s 에 입력

name1 = 'Mr.Kim'
name2 = 'Miss.Lee'
a = 32
b = 28
print('%d' % a)
print("%d + %d = %d" % (a, b, a + b))
print("%s and %s were married." % (name1, name2))

txt = "I love apples, apple are my favorite fruit"
print(txt.count("apple", 10, 24))  # 10번 부터 24번 사이에 문자 개수

txt = "Hello, welcome to my world."
print(txt.find("c", 5, 11))  # 5번 부터 11번 사이의 c 문자 위치

txt = "Python is best language."
print(txt.index('b'))  # 문자열 내 b 문자 위치

txt = "Life is too short."
print(txt.split())  # 문자열 내 단어 나누기

seperator = ","  # 구분자 지정
print(seperator.join('abcd'))  # 문자 열에 구분자 대입
print(','.join('abcd'))

print("".join(['a', 'b', 'c', 'd']))  # List, Tuple 입력 시 문자만 반환
print("".join({'id': 'root', 'passwd': 'centos'}))  # Dict 입력 시 key 반환

a = 'hi'
print(a.upper())  # 문자 열 대문자 지정
print('hello world'.upper())

b = 'HEY'
print(b.lower())
print('LInUX'.lower())  # 문자 열 소문자 지정

print(' hi '.lstrip())  # 왼쪽 공백 혹은 지정 문자 제외
print(' hi '.rstrip())  # 오른쪽 공백 혹은 지정 문자 제외
print(' hi '.strip())  # 양쪽 공백 혹은 지정 문자 제외

txt = "banana,,,ssaaww..."
print(txt.rstrip(",.asw"))  # 제외 대상 문구가 반복 시작된 지점 부터 제외됨
print(txt.strip(",.as"))

a = "My Life is beautiful."
print(a.replace("beautiful", "Unpredictable"))  # 문자 변경

print(len("Life is good"))  # 공백 포함 문자 길이(개수)
print(len(['apple', 'orange', 'cherry']))  # List 아이템 개수
print(len({'name': 'Bourne', 'callsign': 'Jason'}))  # Dict Key 개수

Moon = """
My fellow Koreans, I am grateful to you all. I bow my head in deep appreciation
for the choice of you‚ the people. Today‚ serving as President in the 19th
presidential term of the Republic of Korea, I take the first step toward
new Korea. My shoulders are now burdened with heavy mandates entrusted
to me by the people‚ and my heart is burning with enthusiasm to create 
the kind of country that we have never been able to live in before. 
My head is now filled with blueprints for ushering in a new world 
characterized by unity and coexistence.
"""

print(Moon.count("Korea"))
print(Moon.index('K'))
list_moon = Moon.split()
print(list_moon)
print(' '.join(list_moon))
print(Moon.replace('Korea', 'Corea'))

mysrting = "hello world"
print("mystring's length =", len(mysrting))
print("mystring's length = %s" % len(mysrting))

my_resolution = '1920x1080'
print('width =', my_resolution[0:4])
print('height =', my_resolution[5:])
data = my_resolution.split('x')
print('width =', data[0])
print('height =', data[1])

companies = ['NAVER', 'KAKAO', 'SK', 'SAMSUNG']
print(";".join(companies))

companies = '000660;060310;0133340;095570;068400;006840'
codes = companies.split(';')
print(codes)

code = '          000660              '
print(code.strip())

webpage = "http://www.naver.com/edit/page/7022"
data = webpage.split('/')
web = data[2].split('.')
print('domain:', web[2])

!# List

a = [1, 2, 3]
a.append(4)  # 추가하기
print(a)

input_list = [1, 2, 3]
output_list = []
for i in input_list:  # output_list = [i*i for i in input_list]
    output_list.append(i * i)
print(output_list)

a = [1, 4, 2, 3]
a.sort()  # 오름차순(ascending) 정렬
a.sort(reverse=True)  # 내림차순(descending) 정렬
a.reverse()  # 반대로 정렬

a = ['APPLE', 'LG', 'SAMSUNG']
a.index('SAMSUNG')  # 리스트 내 인덱스(위치) 확인

a = [1, 2, 3]
a.insert(0, 4)  # 리스트의 첫번째(0) 자리에 4 삽입

set1 = ['apple', 'grape', 'tomato', 'banana', 'tomato']
set1.remove('tomato')  # 첫번째 매칭되는 요소만 삭제

set2 = ['apple', 'grape', 'tomato', 'banana', 'tomato']
del set2[2]  # 인덱스 요소 삭제
del set2  # 리스트 삭제  # $.clear() : 리스트 비우기

set3 = ['apple', 'grape', 'tomato', 'banana', 'tomato']
set3.pop()  # 마지막 요소 return + 삭제
set3.pop(2)  # 인덱스 요소 return + 삭제

set4 = ['짱구', '훈이', '철이', '짱구', '훈이', '맹구']
set4.count('훈이')        # 리스트 내 문자 총 개수 확인

set5 = ['짜장면', '짬뽕', '탕수육']  # 리스트에 새로운 리스트 요소 추가
set5.extend(['군만두', '물만두'])  # iterable(List, Tuple, Dictionary)만 추가

list.a = [1, 2, 3]
list.a.append([4, 5])   # [1, 2, 3, [4, 5]]
list.a.extend([4, 5])   # [1, 2, 3, 4, 5]

num = [1, 2, 3, 4, 5]
time = [x**2 for x in num]  # Comprehension 형식으로 다른 리스트 만들기
print(time)
even = [x**2 for x in num if x % 2 == 0]
print(even)

camp = {'red': 1, 'blue': 2, 'green': 3}
rank = {party for party, num in camp.items() if num == 3}
rank2 = {party: num for party, num in camp.items()}

noodle = ['짜장면', '짬뽕', '우동', '기스면']
meal = ['짜장밥', '짬뽕밥', '볶음밥']
setmenu = [['탕수육', '짜장면', '짜장면'], ['탕수육', '잡채', '물만두']]

noodle.append('간짜장')
print(noodle)

noodle.remove('우동')
print(noodle)

noodle.insert(2, '사천짜장')
print(noodle)

menu = noodle + meal
print(len(menu))

noodle.sort(reverse=True)   # 가나다라 순으로 문자 정렬
meal.sort(reverse=True)
print("Meals = ", meal)
print("Noodles = ", noodle)

setmenu.append(['탕수육', '고추잡채', '짬뽕'])
print(setmenu)

order = ['potato', ['pizza', 'coke', 'salad'], 'ham']
print(order[1])
print(order[1][1], order[2])

family = ['mother', 'father', 'gentleman', 'lady']
print(len(family))
print(family[1])
family.remove('gentleman')
print(family)

portlist = [21, 22, 25, 53, 443, 80]
portlist.sort()
pos = portlist.index(80)
print("There are " + str(pos) + " port to scan before 80.")

movie = [{'염력': (23.6, 5.5), '그것만이 내 세상': (20.6, 8.8), '코코': (15.6, 8.8)}]

numbers = [1, 2, 3, 4, 5, 6, 7]
print('min :', min(numbers))    # 최소값
print('max :', max(numbers))    # 최대값
print('Avg :', sum(numbers)/len(numbers))   # 합산값

data = ['a', 'b', 'c', 'd', 'e']
data = tuple(data)  # 리스트 타입을 튜플로 전환
print(data)

items = ['000600', '034560', '003540', '039490']
myitems = ";".join(items)
print(myitems)

plaintext = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
plaintextsize = len(plaintext)  # 전체 길이 파악
ciphertext_list = []  # 암호화 하려는 리스트 생성
for i in range(plaintextsize):  # 전체 길이를 조건 구문 인자로 선택(1~26)
    index = (i + 3) % plaintextsize  # +3 된 인자를 나눈 나머지 값이 index
    ciphertext_list.append(plaintext[index])  # 암호 리스트에 index 문자 추가
ciphertext = ''.join(ciphertext_list)  # 추가된 문자를 공백 제외 후 조합
print(ciphertext)

!# Tuple

"""
리스트와 동일하지만 인자 변경이 불가하여 읽기 전용 데이터 형식이다.
"""

def magu_print(x, y, *rest):  # *rest 를 사용해 나머지 인자 값을 튜플 형식으로 처리
    print(x, y, rest)
magu_print(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

alpha = ['a', 'b', 'c']
number = [1, 2, 3]
list(zip(alpha, number))  # 각 index 에 매칭되는 인자들을 묶어서 리스트화

a = 10
b = 20
a, b = b, a  # 자료 치환
print(a, b)

!# Dictionary

"""
인자들의 순서가 상관 없으며 인덱스 기능을 사용 하지 못하고, 중복 인자가 불가하다.
"""

a = {1: 'a'}
a[2] = 'b'  # Dict Key + Value 추가, [$] 의 $ 는 Key 값
a['name'] = 'pey'
a[3] = [1, 2, 3]  # 순서 상관 없이 추가됨
del a[2]  # Dict 요소 삭제

a.keys()  # Dict 내 Key 값만 출력
a.values()  # Dict 내 Value 값만 출력
a.items()  # Dict 내 Item(Key + Value) 출력
a.clear()  # Dict 요소 모두 삭제

b = {'name': 'bourne', 'phone': '01012345678', 'birth': '05051991'}
print(b['name'])  # Key 값을 이용한 Value 확인 (= b.get('name'))
print(b.get('phonenumber', '01098765432'))  # $dict.get(x, default) 형식으로 default 값을 대신 불러옴
print('name' in a)  # Key 값이 Dict 내 있는지 확인(True/False)

c = {'a': '100', 'b': '200', 'c': '300'}
c.update({'c': '500', 'd': '1000'})  # Dict 업데이트로 기존 Key 의 Value 변경 및 신규 Key 추가 가능
print(c)
print(list(c.items())[1])  # Dict 내 아이템을 리스트화 하여 그 중 2번째 아이템을 출력

a = {'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5}
result = []
for item in a.items():
    if item[1] == 4:  # Dict 아이템 중 value 값이 4 와 같으면
        result.append(item[0])  # 새로운 리스트에 Dict 아이템의 Key 값을 추가
        # result = [key for (key, value) in a.times() if value == 4]
print(result)

encbook = {'A': 'F', 'B': 'G', 'C': 'H', 'D': 'I', 'E': 'J', 'F': 'K', 'G': 'L',
           'H': 'M', 'I': 'N', 'J': 'O', 'K': 'P', 'L': 'Q', 'M': 'R', 'N': 'S',
           'O': 'T', 'P': 'U', 'Q': 'V', 'R': 'W', 'S': 'X', 'T': 'Y', 'U': 'Z',
           'V': 'A', 'W': 'B', 'X': 'C', 'Y': 'D', 'Z': 'E'}
decbook = {}
for i in encbook:
    decbook[encbook[i]] = i  # Key 의 Value 를 Key 로 설정하고 해당 Value 를 대입했던 Key 로 지정 등록
    # decbook = {value: key for (key, value) in encbook.items()}
print(decbook)

icecream = {'Melona': [1000, 10], 'Pollapo': [1200, 7], 'Ppangpare': [1800, 6],
            'Tankboy': [1200, 5], 'Heathunting': [1200, 4], 'Worldcorn': [1500, 3]}

ex1 = [key for (key, value) in icecream.items() if value[1] == 7]
ex2 = [(key, value[1]) for (key, value) in icecream.items() if value[0] == 1200]

print(ex1)  # Value 의 index 인자에 매칭되는 Key 추출
print(ex2)  # Key 와 Value 의 index 인자 추출
print(icecream['Worldcorn'][1])  # Key 를 통한 Value 의 index 인자 추출

!# Set

"""
사전 데이터와 동일하지만 인자값 변경을 위해선 리스트나 튜플 데이터로 변경 후 진행해야한다.
"""

s1 = {1, 2, 3, 4, 5, 6}
s2 = {4, 5, 6, 7, 8, 9}
print(s1 & s2)  # 교집합
print(s1.intersection(s2))

print(s1 | s2)  # 합집합
print(s1.union(s2))

print(s1 - s2)  # 차집합
print(s1.difference(s2))

l1 = [1, 2, 3, 4, 5, 1, 2, 3]
print(set(l1))  # 집합 전환 시 항목 내 중복 인자 삭제됨

s1 = {'apple', 'banana', 'cherry'}
s2 = {'google', 'microsoft', 'apple'}
s1.add('apple')  # 집합 내 중복 인자 추가 안됨
print(s1)  # 집합 내 인자는 순서 상관 없음
s1.update(s2)
print(s1)

!# True & False 조건구문

"""
데이터 형식에서는 값이 없으면 거짓, 값이 있으면 참이다.
숫자에서는 0 이 거짓, 1 이 참이다.
"""

if []:
    print('True')
else:
    print('False')

!# 데이터 형식 변환

"""
input() 함수는 입력 받은 값을 문자로 인식해 숫자와 비교할 수 없지만, int() 함수를 사용해
데이터 형식을 숫자로 변경하면 비교할 수 있게 된다.
"""

# 산술 연산자

"""
일반적인 산술 연산자 외 %(나머지), //(몫), **(제곱) 을 사용한다.
"""

# 비교 연산자

"""
== 는 같다, != 는 같지않다 외 >, <=, <, <= 을 사용한다.
"""

# 할당 연산자(복합 연산자)

"""
산술 연산자로 계산된 값을 동시에 지정하는 복합 연산을 나타내는 연산자다.
x -= y 일 경우, x = x - y 와 같은 의미다.
"""

# 비트 연산자

"""
2진수의 비트(bit) 가 8개가 모여있는(= 8비트) 1개의 바이트를 기준으로 계산되는 연산자다.
(a = 60, b = 13 이라 가정)
- & : AND 연산, 둘 다 참인 값(= 공통적으로 참이 되는 값)
(a & b) = 12 (해석) 0011 1100(60) & 0000 1101(13) = 0000 1100(12)
- | : OR 연산, 둘 중 하나라도 참인 값(= 둘 다 참이 되는 값)
(a | b) = 0011 1101(61)
- ^ : XOR 연산, 둘 중 하나만 참인 값(= 개별적으로 참이 되는 값)
(a ^ b) = 49(0011 0001)
- ~ : 보수 연산, 거짓인 값으로 2진수를 실수 계산하지않고 원본 변수값의 보수로 변환된다.
(~a) = 1100 0011(-61)
- << : 왼쪽 이동(Shift) 연산, 변수값을 왼쪽으로 지정한 비트 수 만큼 이동한 값
a <<2 = 1111 0000(240)
- >> : 오른쪽 이동(Shift) 연산, 변수값을 오른쪽으로 지정한 비트 수 만큼 이동한 값
a >>2 = 0000 1111(15)
"""

# 논리 연산자

"""
논리적인 계산을 하는 연산자다.
(a = True, b = False 라 가정)
- and : 논리 AND 연산, 둘 다 참이면 참
(a and b) = False
- or : 논리 OR 연산, 둘 중 하나라도 참이면 참
(a or b) = True
- not : 논리 NOT 연산, 논리 연산을 반전
not(a and b) = True
"""

!# if(조건문)

"""
intend 주의, 조건문 끝 콜론 빼먹지 말기
boolean 의 경우 맞으면 T, 틀리면 F
value 의 경우 0 이 아니거나 공백이 아니면 T, 0 또는 공백이면 F
"""

food_flavor = "sweet"
if food_flavor == "sweet":
    print("swallow")
else:
    print("spit")

age = 21
if age >= 18:
    print('운전 가능')
else:
    print('운전 불가능')

filename = ['intra.h', 'intra.c', 'iput.txt', 'run.py']
result = []
for i in filename:
    if i.split('.')[1] == 'h' or i.split('.')[1] == 'c':
        result.append(i)
print(result)

number = []
num1 = input('input num1 : ')
number.append(int(num1))  # int(num) 데이터로 리스트에 추가해야 연산자 가능
num2 = input('input num2 : ')
number.append(int(num2))
print(number)
maxnum = max(number)
print(maxnum)
if maxnum % 2 == 0:
    print('even number')
else:
    print('odd number')

score = input('score: ')
if 100 >= int(score) >= 81:  # if 연산에서 사용할 수 있도록 int 데이터로 변환
    print('grade is A')
elif 80 >= int(score) >= 61:
    print('grade is B')
elif 60 >= int(score) >= 41:
    print('grade is C')
elif 40 >= int(score) >= 21:
    print('grade is B')
elif 20 >= int(score) >= 0:
    print('grade is E')
else:
    print('Err: out of range')

j = input('주민등록번호 : ')
jj = j.split('-')
ident = jj[1]
region = int(ident[1:3])

if 1 or 3 == ident[0]:
    print('성별 : 남자')
if 64 >= region >= 56:
    print('지역 : 전라남도')
else:
    print('다른 지역 주민입니다.')

j = input('주민등록번호 : ')
first = int(j[0])*2 + int(j[1])*3 + int(j[2])*4 + \
        int(j[3])*5 + int(j[4])*6 + int(j[5])*7 + \
        int(j[7])*8 + int(j[8])*9 + int(j[9])*2 + \
        int(j[10])*3+ int(j[11])*4+ int(j[12])*5
second = first % 11
last = 11 - second

if last == int(j[13]):
    print("valid")
else:
    print("invalid")

!# for(반복문)

"""
정해져 있는 범위(순서형 자료; list, tuple, dictionary.(key(), value(), items()), set(list())) 사용 구문
"""

for i in range(10):  # range(0, 10) 과 동일  # range(0, 10, 2) = 0, 2, 4, 6, 8
    print(i)  # 한 줄에 하나씩
    print(i, end="")  # 한 줄에 전부

marks = [90, 25, 67, 45, 80]
number = 0
for mark in marks:
    number += 1
    if mark >= 60:
        print('%d 번 학생: 합격' % number)
    else:
        print('%d 번 학생: 불합격' % number)
for number in range(len(marks)):  # 리스트 항목 개수를 범위로 지정 하여 해당 값을 인자로 사용
    if marks[number] < 60: continue
    print("%d 번 학생: 합격" % (number+1))

!# while(반복문)

i = 1
while i <= 10:
    if i == 9: break  # if 조건에 맞을 경우 아래 행동 멈춤
    print(i)
    i += 1

i = 1
while i <= 10:
    i += 1
    if i % 2 == 1: continue  # if 조건에 맞을 경우 아래 행동 계속
    print(i, end=" ")

treehit = 0
while treehit < 10:
    treehit += 1
    print("나무를 %d번 찍었습니다." % treehit)
    if treehit == 10:
        print("나무가 넘어갑니다.")
for treehit in range(1, 11):  # 1번 부터 시작 하여 총 11개의 인자값(0~10) 범위 중
    print("나무를 %d번 찍었습니다." % treehit)
    if treehit == 10:
        print("나무가 넘어갑니다.")

prompt = """
1. add
2. del
3. list
4. quit

"""
number = 0
while number != 4:
    print(prompt)
    number = int(input("Enter number : "))

left_coffee = 5     # 남은 커피 수
left_money = 2000   # 남은 돈
coffee_price = 300  # 커피 한개의 가격
needs = 0           # 사용자가 커피를 살 때 필요한 돈
while True:
    input_money = int(input("돈을 넣으세요. : "))
    input_coffee_num = int(input("커피 개수를 입력하세요.: "))
    needs = coffee_price * input_coffee_num
    # 1) 커피 살 돈을 충분히 넣은 경우
    if input_money >= needs:
        # 거스름 돈 = 입력한 돈 - 필요한 돈
        output_left_money = input_money - needs
        # 줄 커피 개수 = 고객이 입력한 거피 개수
        output_coffee = input_coffee_num
        # 커피 자판기에 남은 커피 개수 = 남은 커피 개수 - 고객이 요청한 커피 개수
        left_coffee = left_coffee - input_coffee_num
        # 커피 자판기에 남은 돈 = 남은 돈 - 커피 살 돈
        left_money = left_money - output_left_money
    # 2) 커피 살 돈을 부족하게 넣은 경우
    elif input_money < needs:
        lack_of_money = needs - input_money
        print("커피 살 돈이 부족합니다. %d 만큼 더 넣어 주세요.\n" % lack_of_money)
        continue
    # 사용자에게 주어야 하는 부분
    print("커피를 %d개 줍니다. 그리고 거스름 돈은 %d입니다." % (output_coffee, output_left_money))
    # 자판기의 상태를 나타내는 부분
    print("+--------------------------------")
    print("| 남은 커피 수량: %d" % left_coffee)
    print("| 남은 돈: %d" % left_money)
    print("+---------------------------------\n")
    # 커피 자판기의 남은 돈이나 남은 커피의 양이 부족한 경우 몽땅 돌려주기
    if left_money < 0 or left_coffee < 0:
        print("+---------------------------------------------------")
        print("| 커피 자판기에는 남은 돈이 없거나 남은 커피가 없습니다.")
        print("| 관리자에게 문의 하세요.")
        print("+----------------------------------------------------")
        print("넣은 돈을 몽땅 돌려 드릴께요. : %d" % input_money)
        break

encbook = {'a': '#', 'p': 's', 'l': '?', 'e': 'k'}
decbook = {}  # {(v: k) for (k, v) in encbook.items()}
for k in encbook:
    v = encbook[k]
    decbook[v] = k
print('encbook :', encbook)
print('decbook :', decbook)

pets = ['dog', 'cat', 'parrot', 'squirrel', 'goldfish']
for x in pets:
    print("%s : %d" % (x, len(x)))  # 문자열, 숫자형 데이터 인자를 % 뒤에서 두 개 이상 불러올 수 있다.

for i in range(31):
    if i % 3 == 0:
        print(i, end=" ")

gugudan = input("구구단을 외우자 : ")
for i in range(1, 10):
    print("%d X %d = %d" % (int(gugudan), i, int(gugudan)*i))

gugudan = input("구구단을 외우자 : ")
for i in range(1, 10):
    if i % 2 == 1:
        print("%d X %d = %d" % (int(gugudan), i, int(gugudan)*i))

sum = 0
for i in range(1, 11):
    sum += i
    print(sum)

current_passwd = 1004
failed_count = 0
while failed_count <= 5:
    input_passwd = input("패스워드를 입력하세요 : ")
    if int(input_passwd) == current_passwd:
        print("환영합니다.")
        break
    elif input_passwd != current_passwd:
        failed_count += 1
        if failed_count == 4:
            print("추가 오류 시 시스템이 종료됩니다. 신중히 입력하세요.")
        elif failed_count == 5:
            print("다중 실패로 시스템이 종료됩니다. 관리자에게 문의하세요.")
            break
        else:
            print("잘못된 패스워드입니다. 다시 입력하세요.")

orders = {'101': {'milk': 1, 'yogurt': 5},  # {key0:{key1:value}}
          '102': {'milk': 2},
          '103': {'milk': 1, 'yogurt': 10},
          '104': {'yogurt': 15}}
# 버전1
for i in orders:
    if orders[str(i)].get('milk'):  # index 구문과 중복되어 key0 을 문자로 선언, key0의 key1의 value 로드
        print("%s 호 milk : %s" % (i, orders[str(i)]['milk']))
# 버전2
for (ho, order) in orders.items():  # key0 과 key1 을 분리시킴
    if order.get('milk'):
        print("%s 호 milk : %s" % (ho, order['milk']))

for i in range(2000, 2051):
    if i % 4 == 2:
        print(i)

file_lists = ['hello.py', 'ex01.py', 'ex02.py', 'ch02.py', 'intro.hwp']
# 버전1
for x in file_lists:
    result_lists.append(x.split('.')[0])
print(result_lists)
# 버전2
for file_list in file_lists:
    print(file_list.split(".")[:-1])

dongs = ['201동', '202동', '203동']
rooms = ['101호', '102호', '201호', '202호', '301호', '302호', '401호', '402호']
for x in dongs:
    for y in rooms:
        print(x + " " + y)

citys = ['seoul', 'daejeon', 'kimpo', 'suncheon', 'pusan']
tmp = []
long_citys = []
short_citys = []
for x in citys:
    tmp.append(len(x))
for y in citys:
    if len(y) == max(tmp): long_citys.append(y)
    elif len(y) == min(tmp): short_citys.append(y)
    else: pass
for z in long_citys:
    print("Long Name City : " + z)
print("Short Name City :", end=" ")  # 출력 종료 후 아래 조건문 출력이 이어서 출력
for z in short_citys:
    print(z, end= " ")
print("\n")

!# Function(함수)

def sum_many(choice, *args):  # 변수 지정, *args : tuple 형식, **kwargs : dict 형식
    if choice == "sum":
        result = 0
        for i in args:
            result = result + i        # result += i
    elif choice == "mul":
        result = 1
        for i in args:
            result = result * i        # result *= i
    return result  # 함수 출력에 대한 입력은 return 으로 처리
result = sum_many('sum', 1, 2, 3, 4, 5)  # 인자(혹은 인수)
print(result)
result = sum_many('mul', 1, 2, 3, 4, 5)
print(result)

def say_myself(name, old, man=True):
    print("이름은 %s 입니다." % name)
    print("나이는 %d 살입니다." % old)
    if man:
        print("남자입니다.\n")
    else:
        print("여자입니다.\n")
say_myself("chan", 13)  # default 값이 함수에 매개 변수로 지정되어 있어 입력으로 지정하지 않아도 자동 출력
say_myself("chan", 13, True)
say_myself("chan", 13, False)

a = 1
# 함수가 선언된 다음부턴 지역 변수로 동작하여 상단의 변수는 해당되지 않음
def test(a):
    a += 1
    print(a)
test(3)
# 함수의 종료 후 전역 변수를 찾아보고 출력
print(a)

def test(a):
    a += 1
    return a
a = 1
a = test(a)  # 전역 변수를 함수의 지역 변수로 지정
print(a)

def say_nick(nick):
	if nick == "바보":
		print("비속어 사용 금지")
		return  # return 값이 없으면 함수 종료
	print("나의 별명은 %s 입니다." % nick)
say_nick('야호')
say_nick('바보')

capt = 'meverick'
def airforce(a):
    print(a, "reader = ", capt)  # 전역 변수를 함수 내 변수로 사용
airforce('alpha')

def ban():
	global e  # 전역 변수를 함수 내에서 선언
	e = 10
	print('e = ' , e)
ban()

def function(x):
	a = 3
	b = 5
	y = a * x + b  # 함수(y)에 함수(x)를 입력
	return y
c = function(10)
print(c)

def countdown(n):
    if n == 0:
        print("Blastoff!")
    else:
        print(n)
        countdown(n - 1)  # return 으로 종료되지 않았기 때문에 함수 조건에 맞을 때 까지 반복 사용
countdown(3)

import sys  # 모듈 사용을 위해 외장 함수 import
def communication(first):
    if   first == '011' : tel='SKT'  # 앞의 연산값에 대하여 참일 경우 : 뒤에서 지역 변수 지정
    elif first == '016' : tel='KT'
    elif first == '019' : tel='LGT'
    elif first == '010' : tel='UNKNOWN'
    else: return  # 함수 if 조건 종료
    return tel  # 함수 작동 시 결과값
phone_number = input("휴대전화번호 입력: ")
first = phone_number.split('-')[0]
comm = communication(first)
if   comm == 'SKT'   : print('당신은 %s 사용자입니다.' % comm)
elif comm == 'KT'    : print('당신은 %s 사용자입니다.' % comm)
elif comm == 'LGT'   : print('당신은 %s 사용자입니다.' % comm)
elif comm == 'UNKNOWN': print('당신의 통신사는 알수 없습니다.')
else: sys.exit(1)  # import 된 sys 함수 사용하여 정상 종료

# 1차 로또생성기(반복구문)
import random
lottos = []  # 로또 범위
lotto_choices = []  # 로또 당첨번호
for i in range(1, 46):  # 1 ~ 45 개의 숫자
    lottos.append(i)
for j in range(1, 7):  # 총 6개의 당첨 번호
    random.shuffle(lottos)  # 무작위로 로또 범위 리스트를 섞음
    lotto_choices.append(lottos.pop())  # 위에서 섞인 리스트에서 마지막 인자를 뽑아 로또 당첨번호에 추가
    lotto_choices.sort()  # 완성된 무작위 당첨번호를 보기좋게 정렬
for k in lotto_choices:
    print(k, end=" ")  # 행으로 로또 번호 나열

# 2차 로또생성기(함수)
import random
def lotto_number(max_choice):
    lottos = []
    lotto_choices = []
    for i in range(1, 46):
        lottos.append(i)
    for j in range(1, max_choice + 1):  # 로또 당첨번호의 개수를 전역에서 함수 입력값으로 받아옴
        random.shuffle(lottos)
        lotto_choices.append(lottos.pop())
    for k in lotto_choices:
        print(k, end=" ")
lotto_number(6)

!# 람다 함수(한 줄 짜리 함수)

x = lambda a, b: a * b
print(x(2, 4))

results = map(lambda x: (x * x), (0, 1, 2, 3))
print(list(results))  # 맵 함수의 결과값을 리스트형 자료로 출력해야 확인할 수 있음

keytable = map(lambda x: (chr(x+65), x), range(26))
encbook = dict(keytable)
#decbook = {v: k for k, v in encbook.items()}
decbook = {}
for k, v in encbook.items():
    decbook[v] = k
print(decbook)

"""
다양한 내장 함수
- abs() : 숫자의 절대값 리턴
- all() : 반복자료(list,tuple) 중 모두 참일때만 True 리턴
- any() : all() 의 반대, 자료 중 모두 거짓일때만 False 리턴
- round() : 소수 -> 10진수 반올림하여 리턴
- bin() : 10진수 -> 2진수 변환 리턴
- oct() : 정수 -> 8진수 변환 리턴
- hex() : 정수 -> 16진수 변환 리턴
- chr() : ASCII 숫자코드 -> 문자 변환 리턴
- ord() : 문자 -> ASCII 숫자코드 변환 리턴
- ascii : ASCII 숫자코드를 포함, 입력받은 인자를 human-readable 문자열로 변환 리턴
- dir() : 객체가 가지고있는 자체적인 변수나 함수를 리턴
- divmod(a, b) : 2개의 숫자 입력, //(몫), %(나머지) 를 tuple 형태로 리턴
- enumerate(iterable) : 순서자료(list,tuple) 입력, (인덱스, 인자) 형태로 리턴
- eval() : 실행가능한 하나의 문자열 표현(ex_ 1+2, 'hi' + 'a')을 입력, 결과값 리턴
- exec() : 실행가능한 여러개의 문자열 표현을 입력, 결과값 리턴
- filter(func, iterable) : (함수, 반복자료) 입력, 입력 함수에 반복자료의 요소가 입력된 결과가 참인 값 리턴
- id() : 객채의 고유 주소값(reference) 리턴
- input() : 사용자 입력을 받아 객체화, 문자열 입력 시 prompt 로 출력
- int() : 문자열 형태의 숫자, 소수 등을 정수로 리턴
- isinstance(object, class) : object 가 class 의 instance 가 맞으면 True 리턴
- iter() : iterable object 를 리턴
- len() : object 의 요소 전체 개수를 리턴
- map(func, iterable) : (함수, 자료) 입력, 입력 함수에 자료 요소를 인자값으로 보냄
- max(iterable) : 반복자료 입력, 최대값 리턴
- min(iterable) : 반복자료 입력, 최소값 리턴
- pow(x, y) : x 의 y 제곱 결과 리턴
- range(start(생략가능), stop, step(생략가능)) : 숫자 입력, 해당 범위 값을 iterable 객체로 리턴
- sorted(iterable) : 입력값 정렬 후 결과 리턴
  # sort 는 리턴이 저장되지 않지만, sorted 는 리턴이 저장된다.
- sum() : 입력값 모두 더하기
- type(object) : 입력값의 자료형 지정
- zip(iterable*) : 동일 개수로 이루어진 자료형을 인덱스에 맞게 묶어서 리턴
- open(filename, mode) : (파일이름, 모드) 입력, 파일 객체 리턴
  # 파일을 생성하거나, 파일을 열때 사용하는 함수다.
    - (객체) = open("파일이름", "w") : 새로운 파일 생성하고 새로 쓰기
    - (객체).write(파일내용) : 새로운 파일에 들어갈 파일 내용 추가
    - (객체).close() : 새로운 파일 쓰기 종료
    - (객체) = open("파일이름", "r") : 파일 읽기
    - (객체).read() : 파일의 모든 문자열을 읽어 객체에 저장
    - (객체).readline() : 파일의 첫번째 줄을 읽어 객체에 저장
        # read, readline 의 괄호 안에 숫자 입력시 해당 문자열까지만 읽음
    - (객체).readlines() : 파일의 모든 줄을 읽어 각각의 줄을 요소로 객체에 저장 
        # readlines 의 결과는 리스트 형식의 데이터로 인덱스를 이용해 문자열 추출 가능(ex_ [0][0:5])
    - os.remove(filename) : 위에서 생성한 파일을 삭제할 때 사용 
  # 모드 생략시 기본값으로 읽기전용,텍스트 모드로 파일 생성 후 리턴
  # 모드 종류 :
    -b : binary
    -t : text(default)
    -r : read(default)
    -w : write(새로 쓰기)
    -a : append write(추가 쓰기)
    -x : empty(null)
"""
"""
다양한 기본 외장 함수
- sys.
- pickle.
- os.
- shutil.
- glob.
- temfile.
- time.
- calendar.
- random.
- webbrowser.
"""

!# Module(모듈) == Code Library

"""
모듈은 함수, 변수 또는 클래스들을 모아 놓은 파일이다.
1) 미리 만들어진 모듈과 2) 사용자 정의 모듈이 있으며, 다른 파이썬 프로그램에서 불러들여 사용할 수도 있다.
모듈을 설치(적용) 하기 위해서는 import 해야하는데 선언 방법은 다음과 같다.
- import $MD
- import $MD, $MD, ... (not recommended)
- import $MD.$SUBMD
- import $MD as $ALIAS
- from $MD import $VAR|$FUNC
또한 이렇게 적용한 모듈을 삭제하고 싶을 땐,
- del $MD
혹은 적용시킨 모듈을 다시 불러와야 할 땐,
- reload $MD
"""

# 'mymodule.py' 라는 신규 파일에 아래 내용이 있다고 가정
# Object Declaration
person = {"name": "John", "age": "28", "Contry": "Korean"}
# Variable Declaration
man = True
# Function Declaration
def myfun(a, b):
    return a + b

# 위에서 만들어진 파일을 작업하고 있는 현재 파일(환경)에 import 시켜 불러와서 쓸 수 있음
import mymodule
people = mymodule.person["age"]
gender = mymodule.man
marry = mymodule.myfun(28, 32)

from mymodule import person, man
people = person["age"]  # 내 전역 변수 혹은 함수처럼 직접 끌어다 쓸 수 있다
gender = man

!# sys module

"""
파이썬 해석기가 제공하는 변수, 함수를 제어할 수 있는 방법을 제공한다.
- sys.ps1 : 대화형 프롬프트
- sys.argv : 프로그램 인자
- sys.exit : 프로그램 종료
- sys.path : 모듈 경로
- sys.platform : 파이썬 플랫폼
- sys.version : 파이썬 버전
"""

import sys
sys.path.append("/root/mymod")  # 모듈 경로 추가

!# os module

"""
OS 를 제어할 수 있는 방법을 제공한다.
- os.environ : 시스템 환경변수 확인
- os.chdir() : 디렉토리 위치 변경
- os.getcwd() : 현재 작업 디렉토리 확인
- os.listdir() : 디렉토리 위치 리스트
- os.system() : 시스템 명령어 호출
"""

!# glob module

"""
- glob.glob($DIR/$FILE) : 디렉토리 내 모든 파일들을 읽어서 리턴한다. 
"""

!# tempfile module

"""
- tempfile.mktemp() : 중복되지 않는 임시 파일의 이름을 무작위로 만들어서 리턴한다.
"""

!# time module

"""
시간과 관련된 모듈이다.
- time.time() : 1970.01.01 00:00:00 기준, 지난 시간을 초 단위로 리턴한다.(= UNIX TIME)
- time.strftime() : 시간 출력 형식을 지정한다.
 # %c : 날짜, 시간 출력
 # %x : 설정된 로케일 기반 날짜 출력
 # %X : 설정된 로케일 기반 시간 출력
 # %Z : 시간대 출력
- time.sleep() : 일정한 시간동안 대기한다.
"""

!# re module

"""
정규표현식을 사용하기 위한 모듈이다.
- 이스케이프 기호
 # \\ : 역슬래시
 # \d : 숫자
 # \D : 문자
 # \s : 공백
 # \S : 데이터
 # \w : 숫자 또는 문자
 # \W : 숫자 또는 문자가 아닌 것
 # \A : 문자열 처음
 # \Z : 문자열 마지막
- 플래그
 # I : 대소문자 구별하지 않는다.
 # M : ^ 가 문자열 맨 처음, 라인의 맨 처음에 매치된다.
 # X : 공백은 무시한다.
- re.complie(pattern[, 플래그]) : 패턴을 컴파일하여 정규식 객체 리턴
- re.match(pattern, string[, 플래그]) : 문자열의 처음부터 정규식과 매치되는지 확인
- re.search(pattern, string[, 플래그]) : 문자열 전체 검색하여 정규식과 매치되는지 확인
- re.split(pattern, string[, maxsplit=0]) : 패턴을 구분자로 문자열 분리하여 리스트로 리턴
- re.findall(pattern, string[, 플래그]) : 정규식과 매치되는 모든 문자열 리스트로 리턴
"""

!# random module

"""
무작위 값을 출력해준다.
- random.random() : 랜덤값 출력한다.
- random.randrange() : 지정된 범위에서 랜덤값 출력한다.
- random.shuffle() : 순서형 자료를 랜덤으로 섞어준다. 
- random.choice() : 아무 원소나 하나 뽑아준다.
"""

!# Class(분류) & Instance(객체; Object)

"""
class 는 instance 들의 공통점에 대한 정의다.
mothod 는 class 안에서 정의된 함수를 뜻한다.
- class $NAME:
- instance = class()
- instance.method
 # 클래스 안의 함수(메소드)는 self 가 항상 첫번째 패러미터
   = 현재 class 의 instance 를 참고
"""

class Singer:
    def sing(self)
        return "Lalala"
teaji=Singer()
print(teaji.sing())
ricky=Singer()
print(ricky.sing())

class MyClass:
    x = 5
print(MyClass)
p1=MyClass()
print(p1.x)  # class 안에서 정의된 변수도 메소드처럼 사용해서 불러옴

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    def myfun(self):
        print("hello, my name is " + self.name)
        print("i'm %d years old." % self.age)

p1=Person("John", 42)  # instance(p1) 안에 name, age 값을 입력
p1.myfun()  # instance(p1) 안에 class(Person) 로부터 학습한 메소드(myfun) 를 사용
p1.age = 29  # instance(p1) 안에 'self.age = age' 값을 변경
del p1.age  # instance(p1) 안에 __init__ 로 정의된 메소드의 내부 인자값 중 age 를 삭제
del p1  # instance 삭제

class Sorceress:  # 직업 정의
    str = 5
    dex = 10
    vit = 15
    erg = 30
    def attack(self):  # 공격 기술을 정의
        return '=> iceorb'
    def levelup(self):  # 레벨업 할 때 상승되는 스탯 증감폭 정의
        self.str += 1
        self.vit += 4

!# Parent(부모) & Child(자식) Class

class Myself:  # parent class 선언
    def __init__(self, fname, lname):
        self.firstname = fname
        self.lastname = lname
    def printname(self):
        print(self.firstname, self.lastname)
x = Myself("Dongha", "Kim")
x.printname()

class Clone(Myself):  # child class 선언; 나는 부모로부터 내용을 상속받아 이미 내용이 있다.
    pass  # 상속받은 것 외에 추가적인 선언이 필요없다면 패스하겠다.

x = Clone("Mayor", "John")
x.printname()
