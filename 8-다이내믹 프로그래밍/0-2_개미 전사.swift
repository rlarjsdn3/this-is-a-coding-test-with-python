// 개미 전사.swift (p.221)

import Foundation

// 정수 n 입력 받기
var n: Int = Int(readLine()!)!
// 모든 식량 정보 입력 받기
let array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

// 앞서 계산된 결과를 저장하기 위한 DP 테이블 초기화
var d: [Int] = [Int](repeating: 0, count: 100)

// 다이내믹 프로그래밍 진행(바텀업)
d[0] = array[0]
d[1] = max(array[0], array[1])
for i in 2..<n {
    d[i] = max(d[i - 1], d[i - 2] + array[i])
}
print(d[n - 1]) // 결과값 출력
