import Foundation

let n: Int = Int(readLine()!)!
var count: Int = 0

for i in 0...n {
    for j in 0..<60 {
        for k in 0..<60 {
            if (String(i)+String(j)+String(k)).contains("3") {
                count += 1
            }
        }
    }
}

print(count)
