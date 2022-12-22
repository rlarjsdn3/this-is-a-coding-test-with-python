//2_연구소 - p.341

import Foundation

// 연구소의 크기 N과 M 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])

// 연구소 지도 정보 입력 받기
var data: [[Int]] = []
for _ in 0..<n {
    data.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var temp: [[Int]] = [[Int]](repeating: [Int](repeating: m, count: 0), count: n) // 연구소 임시 지도 정보를 저장한 배열 변수

// 깊이 우선 탐색(DFS)을 이용해 각 바이러스가 사방으로 퍼지도록 하기
func virus(x: Int, y: Int) {
    // 4가지 이동 방향을 저장한 변수 (상, 하, 좌, 우)
    let dxy: [(x: Int, y: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    for i in 0..<4 {
        let nxy: (x: Int, y: Int) = (x + dxy[i].x, y + dxy[i].y)
        
        // 상, 하, 좌, 우 중에서 바이러스가 퍼질 수 있는 경우
        if nxy.x >= 0 && nxy.x < temp.count && nxy.y >= 0 && nxy.y < temp[0].count {
            // 해당 위치가 바이러스가 퍼질 수 있는 빈 공간인 경우
            if temp[nxy.x][nxy.y] == 0 {
                // 해당 위치에 바이러스를 배치
                temp[nxy.x][nxy.y] = 2
                virus(x: nxy.x, y: nxy.y)
            }
        }
    }
}

// 바이러스가 퍼진 후 연구소에서 안전 영역의 크기를 계산하는 함수
func getScore(_ graph: [[Int]]) -> Int {
    var score: Int = 0
    for x in 0..<graph.count {
        for y in 0..<graph[x].count {
            if graph[x][y] == 0 {
                score += 1
            }
        }
    }
    return score
}

// 깊이 우선 탐색(DFS)을 이용해 울타리를 설치하면서, 매번 안전 영역의 크기를 계산
var result: Int = 0
func dfs(_ count: Int) {
    var count: Int = count
    
    // 벽이 3개 설치된 경우
    if count == 3 {
        temp = data
        
        // 각 바이러스의 위치에서 전파 진행
        for i in 0..<n {
            for j in 0..<m {
                if temp[i][j] == 2 {
                    virus(x: i, y: j)
                }
            }
        }
        
        result = max(result, getScore(temp))
        return
    }
    
    // 빈 공간에 울타리 설치 (DFS 홯용)
    for i in 0..<n {
        for j in 0..<m {
            // 해당 지점에 벽이 설치되지 않은 경우
            if data[i][j] == 0 {
                data[i][j] = 1 // 벽 설치
                count += 1 // 카운팅 증가
                dfs(count)
                data[i][j] = 0 // 벽 제거
                count -= 1 // 카운팅 감소
            }
        }
    }
}

dfs(0)
print(result)
