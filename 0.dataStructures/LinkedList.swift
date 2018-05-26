import Foundation

public class Node<Value> {

	public var value: Value
	public var next: Node?
	public weak var previous: Node?

	public init(value: Value, next: Node? = nil, previous: Node? = nil) {
		self.value = value
		self.next = next
		self.previous = previous
	}

}

extension Node: CustomStringConvertible {

	public var description: String {
		return "\(value)"
	}

}

public struct LinkedList<Value> {

	public var head: Node<Value>?
	public var tail: Node<Value>?
	public var count: Int = 0

	public init() { }

	public var isEmpty: Bool {
		return head == nil
	}

	//MARK:- getter
	public func node(at index: Int) -> Node<Value>? {
		guard index >= 0, count > 0, count > index else {
			return nil
		}

		if index == 0 {
			return head
		}

		var currentNode = head
		for _ in 1...index {
			currentNode = currentNode!.next
		}
		return currentNode
	}

	//MARK:- Insert
	public mutating func push(_ value: Value) {
		// pushFront can avoid wholeCopy (can be partially referenced)
		head = Node(value: value, next: head, previous: nil)
		count += 1
		if tail == nil {
			tail = head
		}
	}

	public mutating func append(_ value: Value) {
		copyNodes() // COW

		guard !isEmpty else {
			push(value)
			return
		}

		count += 1
		tail!.next = Node(value: value, next: nil, previous: tail)
		tail = tail!.next
	}

	@discardableResult
	public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
		copyNodes() // COW

		guard tail !== node else {
			append(value)
			return tail!
		}

		let target = Node(value: value, next: node.next, previous: node)
		node.next!.previous = target
		node.next = target
		count += 1
		return target
	}

	//MARK:- remove
	@discardableResult
	public mutating func pop() -> Value? {
		copyNodes() // COW

		defer {
			count -= 1
			head = head?.next
		}

		if isEmpty {
			tail = nil
		}

		return head?.value
	}

	@discardableResult
	public mutating func removeLast() -> Value? {
		copyNodes() // COW

		guard let head = head else { // count == 0
			return nil
		}

		guard head.next != nil else { // count == 1
			return pop()
		}

		guard let outdatedTail = tail else {
			return nil
		}

		let newTail = outdatedTail.previous!

		count -= 1
		newTail.next = nil
		tail = newTail

		return outdatedTail.value
	}

	@discardableResult
	public mutating func remove(after node: Node<Value>) -> Value? {
		copyNodes() // COW

		guard let target = node.next else {
			return nil
		}

		guard target !== tail else {
			return removeLast()
		}

		count -= 1
		target.next?.previous = node
		node.next = target.next

		return target.value
	}

	// MARK: implement COW principle
	private mutating func copyNodes() {
		// COW optimization #1: isKnownUniquelyReferenced
		// only proceed to Copy when head's referenceCount is not 1
		guard !isKnownUniquelyReferenced(&head), var oldNode = head else {
			return
		}

		head = Node(value: oldNode.value)
		var newNode = head

		while let nextOldNode = oldNode.next {
			newNode!.next = Node(value: nextOldNode.value)
			newNode = newNode!.next

			oldNode = nextOldNode
		}

		tail = newNode
	}

}

extension LinkedList: CustomStringConvertible {

	public var description: String {
		guard let head = head else { // count > 0
			return "It's Empty"
		}

		var currentNode = head
		var result: String = String(describing: currentNode)
		for _ in 1..<count {
			currentNode = currentNode.next!
			result +=  " <=> " + String(describing: currentNode)
		}
		return result
	}

}

//MARK: conform Collection protocol
extension LinkedList: Collection {

	public struct Index: Comparable {
		public var node: Node<Value>?

		static public func == (lhs: Index, rhs: Index) -> Bool {
			switch (lhs.node, rhs.node) {
			case let (left?, right?):
				return left.next === right.next
			case (nil, nil):
				return true
			default:
				return false
			}
		}

		static public func < (lhs: Index, rhs: Index) -> Bool {
			guard lhs != rhs else {
				return false
			}
			// WOW
			let nodes = sequence(first: lhs.node) { $0?.next }
			return nodes.contains { $0 === rhs.node }
		}

	}

	public var startIndex: Index {
		return Index(node: head)
	}

	public var endIndex: Index {
		return Index(node: tail?.next)
	}

	public func index(after i: Index) -> Index {
		return Index(node: i.node?.next)
	}

	public subscript(position: Index) -> Value {
		return position.node!.value
	}

}
