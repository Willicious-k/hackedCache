import Foundation

// solve function
func minimumBribes(q: [Int]) {
	var isPossible: Bool = true

	let _ = q.enumerated().map { tuple -> Int in
		let (index, value) = tuple

		let eval = value - (index + 1)
		if eval > 2 {
			isPossible = false
		}
		return value
	}

	if isPossible {
		print(0)
	} else {
		print("Too chaotic")
	}
}

// main: read stdin
let cases = Int(readLine()!)!

for _ in 1 ... cases {
	let _ = Int(readLine()!)!
	let targetArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
	minimumBribes(q: targetArray)
}
