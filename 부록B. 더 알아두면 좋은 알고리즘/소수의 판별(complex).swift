import Foundation

func isPrimeNumber(_ x: Int) -> Bool {
    // 2부터 x의 제곱근까지의 모든 수를 확인하며
    for i in 2...Int(sqrt(Double(x))) {
        // x가 해당 수로 나누어 떨어진다면
        if x % i == 0 {
            return false // 소수가 아님
        }
    }
    return true // 소수임
}

print(isPrimeNumber(4))
print(isPrimeNumber(7))
