//0-2. 성적이 낮은 순서로 학생 출력하기 - p. 180

import Foundation

let n: Int = Int(readLine()!)!
var students: [(name: String, score: Int)] = []
for _ in 0..<n {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    students.append((input[0], Int(input[1])!))
}
students.sort { $0.score > $1.score }

students.forEach { print($0.name, terminator: " ") }
