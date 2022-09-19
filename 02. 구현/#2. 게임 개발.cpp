// 2. 게임 개발 - p. 118

#include <iostream>
using namespace std;

// 왼쪽으로 회전
void turnLeft(int &direction) {
    if(direction == 3) direction = 0;
    else direction += 1;
}

int main(void) {
    int n, m;
    int x, y, direction;

    cin >> n >> m;
    cin >> x >> y >> direction;
    int **field = new int*[n];
    for(int i=0; i<n; i++) {
        field[i] = new int[m];
        for(int j=0; j<m; j++) {
            cin >> field[i][j];
        }
    }

    int **visited = new int*[n];
    for(int i=0; i<n; i++) {
        visited[i] = new int[m]{};
    }

    //                 북, 동, 남, 서
    int moveToX[4] = {  -1, 0, 1, 0 };
    int moveToY[4] = { 0, 1, 0, -1 };

    // 시뮬레이션 시작
    int count = 1;
    int turnTime = 0;
    visited[x][y] = 1;
    while(true) {
        // 왼쪽으로 회전
        turnLeft(direction);
        int nx = x + moveToX[direction];
        int ny = y + moveToY[direction];

        // 회전한 이유 정면에 가보지 않은 칸이 존재하는 경우 이동
        if(field[nx][ny]==0 && visited[nx][ny]==0) {
            visited[nx][ny] = 1;
            x = nx;
            y = ny;
            count += 1;
            turnTime = 0;
            continue; 
        // 회전한 이후 정면에 가보지 않은 칸이 없거나 바다인 경우
        } else {
            turnTime += 1;
        }

        // 네 방향 모두 갈 수 없는 경우
        if(turnTime == 4) {
            nx = x - moveToX[direction];
            ny = y - moveToX[direction];
            // 뒤로 갈 수 있다면 이동하기
            if(field[nx][ny] == 0) {
                x = nx;
                y = ny;
            // 뒤가 바다로 막혀 있는 경우
            } else {
                break;
            }

            turnTime = 0;
        }
    }

    // 정답 출력
    cout << count << endl;

    return 0;
}

