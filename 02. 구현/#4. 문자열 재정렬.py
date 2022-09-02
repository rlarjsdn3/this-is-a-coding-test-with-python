#4. 문자열 재정렬 - p. 322

data = input()
value = 0
result = []

for d in data:
    if d.isalpha():
        result.append(d)
    else:
        value += int(d)

if value != 0:
    result.append(str(value))

print(''.join(result))
