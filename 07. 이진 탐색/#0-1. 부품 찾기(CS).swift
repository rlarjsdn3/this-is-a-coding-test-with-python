//0-1. 부품 찾기 - p. 197

import Foundation

var n: Int = Int(readLine()!)!
var array: [Int] = [Int](repeating: 0, count: 1_000_001)

for i in readLine()!.components(separatedBy: " ") {
    array[Int(i)!] = 1
}

n = Int(readLine()!)!
var x: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

for e in x {
    if array[e] == 1 {
        print("yes", terminator: " ")
    } else {
        print("no", terminator: " ")
    }
}
