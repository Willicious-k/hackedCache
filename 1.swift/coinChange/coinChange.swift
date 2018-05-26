import Foundation

// Helpers, if needed

// Logic
func solveCase(n: Int, c:[Int]) -> Int {
  return 0
}

// Main: Input Handling
let cases = Int(readLine()!)!

for _ in 1...cases {
  let firstLine = readLine()!.components(separatedBy: " ").map { Int($0)! }
  let secondLine = readLine()!.components(separatedBy: " ").map { Int($0)! }
  
  let answer = solveCase(n: firstLine[0], c: secondLine)
  print(answer)
}
