import Foundation

//MARK:- default requirements
public protocol Queue {
	associatedtype Element
	mutating func enqueue(_ element: Element) -> Bool
	mutating func dequeue() -> Element?
	var isEmpty: Bool { get }
	var count: Int { get }
	var head: Element? { get }
	var tail: Element? { get }
}

//MARK:- implemented with array
public struct QueueArray<T>: Queue {
	private var array: [T] = []

	public init() {}

	public var isEmpty: Bool {
		return array.isEmpty
	}

	public var count: Int {
		return array.count
	}

	public var head: T? {
		return array.first
	}

	public var tail: T? {
		return array.last
	}

	public mutating func enqueue(_ element: T) -> Bool {
		array.append(element)
		return true
	}

	public mutating func dequeue() -> T? {
		return isEmpty ? nil : array.removeFirst()
	}

}

//MARK:- implemented with doubly linked list
public class QueueLinkedList<T>: Queue {
	private var list = LinkedList<T>()

	public init() {}

	public var isEmpty: Bool {
		return list.isEmpty
	}

	public var count: Int {
		return list.count
	}

	public var head: T? {
		return list.head?.value
	}

	public var tail: T? {
		return list.tail?.value
	}

	public func enqueue(_ element: T) -> Bool {
		list.append(element)
		return true
	}

	// ToDo: change linked list's method name
	public func dequeue() -> T? {
		guard !list.isEmpty, let element = list.first else { return nil }
		return list.pop()
	}

	// ToDo: RingBuffer
}
