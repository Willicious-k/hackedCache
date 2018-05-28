import Foundation

// Helpers

// Logic
func fibonacciModified(t1: Int, t2: Int, n: Int) -> UInt64 {
  var cache = Array<UInt64>(repeating: 0, count: n+1)
  cache[1] = UInt64(truncating: (t1 as? NSNumber)!)
  cache[2] = UInt64(truncating: (t2 as? NSNumber)!)

  for i in 3...n {
    cache[i] = cache[i-2] + (cache[i-1] * cache[i-1])
  }

  return cache[n]
}

// Main - input handling
let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let answer = fibonacciModified(t1: input[0], t2: input[1], n: input[2])
print (answer)
