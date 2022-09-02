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