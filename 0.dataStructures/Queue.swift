import Foundation

public protocol Queue {
	associatedtype Element
	mutating func enqueue(_ element: Element) -> Bool
	mutating func dequeue() -> Element?
	var isEmpty: Bool { get }
	var count: Int { get }
	var head: Element? { get }
	var tail: Element? { get }
}

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
