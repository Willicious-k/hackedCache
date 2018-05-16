import Foundation

let arr = [1, 4, 3, 2]

func reverseArray(arr: [Int]) -> [Int] {
    var target = arr
    var result: [Int] = []
    
    for _ in 0..<target.count {
        result.append(target.removeLast())
    }
    return result
}

reverseArray(arr: arr)

