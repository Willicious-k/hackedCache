import Foundation

// Helpers

// Logic
func maximize(prices: [Int]) -> Int {
  let reversed = Array<Int>(prices.reversed())
  var maxCost = 1
  var profit = 0

  for c in reversed {
    if c > maxCost {
      maxCost = c
      continue
    }
    profit += (maxCost - c)
  }

  return profit
}

// Main - input handling
let cases = Int(readLine()!)!

for _ in 0..<cases {
  let _ = Int(readLine()!) // days
  let prices = readLine()!.components(separatedBy: " ").map { Int($0)! }
  let profit = maximize(prices: prices)
  print(profit)
}
