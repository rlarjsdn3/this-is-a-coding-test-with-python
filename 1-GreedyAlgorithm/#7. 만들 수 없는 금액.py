# 07. 만들 수 없는 금액 - p. 314

n = int(input())
data = list(map(int, input().split()))
data.sort()

target = 1
for x in data:
    if target<x:
        break
    target += x
    
print(target)
