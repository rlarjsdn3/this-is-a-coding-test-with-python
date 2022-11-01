#0-1. 부품 찾기 - p.197

import Foundation

func binarySearch(_ target: Int, array: [Int], left: Int, right: Int) -> Int {
    if left > right {
        return -1
    }
    
    var mid: Int = (left+right) / 2
    if target == array[mid] {
        return mid
    } else if target < array[mid] {
        return binarySearch(target, array: array, left: 0, right: mid-1)
    } else {
        return binarySearch(target, array: array, left: mid+1, right: right)
    }
}

var n: Int = Int(readLine()!)!
var array: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
array.sort()

n = Int(readLine()!)!
var x: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

for e in x {
    let r: Int = binarySearch(e, array: array, left: 0, right: array1.count-1)
    if r != -1 {
        print("yes", terminator: " ")
    } else {
        print("no", terminator: " ")
    }
}
