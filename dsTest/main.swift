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
let target = list.node(at: 2)!
print("node at 2: \(target)")
print("+======+")
for _ in 1...4 {
  list.insert(-1, after: target)
}
print(list)
