//1. 정렬된 배열에서 특정 수의 개수 구하기 - p. 367

import Foundation

func countByValue(_ target: Int, array: [Int], start: Int, end: Int) -> Int {
    var first: Int = first(target, array: array, start: start, end: end)
    var last: Int = last(target, array: array, start: start, end: end)
    if (first+last) < 0 {
        return -1
    }
    
    return first - last + 1
}

func first(_ target: Int, array: [Int], start: Int, end: Int) -> Int {
    if start <= end {
        let mid: Int = (start+end) / 2
        
        if (mid == 0 || array[mid-1] < target) && (array[mid] == target) {
            return mid
        } else if array[mid] < target {
            return first(target, array: array, start: mid+1, end: end)
        } else {
            return first(target, array: array, start: start, end: mid-1)
        }
    }
    
    return -1
}

func last(_ target: Int, array: [Int], start: Int, end: Int) -> Int {
    if start <= end {
        let mid : Int = (start+end) / 2
        
        if (mid == array.count-1 || array[mid+1] > target) && (array[mid] == target) {
            return mid
        } else if array[mid] < target {
            return last(target, array: array, start: mid+1, end: end)
        } else {
            return last(target, array: array, start: start, end: mid-1)
        }
    }
    
    return -1
}

let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n: Int = input[0]
let m: Int = input[1]
let array: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }

let start: Int = 0
let end: Int = array.count - 1

print(countByValue(m, array: array, start: start, end: end))
