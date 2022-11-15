//1. 국영수 - p. 359

import Foundation

let n: Int = Int(readLine()!)!
var students: [(name: String, kor: Int, eng: Int, math: Int)] = []
for _ in 0..<n {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    students.append((input[0], Int(input[1])!, Int(input[2])!, Int(input[3])!))
}

students.sort {
    if $0.kor == $1.kor {
        if $0.eng == $1.eng {
            if $0.math == $1.math {
                return $0.name < $1.name
            }
            return $0.math > $1.math
        }
        return $0.eng < $1.eng
    }
    return $0.kor > $1.kor
}

students.forEach { print($0.name) }
