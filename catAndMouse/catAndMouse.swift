import Foundation

//Logic
func catAndMouse(x: Int, y: Int, z: Int) {
	let distA = abs(z - x)
	let distB = abs(z - y)
	
	let result = distA - distB
 	
	switch result {
	case let x where x < 0:
		print("Cat A")
	case let x where x > 0:
		print("Cat B")
	default: 
		print("Mouse C")
	}	
}

//Main
let cases: Int = Int(readLine()!)!

for _ in 1...cases {
	let target = readLine()!
	let processed = target.components(separatedBy: " ").map {
		Int($0)!
	}
	//print(processed)
	catAndMouse(x: processed[0], y: processed[1], z: processed[2])
}
