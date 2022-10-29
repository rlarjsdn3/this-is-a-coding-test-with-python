#3. 럭키 스트레이트 - p. 321

score = input()
sum = 0

len = len(score)//2
for i in range(0, len):
    sum += int(score[i])
    sum -= int(score[i+len])

if sum == 0:
    print('LUCKY')
else:
    print('READY')
