import Foundation

public class Stack<T> {
	
	fileprivate var internalData: [T] = [T]()

	public var isEmpty: Bool {
		return internalData.isEmpty
	}

	public var count: Int {
		return internalData.count
	}
	
	public var top: T? {
		return internalData.last
	}

	public mutating func push(_ element: T) {
		internalData.append(element)
	}

	public mutating func pop() -> T? {
		return internalData.popLast()
	}

}
