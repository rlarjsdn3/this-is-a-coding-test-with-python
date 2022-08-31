#1. 왕실의 나이트 - p. 115

input_data = input()
row = int(input_data[1])
columns = int(int(ord(input_data[0])) - ord('a') + 1)

steps = [(1, 2), (1, -2), (-1, 2), (-1, -2), (2, 1), (2, -1), (-2, 1), (-2, -1)]
count = 0

for step in steps:
    next_row = row + step[0]
    next_columns = columns + step[1]
    if next_row<1 or next_columns<1 or next_row>8 or next_columns>8:
        continue
    
    count += 1
    
print(count)
