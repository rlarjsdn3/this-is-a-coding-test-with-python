//1. 특정 거리의 도시 찾기 - p. 339

import Foundation

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
let (n, m, k, x): (Int, Int, Int, Int) = (input[0], input[1], input[2], input[3])

var graph: [[Int]] = [[Int]](repeating: [Int](), count: n + 1)
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (u, v): (Int, Int) = (input[0], input[1])
    graph[u].append(v)
}

// 모든 도시에 대해 최단 거리를 기록하는 변수 선언
var distance: [Int] = [Int](repeating: -1, count: n + 1)
distance[x] = 0 // 출발 도시 x는 거리를 0으로 초기확

var queue: Queue<Int> = Queue<Int>()
queue.enqueue(x)

// 너비 우선 탐색 수행
while !queue.isEmpty {
    let now: Int = queue.dequeue()!
    
    for next in graph[now] {
        if distance[next] == -1 {
            distance[next] = distance[now] + 1
            queue.enqueue(next)
        }
    }
}

// 최단 거리가 k인 도시의 번호를 오름차순으로 출력
var check: Bool = false
for i in 1...n {
    if distance[i] == k {
        print(i, terminator: " ")
        check = true
    }
}

// 조건에 만족하는 도시가 없다면 -1 출력
if !check {
    print(-1)
}
