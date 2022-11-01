#6. 자물쇠와 열쇠 - p.325

import Foundation

func rotateAMatrix90Degree(_ key: [[Int]]) -> [[Int]] {
    let n: Int = key.count
    var newKey: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: key.count), count: key.count)
    
    for i in 0..<n {
        for j in 0..<n {
            newKey[i][j] = key[j][n-i-1]
        }
    }
    
    return newKey
}

func check(_ newLock: [[Int]]) -> Bool {
    let n: Int = newLock.count / 3
    
    for i in n..<(n*2) {
        for j in n..<(n*2) {
            if newLock[i][j] != 1 {
                return false
            }
        }
    }
    
    return true
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let n: Int = lock.count
    let m: Int = key.count
    var newKey: [[Int]] = key
    var newLock: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n*3), count: n*3)
    for i in n..<n*2 {
        for j in n..<n*2 {
            newLock[i][j] = lock[i%n][j%n]
        }
    }
    
    for _ in 0..<4 {
        newKey = rotateAMatrix90Degree(newKey)
        
        for i in 0...(n*2) {
            for j in 0...(n*2) {
                for x in 0..<m {
                    for y in 0..<m {
                        newLock[i+x][j+y] += newKey[x][y]
                    }
                }
                
                if check(newLock) {
                    return true
                }
                
                for x in 0..<m {
                    for y in 0..<m {
                        newLock[i+x][j+y] -= newKey[x][y]
                    }
                }
            }
        }
    }
    
    return false
}

print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 1], [1, 1, 1]]))
