# 04. 모험가 길드 - p. 311

n = int(input())
data = list(map(int, input().split()))
data.sort()

result = 0 # 총 그룹의 수
count = 0 # 현재 그룹에 포함된 모험가의 수

for a in data:
    count += 1
    if count >= a:
        result += 1
        count = 0
    
print(result)
