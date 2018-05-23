import Foundation

var q = Queue<String>()

q.enqueue("Ada")
q.enqueue("Steve")
q.enqueue("Tim")
print(q.count)             // 3

print(q.dequeue())         // "Ada"
print(q.count)             // 2

print(q.dequeue())         // "Steve"
print(q.count)             // 1

q.enqueue("Grace")
print(q.count)             // 2
