//2. 고정점 찾기 - p. 368

import Foundation

func findFixedPoint(array: [Int], start: Int, end: Int) -> Int {
    if start <= end {
        let mid: Int = (start+end) / 2
        
        if array[mid] == mid {
            return mid
        } else if array[mid] < mid {
            return findFixedPoint(array: array, start: mid+1, end: end)
        } else {
            return findFixedPoint(array: array, start: start, end: mid-1)
        }
    }
    
    return -1
}

let n: Int = Int(readLine()!)!
let array: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

print(findFixedPoint(array: array, start: 0, end: array.count-1))
