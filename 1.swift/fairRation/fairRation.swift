import Foundation

// Helpers

// Logic
func fairRations(B: [Int]) -> Int {
  return 0
}

// main - input handling
let cases = Int(readLine()!)!

for _ in 1...cases {
  let _ = Int(readLine()!)!
  let array = readLine()!.components(separatedBy: " ").map{ Int($0)! }
  let result = fairRations(B: array)
  print(result)
}
