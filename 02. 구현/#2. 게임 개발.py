#2. 게임 개발 - p. 118

# N, M을 공백으로 입력
n, m = map(int, input().split())

# 현재 캐릭터의 X좌표, Y좌표와 방향을 공백으로 입력
x, y, direction = map(int, input().split())

# 전체 맵 정보 입력받기
array = []
for _ in range(n):
    array.append(list(map(int, input().split())))
    
# 방문 여부를 확인하는 리스트 d 선언
d = [[0] * m for _ in range(n)]
d[x][y] = 1 # 시작 위치는 방문으로 처리

# 북, 서, 남, 동 방향 정의
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]

# 왼쪽으로 회전
def turn_left():
    global direction
    direction -= 1
    if direction == -1:
        direction = 3

# 시뮬레이션 시작
count = 1
turn_time = 0
while True:
    # 현재 방향을 기준으로 왼쪽 방향으로 회전
    turn_left()
    nx = x + dx[direction]
    ny = y + dy[direction]
    if d[nx][ny]==0 and array[nx][ny]==0:
        d[nx][ny] = 1
        x = nx
        y = ny
        count += 1
        turn_time = 0
        continue
    # 회전한 이후 정면에 가보지 않은 칸이 없거나 바다인 경우
    else:
        turn_time += 1
        
    # 네 방향으로 모두 갈 수 없는 경우
    if turn_time == 4:
        nx = x - dx[direction]
        ny = y - dy[direction]
        # 뒤로 갈 수 있다면 이동하기
        if array[nx][ny] == 0:
            x = nx
            y = ny
        # 뒤가 바다로 막혀 있는 경우
        else:
            break
        turn_time = 0

print(count)    
