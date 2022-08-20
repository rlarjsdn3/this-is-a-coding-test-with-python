n, m, k = map(int, input().split())
data = list(map(int, input().split()))

data.sort()
first = data[n-1]
second = data[n-2]

sum = 0
for i in range(1, m+1):
    if i%k==0:
        sum += second
        continue
    sum += first
    
print(sum)