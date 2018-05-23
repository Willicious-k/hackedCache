import Foundation

public class LinkedListNode<T> {
	var data: T
	var next: LinkedListNode?
	weak var previous: LinkedListNode?

	public init(value: T) {
		self.data = value
	}

}

public class LinkedList<T> {
	public typealias Node = LinkedListNode<T>

	private var head: Node?
	private var tail: Node?
	private var nodeCount: Int = 0

	public var isEmpty: Bool {
		return head == nil
	}

	public var count: Int {
		return nodeCount
	}

	public var first: Node? {
		return head
	}

	public var last: Node? {
		return tail
	}

	public func removeAll() {
		head = nil
		tail = nil
		nodeCount = 0
	}

	public func append(_ value: T) {
		let newNode = Node(value: value)

		if let lastNode = last {
			lastNode.next = newNode
			newNode.previous = lastNode
			tail = newNode
		} else {
			head = newNode
		}

		nodeCount += 1
	}

	public func node(atIndex index: Int) -> Node? {
		guard nodeCount > 0, nodeCount > index, index >= 0 else { return nil }

		var node = head
		if index == 0 {
			return node
		} else {
			for _ in 1...index {
				node = node.next
			}
		}
		return node
	}

	public subscript(index: Int) -> T {
		let node = self.node(atIndex: index)
		return node.data
	}

	// insertAt
	// map
	// filter
}
