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
var array1: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
array1.sort()

n = Int(readLine()!)!
var array2: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

for x in array2 {
    let r: Int = binarySearch(x, array: array1, left: 0, right: array1.count-1)
    if r != -1 {
        print("yes", terminator: " ")
    } else {
        print("no", terminator: " ")
    }
}
