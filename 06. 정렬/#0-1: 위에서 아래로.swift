//0-1: 위에서 아래로 - p. 178

import Foundation

let n: Int = Int(readLine()!)!
var array: [Int] = []
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

print(array.sorted(by: >).map { String($0) }.joined(separator: " "))
