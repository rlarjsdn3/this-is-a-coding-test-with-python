import Foundation

let s: String = readLine()!
var sum: Int = 0
var result: [String] = []

for d in s {
    if d.isLetter {
        result.append(String(d))
    } else {
        sum += Int(String(d))!
    }
}

result.sort()
result.append(String(sum))
print(result.joined())
