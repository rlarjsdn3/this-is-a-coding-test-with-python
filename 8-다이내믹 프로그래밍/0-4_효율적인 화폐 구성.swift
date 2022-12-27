// 효율적인 화폐 구성.swift (p.226)

import Foundation

// 정수 N과 M 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])
// N개의 화폐 단위 입력 받기
var array: [Int] = []
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

// 한 번 계산된 결과를 저장하기 위한 DP 테이블 초기화
var d: [Int] = [Int](repeating: 10_001, count: m + 1)

// 다이내믹 프로그래밍 진행(바텀업)
d[0] = 0
for i in 0..<n {
    for j in stride(from: array[i], through: m, by: 1) {
        if d[j - array[i]] != 10_001 { // (i-k)원을 만든느 방법이 존재하는 경우
            d[j] = min(d[j], d[j - array[i]] + 1)
        }
    }
}

// 계산된 결과 출력
if d[m] == 10_001 { // m원을 만드는 방법이 없는 경우
    print(-1)
} else {
    print(d[m])
}
