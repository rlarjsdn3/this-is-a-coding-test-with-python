# 03. 1이 될 때까지(simple) - p. 99

n, k = map(int, input().split())
count = 0

while n > 1:
    while n%k != 0:
        n -= 1
        count += 1
    n //= k
    count += 1

print(count)
