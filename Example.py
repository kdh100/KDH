# 커피 자판기

coffee = 5
while True:
    if not coffee:
        print("커피가 다 떨어졌습니다. 판매를 중지 합니다.")
        break
    money = int(input("돈을 넣어 주세요: "))
    if money == 300:
        print("커피를 줍니다.")
        coffee -= 1
    elif money > 300:
        print("거스름돈 %d를 주고 커피를 줍니다." % (money - 300))
        coffee -= 1
    else:
        print("돈을 다시 돌려주고 커피를 주지 않습니다.")

    print("남은 커피의 양은 %d개 입니다." % coffee)

# 패스워드

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
