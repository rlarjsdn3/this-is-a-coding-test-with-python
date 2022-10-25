import Foundation

let input: String = readLine()!
let row: Int = Int(String(input[input.index(after: input.startIndex)]))!
let column: Int = Int(input[input.startIndex].asciiValue!)
                                    - Int(Character("a").asciiValue!) + 1

let steps: [(x: Int, y: Int)] = [
    (1, 2), (-1, 2), (1, -2), (-1, -2), (2, 1), (-2, 1), (2, -1), (-2, -1)
]

var count: Int = 0
for step in steps {
    var nextPosition: (x: Int, y: Int) = (row+step.x, column+step.y)
    
    if nextPosition.x < 1 || nextPosition.y < 1 || nextPosition.x > 8 || nextPosition.y > 8 {
        continue
    }
    
    count += 1
}

print(count)
