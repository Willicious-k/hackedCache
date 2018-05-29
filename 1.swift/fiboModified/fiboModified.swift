import Foundation

// Helpers
struct UInt128{
  var value: (UInt64, UInt64) = (0, 0)

  init() {
    self.value = (0, 0)
  }

  init(_ a: Int) {
    self.value = (0, UInt64(Double(a)) )
  }

  init(_ a: Int, _ b: Int ) {
    self.value = (UInt64(Double(a)), UInt64(Double(b)))
  }

  init (_ a: UInt64, _ b: UInt64) {
    self.value = (a, b)
  }

  static func + (lhs: UInt128, rhs: UInt128) -> UInt128 {
    let (leftHigh, leftLow) = lhs.value
    let (rightHigh, rightLow) = rhs.value

    let (resultLow, overflow) = leftLow.addingReportingOverflow(rightLow)
    let resultHigh = rightHigh + leftHigh  + (overflow ? 1 : 0)

    return UInt128(resultHigh, resultLow)
  }

  // static func * (lhs: UInt128, rhs: UInt128) -> UInt128
}

extension UInt128: CustomStringConvertible {
  var description: String {
    let (high, low) = self.value
    return String(high) + String(low)
  }
}

// Logic
func fibonacciModified(t1: Int, t2: Int, n: Int) -> String {
  var cache = Array<UInt128>()
  cache.append( UInt128(t1) )
  cache.append( UInt128(t2) )

  // for i in 2..<n {
  //   cache.append( cache[i-2] + (cache[i-1] * cache[i-1]) )
  // }

  return ""
}

// Main - input handling
let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let answer = fibonacciModified(t1: input[0], t2: input[1], n: input[2])
print (answer)
