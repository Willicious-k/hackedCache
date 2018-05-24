import Foundation

//Logic
func chocolateFeast(n: Int, c: Int, m: Int) -> Int {
  var result = 0
  var wrapper = 0

  result += (n / c)
  wrapper += result

  while wrapper >= m {
      let bonus = wrapper / m
      result += bonus
      wrapper = wrapper - (m * bonus) + bonus
  }

  return result
}

//Main
let cases: Int = Int(readLine()!)!

for _ in 1...cases {
	let target = readLine()!
	let processed = target.components(separatedBy: " ").map {
		Int($0)!
	}
	//print(processed)
	let answer = chocolateFeast(n: processed[0], c: processed[1], m: processed[2])
  print(answer)
}
