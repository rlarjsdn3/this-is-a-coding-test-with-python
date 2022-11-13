//0-3. 두 배열의 원소 교체 - p. 182

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let k: Int = input[1]
var a: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var b: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

a.sort()
b.sort(by: >)

for i in 0..<k {
    if a[i] < b[i] {
        a[i] = b[i]
    }
}
print(a.reduce(0, +))
