import Foundation

public struct Queue<T> {
	
	fileprivate var internalData:[T?] = [T]()
	fileprivate var head: Int = 0

	public var isEmpty: Bool {
		return internalData.count == 0 
	}

	public var count: Int {
		return internalData.count - head 
	}

	public var front: T? {
		if isEmpty {
			return nil
		} else {
			return internalData[head]
		}
	}

	public var rear: T? {
		return internalData.last
	}

	public func enqueue(_ element: T) {
		internalData.appent(element)
	}

	public func dequeue() -> T? {
		guard head < internalData.count, let front = internalData[head] else {
			return nil
		}
		
		internalData[head] = nil
		head += 1

		//occasional trimming
		let capacity = Double(head) / Double(internalData.count)
		if internalData.count > 100 && capacity > 0.25 {
			internalData.removeFirst(head)
			head = 0
		}

		return front
	}

}

