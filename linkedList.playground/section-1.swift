// Playground - noun: a place where people can play

import UIKit

class linkedList {
  var head : Node?
  
  func insertThing(thing: Int) {
    var node = Node()
    node.item = thing
    
    if self.head == nil {
      self.head = node
    } else {
      insertAtHead(node)
    }
  }
  func insertAtHead(node :Node) {
    node.next = self.head
    self.head = node
  }
  func insertAtTail(node : Node) {
    head!.addNode(node)
  }
  
  func whileInsertAttail(node : Node) {
    var nextNode = self.head
    while nextNode!.next != nil {
      nextNode = nextNode!.next
    }
    nextNode!.next = node
  }
}

class Node {
  var item : Int?
  var next : Node?
  
  func addNode(node: Node) {
    if self.next == nil {
      self.next = node
    } else {
      self.next!.addNode(node)
    }
  }
  
}

