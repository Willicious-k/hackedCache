import Foundation

let b = 3
let w = 6
let bc = 9
let wc = 1
let z = 1

func taumBday(b: Int, w: Int, bc: Int, wc: Int, z: Int) -> Int {
  var totalCost = 0
  
  let abc = wc + z
  let awc = bc + z
  
  totalCost += (bc < abc) ? (b * bc) : (b * abc)
  totalCost += (wc < awc) ? (w * wc) : (w * awc)
  
  print(totalCost)
  return totalCost
}

taumBday(b: b, w: w, bc: bc, wc: wc, z: z)
