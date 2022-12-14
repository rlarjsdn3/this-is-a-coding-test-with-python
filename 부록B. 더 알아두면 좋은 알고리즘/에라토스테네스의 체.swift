import Foundation

let n: Int = 1000 // 2부터 1,000까지의 모든 수에 대하여 소수 판별
var array: [Bool] = [Bool](repeating: true, count: n + 1) // 처음엔 모든 수가 소수(True)인 것으로 초기화(0과 1은 제외)

// 에라토스테네스의 체 알고리즘
for i in 2...Int(sqrt(Double(n))) { // 2부터 n의 제곱근까지의 모든 수를 확인하며
    if array[i] { // i가 소수인 경우(남은 수인 경우)
        // i를 제외한 i의 모든 배수를 지우기
        var j: Int = 2
        while i * j <= n {
            array[i * j] = false // 소수가 아니라고 표시
            j += 1
        }
    }
}

// 모든 소수 출력
for i in 2...1000 {
    if array[i] {
        print(i, terminator: " ")
    }
}
