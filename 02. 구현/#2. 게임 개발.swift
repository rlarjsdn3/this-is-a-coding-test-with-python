#2. 게임 개발 - p. 118

import Foundation

var input: [Int]
input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let N: Int = input[0]
let M: Int = input[1]

input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let A: Int = input[0]
let B: Int = input[1]
let D: Int = input[2]

var map: [[Int]] = []
for _ in stride(from: 0, to: N, by: 1) {
    map.append(readLine()!.components(separatedBy: " ").map { Int(String($0))! })
}

var visited: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

var direction: Int = 0
let move: [(x: Int, y: Int)] = [(-1, 0), (0, 1), (1, 0), (0, -1)]

var xy: (x: Int, y: Int) = (A, B)
var dxy: (x: Int, y: Int)

func turnLeft(_ direction: inout Int) {
    direction -= 1
    if direction == -1 {
        direction = 3
    }
}

var count: Int = 1
var turnTime: Int = 0
while true {
    turnLeft(&direction)
    dxy = (xy.x+move[direction].x, xy.y+move[direction].y)
    if map[dxy.x][dxy.y] == 0 && visited[dxy.x][dxy.y] == 0 {
        xy = dxy
        count += 1
        turnTime = 0
        visited[dxy.x][dxy.y] = 1
        continue
    } else {
        turnTime += 1
    }
    
    if turnTime == 4 {
        dxy.x = xy.x - move[direction].x
        dxy.y = xy.y - move[direction].y
        
        if map[dxy.x][dxy.y] == 0 {
            xy = dxy
        } else {
            break
        }
        
        turnTime = 0
    }
}

print(count)
