

n, m, k = map(int, input().split())
data = list(map(int, input().split()))

data.sort()
first = data[n-1]
second = data[n-2]

result = (first*k+second) * (m//(k+1))
result += first * (m%(k+1))
    
print(result)