# 03. 1이 될 때까지(complex) - p. 99

n, k = map(int, input().split())

count = 0
while True:
    target = n%k
    count += target
    n -= target
    if n<k:
        break
    n //= k
    count += 1
    
print(count-1)
