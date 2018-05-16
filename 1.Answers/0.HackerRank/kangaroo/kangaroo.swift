import Foundation

// solve function
func kangaroo(ar: [Int]) {
  let leftVal = ar[0] - ar[2]
  let rightVal = ar[3] - ar[1]
  
  let result = Double(leftVal) / Double(rightVal)
  if result > 0 && result.remainder(dividingBy: 1.0) == 0 {
    print("YES")
    return
  }
  print("NO")
  return
}

// main: read stdin
let rawInput = "0 3 4 2"
let input = rawInput.components(separatedBy: " ").compactMap { i in
  Int(i)
}
kangaroo(ar: input)

