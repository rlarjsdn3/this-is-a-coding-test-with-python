//0-2. 미로탈출 - p. 152

import Foundation

public struct Point {
    var x: Int
    var y: Int
}

public struct Queue<T> {
    fileprivate var array: [T?] = []
    fileprivate var head: Int = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    @discardableResult public mutating func dequeue() -> T? {
        guard let element = array[guarded: head] else {
            return nil
        }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    var front: T? {
        guard !isEmpty else {
            return nil
        }
        
        return array[head]
    }
}

extension Array {
    subscript(guarded index: Int) -> Element? {
        guard (startIndex..<endIndex).contains(index) else {
            return nil
        }
        
        return self[index]
    }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])

var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(Array(readLine()!).map { Int(String($0))! })
}

func bfs(_ graph: inout [[Int]], x: Int, y: Int) -> Int {
    // 이동할 방향 설정(상, 하, 좌, 우)
    let d: [(x: Int, y: Int)] = [(-1, 0), (1, 0), (0, 1), (0, -1)]
    
    var queue: Queue<Point> = Queue<Point>()
    queue.enqueue(Point(x: x, y: y))
    
    // 큐가 빌 때까지 반복
    while !queue.isEmpty {
        let p: Point = queue.dequeue()!
        
        // 현재 위치에서 네 방향으로의 위치 확인
        for i in 0..<4 {
            let n: Point = Point(x: p.x + d[i].x, y: p.y + d[i].y)
            
            // 미로 찾기 공간을 벗어난 경우 무시
            if n.x < 0 || n.x >= graph.count || n.y < 0 || n.y >= graph[0].count {
                continue
            }
            
            // 해당 노드를 처음 방문하는 경우에만 최단 거리 기록
            if graph[n.x][n.y] == 1 {
                graph[n.x][n.y] = graph[p.x][p.y] + 1
                queue.enqueue(Point(x: n.x, y: n.y))
            }
        }
    }
    
    // 가장 오른쪽 아래까지으 최단 거리 반환
    return graph[graph.count - 1][graph[0].count - 1]
}

print(bfs(&graph, x: 0, y: 0)) // 결과 출력
