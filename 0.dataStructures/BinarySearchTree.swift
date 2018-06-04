import Foundation

public class BinaryNode<Element> {
  public var value: Element
  public var leftChild: BinaryNode?
  public var rightChild: BinaryNode?

  public init(value: Element) {
    self.value = value
  }
}

extension BinaryNode: CustomStringConvertible {
  public var description: String {
    return String(describing: value)
  }
}
//MARK: trying to change here, traverse should be in tree, not node
extension BinaryNode {
  public func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }

  public func traversePreOrder(visit: (Element) -> Void) {
    visit(value)
    leftChild?.traversePreOrder(visit: visit)
    rightChild?.traversePreOrder(visit: visit)
  }

  public func traversePostOrder(visit: (Element) -> Void) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }
}

public struct BinarySearchTree<Element: Comparable> {
  public private(set) var root: BinaryNode<Element>?
  public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    return root?.description ?? "Empty"
  }
}
