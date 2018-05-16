import Foundation

let s = 7
let t = 11
let a = 5
let b = 15
let appleCount = 3
let orangeCount = 2
let apples = [-2, 2, 1]
let oranges = [5, -6]

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
  let appleRange = s-a ... t-a
  let orangeRange = s-b ... t-b

  let applesInRange = apples.filter { (apple) -> Bool in
    appleRange.contains(apple)
  }
  print(applesInRange.count)
  
  let orangesInRange = oranges.filter { (orange) -> Bool in
    orangeRange.contains(orange)
  }
  print(orangesInRange.count)
}

countApplesAndOranges(s: s, t: t, a: a, b: b, apples: apples, oranges: oranges)
