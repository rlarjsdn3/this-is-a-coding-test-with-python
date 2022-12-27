// 바닥 공사.swift (p.223)

import Foundation

// 정수 N 입력 받기
let n: Int = Int(readLine()!)!

// 앞서 계산도니 결과를 저장하기 위한 DP 테이블 초기화
var d: [Int] = [Int](repeating: 0, count: 1_001)

// 다이내믹 프로그래밍 진행(바텀업)
d[1] = 1
d[2] = 3
for i in 3...n {
    d[i] = (d[i - 1] + 2 * d[i - 2]) % 796_796
}

// 계산된 결과 출력
print(d[n])
