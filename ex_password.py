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