MAX = 5
sum = 0
avg = 0.0
med = 0
num = [0] * MAX
for i in range(0, MAX):
    num[i] = int(input())
    sum += num[i]
    
num.sort()
avg = int(sum / MAX)
med = num[MAX//2]

print(avg)
print(med)