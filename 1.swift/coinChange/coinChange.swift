import Foundation

// Helpers, if needed
func printMatrix(target: [[Int]]) {
  let width = target[0].count
  let height = target.count

  var lane = ""
  for i in 0..<height {
    lane = ""
    for j in 0..<width {
      lane += String(target[i][j]) + " "
    }
    print(lane)
  }
}

// Logic
func solveCase(n: Int, c:[Int]) -> Int {
  var cache: [[Int]] = []

  for i in 0...c.count {
    let lane: [Int] = Array<Int>(repeating: 0, count: n+1)
    cache.append(lane)
    cache[i][0] = 1
  }

  for i in 1...c.count {
    for j in 1...n {
      if (c[i-1] <= j) {
				cache[i][j] = cache[i-1][j] + cache[i][j-c[i-1]]
			} else {
				cache[i][j] = cache[i-1][j]
			}
    }
  }

  printMatrix(target: cache)
  return cache[c.count][n]
}

// Main: Input Handling
let cases = Int(readLine()!)!

for _ in 1...cases {
  let firstLine = readLine()!.components(separatedBy: " ").map { Int($0)! }
  let secondLine = readLine()!.components(separatedBy: " ").map { Int($0)! }

  let answer = solveCase(n: firstLine[0], c: secondLine)
  print("answer: \(answer)")
}
