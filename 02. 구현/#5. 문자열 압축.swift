#5. 문자열 압축 - p.323

import Foundation

extension String {
    func substring(_ left: Int, _ right: Int) -> String {
        guard left >= 0 else {
            return ""
        }
        
        let startIndex: String.Index = self.index(self.startIndex, offsetBy: left)
        let endIndex: String.Index = self.index(self.startIndex, offsetBy: right>self.count ? self.count : right)
        return String(self[startIndex..<endIndex])
    }
}

func solution(_ s:String) -> Int {
    var result: Int = 1001
    
    for step in 1...(s.count/2+1) {
        var count: Int = 1
        var prev: String = s.substring(0, step)
        var compressed: String = ""
        
        for j in stride(from: step, through: s.count, by: step) {
            let curr: String = s.substring(j, j+step)
            if prev == curr {
                count += 1
            } else {
                compressed += String(count)=="1" ? ""+prev : String(count)+prev
                prev = curr
                count = 1
            }
        }
        
        compressed += s.substring(s.count/step * step, 1001)
        result = min(result, compressed.count)
    }
    
    return result
}

print(solution("aabbaccc"))
