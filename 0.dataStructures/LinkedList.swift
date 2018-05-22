import Foundation

public class LinkedListNode<T> {
	var data: T
	var next: Node?
	weak var previous: Node?

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
	
	public func append(_ value: T) {
		let newNode = Node(value: value)

		if lastNode = last {
			lastNode.next = newNode
			newNode.previous = lastNode
			tail = newNode
		} else {
			head = newNode
		}

		count += 1
	}

}

