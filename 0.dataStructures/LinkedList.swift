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

	// insert at front
	public mutating func push(_ value: Value) {
		head = Node(value: value, next: head, previous: nil)
		count += 1
		if tail == nil {
			tail = head
		}
	}

	public mutating func append(_ value: Value) {
		guard !isEmpty else {
			push(value)
			return
		}
		count += 1
		tail!.next = Node(value: value, next: nil, previous: tail)
		tail = tail!.next
	}

	// getter
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

	@discardableResult
	public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
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
