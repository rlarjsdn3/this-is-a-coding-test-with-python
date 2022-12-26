// 1로 만들기.swift (p.217)

import Foundation

// 정수 x 입력 받기
let x: Int = Int(readLine()!)!

// 앞서 계산된 결과를 저장하기 위한 DP 테이블 초기화
var d: [Int] = [Int](repeating: 0, count: 30_001)

// 다이내믹 프로그래밍 진행(바텀업)
for i in 2...x {
    // 현재의 수에서 1을 빼는 경우
    d[i] = d[i - 1] + 1
    
    // 현재의 수가 2로 나누어 떨어지는 경우
    if i % 2 == 0 {
        d[i] = min(d[i], d[i / 2] + 1)
    }
    
    // 현재의 수가 3으로 나누어 떨어지는 경우
    if i % 3 == 0 {
        d[i] = min(d[i], d[i / 3] + 1)
    }
    
    // 현재의 수가 5로 나누어 떨어지는 경우
    if i % 5 == 0 {
        d[i] = min(d[i], d[i / 5] + 1)
    }
}
print(d[x]) // 결과값 출력
