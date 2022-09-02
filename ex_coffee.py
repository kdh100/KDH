class Coffeemachine:
	total_amount = 10
	total_amount_money = 5000
	coffee_price = 300
	put_price = 0
	req_coffee_nums = 0

	# 돈, 커피 개수 요청
	def request(self):
		self.put_price = int(input("돈을 넣어주세요 : "))
		self.req_coffee_nums = int(input("원하는 커피 개수를 입력하세요 : "))

	# 사용자 커피, 잔돈 제공
	def get(self):
		price = self.coffee_price * self.req_coffee_nums
		# 커피 요청이 너무 많은 경우
		if self.req_coffee_nums > self.total_amount:
			print("요청하신만큼 커피가 남아있지 않습니다.")
			return False
		# 넣은 돈이 충분한 경우
		elif self.put_price >= price:
			change = self.put_price - price
			# 잔돈이 없는 경우
			if change == 0:
				print("커피 %d 개 드립니다. 잔돈은 없습니다." % self.req_coffee_nums)
			# 잔돈이 남은 경우
			else:
				print("커피 %d 개 드립니다." % self.req_coffee_nums)
				print("잔돈 %d 원 드립니다." % change)
				self.total_amount_money -= change
			self.total_amount -= self.req_coffee_nums
		# 넣은 돈이 부족한 경우
		else:
			print("넣으신 돈이 부족합니다. 넣으신 돈 %d 원 반환합니다." % self.put_price)
			return False

	# 커피머신 상태 정보
	def info(self):
		if self.total_amount <= 0:
			print("커피가 부족합니다.")
			return False
		elif self.total_amount_money <= 0:
			print("현금이 부족합니다.")
			return False
		else:
			print("*" * 28)
			print("현재 커피는 %d 개 남았습니다." % self.total_amount)
			print("현재 현금은 %d 원 남았습니다." % self.total_amount_money)
			print("*" * 28)
			return True

Pill = Coffeemachine()
while True:
	if Pill.info():
		Pill.request()
		if Pill.get():
			pass
		else:
			print("커피머신을 종료합니다. 관리자에게 문의하세요.")
			break
	else:
		print("커피머신을 종료합니다. 관리자에게 문의하세요.")
		break