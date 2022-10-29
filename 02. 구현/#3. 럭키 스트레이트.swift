import Foundation

let n: String = readLine()!
var sum: Int = 0

for i in 0..<(n.count/2) {
    sum += Int(String(n[n.index(n.startIndex, offsetBy: i)]))!
    sum -= Int(String(n[n.index(n.startIndex, offsetBy: i+(n.count/2))]))!
}

print(sum==0 ? "LUCKY" : "READY")
