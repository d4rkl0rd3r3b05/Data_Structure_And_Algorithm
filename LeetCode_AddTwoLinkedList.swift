import Foundation

public class ListNode<T> {
    var nodeValue : T
    var next : ListNode?
    
    init(value : T) {
        self.nodeValue = value
    }
    
    public func description() {
        print("\(self.nodeValue)->", separator : "", terminator : "")
        self.next?.description()
    }
}

public class LinkedList<T> {
    public var sourceElement : ListNode<T>?
    
    public init(array : [T]) {
        var previosNode : ListNode<T>?
        for currentElement in array {
            if self.sourceElement == nil {
                self.sourceElement = ListNode(value: currentElement)
                previosNode = self.sourceElement
            }
            else{
                previosNode?.next = ListNode(value: currentElement)
                previosNode = previosNode?.next
            }
        }
    }
    
    public static func addTwoList(firstList : ListNode<Int>?, secondList : ListNode<Int>?) -> ListNode<Int>? {
        var solutionList : ListNode<Int>?
        
        guard firstList != nil || secondList != nil else{
            return nil
        }
        
        if firstList != nil {
            if secondList != nil {
                let sum = (firstList!.nodeValue + secondList!.nodeValue) % 10
                let carryBalance = (firstList!.nodeValue + secondList!.nodeValue) / 10
                var nextNode  = secondList!.next
                if carryBalance > 0 {
                    if nextNode == nil {
                        nextNode = ListNode(value: carryBalance)
                    }else{
                        nextNode!.nodeValue += carryBalance
                    }
                }
                
                solutionList = ListNode(value: sum)
                solutionList!.next = addTwoList(firstList: firstList!.next, secondList: nextNode)
            }
            else {
                let sum = firstList!.nodeValue % 10
                let carryBalance = firstList!.nodeValue / 10
                var nextNode : ListNode<Int>?
                if carryBalance > 0 {
                    nextNode = ListNode(value: carryBalance)
                }
                
                solutionList = ListNode(value: sum)
                solutionList!.next = addTwoList(firstList: firstList!.next, secondList: nextNode)
            }
        }else {
            let sum = secondList!.nodeValue % 10
            let carryBalance = secondList!.nodeValue / 10
            var nextNode : ListNode<Int>?
            if carryBalance > 0 {
                nextNode = ListNode(value: carryBalance)
            }
            
            solutionList = ListNode(value: sum)
            solutionList!.next = addTwoList(firstList: nextNode, secondList: secondList!.next)
        }
        
        return solutionList
    }
}

