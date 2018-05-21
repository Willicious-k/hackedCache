import Foundation

var arr: [[Int]] =
  [
    [-1, -1, 0, -9, -2, -2],
    [-2, -1, -6, -8, -2, -5],
    [-1, -1, -1, -2, -3, -4],
    [-1, -9, -2, -4, -4, -5],
    [-7, -3, -3, -2, -9, -9],
    [-1, -3, -1, -2, -4, -5]
  ]


func sumHourglass(arr: [[Int]], startX: Int, startY: Int) -> Int {
  var tempSum = 0
  for i in 0..<9 {
    if i != 3 && i != 5 {
      let offsetX = i/3
      let offsetY = i%3
      tempSum += arr[startX + offsetX][startY + offsetY]
    }
  }
  return tempSum
}

// Complete the array2D function below.
func array2D(arr: [[Int]]) -> Int {
  var maxValue = -9 * 7
  
  for i in 0..<4 {
    for j in 0..<4 {
      let tempSum = sumHourglass(arr: arr, startX: i, startY: j)
      if maxValue < tempSum {
        maxValue = tempSum
      }
    }
  }
  return maxValue
}

array2D(arr: arr)

