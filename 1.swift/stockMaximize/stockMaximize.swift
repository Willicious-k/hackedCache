import Foundation

// Helpers

// Logic
func maximize(prices: [Int]) -> Int {
  // buy 1 stock, sell stocks, or do nothing...
  var profit = 0
  var stock = 0

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
