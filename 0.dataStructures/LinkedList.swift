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
		guard let next = next else {
			return "\(value)"
		}
		return "\(value) -> " + String(describing: next) + " "
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

}

extension LinkedList: CustomStringConvertible {

	public var description: String {
		guard let head = head else {
			return "It's Empty"
		}
		return String(describing: head)
	}

}
