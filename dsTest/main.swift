import Foundation

var list = LinkedList<Int>()

list.push(1)
list.push(2)
list.push(3)
list.append(1)
list.append(2)
list.append(3)

print(list)
print("list.count: \(list.count)")
print("+======+")

let insertTarget = list.node(at: 2)!
print("node at 2: \(insertTarget)")
print("+======+")

for _ in 1...4 {
  list.insert(-1, after: insertTarget)
}
print(list)

print("+======+")
let poppedValue = list.pop()
print(list)

print("+======+")
let removedValue = list.removeLast()
print(list)

print("+======+")
let removeTarget = list.node(at: 2)!
print("node at 2: \(removeTarget)")
let removed = list.remove(after: removeTarget)
print(list)

// conformed collection protocol
let sum = list.reduce(0, +)
print("sum of current list: \(sum)")
