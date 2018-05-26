import Foundation

public struct Stack<T> {

	fileprivate var storage: [T] = [T]()

	public init(_ elements: [T]) {
		storage = elements
	}

	public var isEmpty: Bool {
		return storage.isEmpty
	}

	public var count: Int {
		return storage.count
	}

	public var top: T? {
		return storage.last
	}

	//MARK:- essential operations
	public mutating func push(_ element: T) {
		storage.append(element)
	}

	@discardableResult
	public mutating func pop() -> T? {
		return storage.popLast()
	}

}

// init with array literal exp
extension Stack: ExpressibleByArrayLiteral {
	public init(arrayLiteral elements: T...) {
		storage = elements
	}
}

// if needed
// extension Stack: CustomStringConvertible {
//
// 	public var description: String {
//
// 	}
//
// }
