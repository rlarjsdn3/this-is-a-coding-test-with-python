//0-2. 떡볶이 떡 만들기 - p. 201

import Foundation

let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n: Int = input[0]
let m: Int = input[1]
let array: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

var start: Int = 0
var end: Int = array.max()!

var result: Int = 0
while start <= end {
    var total: Int = 0
    var mid: Int = (start+end) / 2
    for x in array {
        if x > mid {
            total += (x - mid)
        }
    }
    
    if total < m {
        end = mid - 1
    } else {
        result = mid
        start = mid + 1
    }
}

print(result)
