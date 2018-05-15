import Foundation

//Logic
func breakingRecords(score: [Int]) -> [Int] {
	var bestTimes = 0
	var worstTimes = 0
	var highest = score[0]
	var lowest = score[0]

	guard score.count > 1 else { return [bestTimes, worstTimes] }

	for i in 1...score.count-1 {
		let current = score[i]

		if current > highest {
			highest = current
			bestTimes += 1
			continue;
		}

		if current < lowest {
			lowest = current
			worstTimes += 1
			continue;
		}
	}

	return [bestTimes, worstTimes]
}

//Main
let cases = Int(readLine()!)!

for _ in 1...cases {
	let _ = Int(readLine()!)!
	let targetArray = readLine()!.components(separatedBy: " ").map {
		Int($0)!
	}
	print(breakingRecords(score: targetArray))
}

