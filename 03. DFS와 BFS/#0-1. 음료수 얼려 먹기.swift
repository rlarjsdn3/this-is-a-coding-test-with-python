//0-1. 음료수 얼려 먹기 - p. 149

import Foundation

// N과 M을 공백으로 구분하여 입력받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let m: Int = input[1]

// 2차원 배열의 맵 정보 입력받기
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(Array(readLine()!).map { Int(String($0))! })
}

// DFS로 특정한 노드를 방문한 뒤에 연결된 모든 노드들도 방문
@discardableResult
func dfs(x: Int, y: Int) -> Bool {
    // 주어진 범위를 벗어나는 경우에는 즉시 종료
    if x <= -1 || x >= n || y <= -1 || y >= m {
        return false
    }
    
    // 현재 노드를 아직 방문하지 않았다면
    if graph[x][y] == 0 {
        // 해당 노드 방문 처리
        graph[x][y] = 1
        // 상, 하, 좌, 우의 위치도 모두 재귀적으로 호출
        dfs(x: x - 1, y: y)
        dfs(x: x, y: y - 1)
        dfs(x: x + 1, y: y)
        dfs(x: x, y: y + 1)
        return true
    }
    
    return false
}

var result: Int = 0
for i in 0..<n {
    for j in 0..<m {
        if dfs(x: i, y: j) {
            result += 1
        }
    }
}
print(result)
