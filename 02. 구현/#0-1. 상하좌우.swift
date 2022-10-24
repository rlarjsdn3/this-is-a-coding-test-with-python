import Foundation

let n: Int = Int(readLine()!)!
let plans: [String] = readLine()!.components(separatedBy: " ")

var result: (x: Int, y: Int) = (1, 1)
let moveType: [String] = ["L", "R", "U", "D"]
let moveToXY: [(x: Int, y: Int)] = [(0, -1), (0, 1), (-1, 0), (1, 0)]

for plan in plans {
    var nx = 0, ny = 0
    for i in 0..<moveType.count {
        if plan==moveType[i] {
            nx = result.x + moveToXY[i].x
            ny = result.y + moveToXY[i].y
        }
    }
    
    if nx<1 || ny<1 || nx>n || ny>n {
        continue
    }
    
    result.x = nx
    result.y = ny
}

print("\(result.x) \(result.y)")
