//0-1. 부품 찾기 - p. 197

import Foundation

var n: Int = Int(readLine()!)!
var array: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

n = Int(readLine()!)!
var x: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

for e in x {
    if array.contains(e) {
        print("yes", terminator: " ")
    } else {
        print("no", terminator: " ")
    }
}
