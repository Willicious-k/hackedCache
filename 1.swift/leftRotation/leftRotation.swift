import Foundation

// solve function
func rotLeft(a: [Int], d: Int) -> [Int] {
	let startIndex = d - 1
	let count = a.count
	var resultArray: [Int] = []

	for i in 1 ... count {
		let index = (startIndex + i) % count
		resultArray.append(a[index])
	}
	return resultArray
}

// main: read stdin
let firstLine = readLine()!
let firstIntLine = firstLine.components(separatedBy: " ").map { Int($0)! }
let d = firstIntLine[1]

let secondLine = readLine()!
let targetArray = secondLine.components(separatedBy: " ").map { Int($0)! }

let answer = rotLeft(a: targetArray, d: d)
print(answer)
