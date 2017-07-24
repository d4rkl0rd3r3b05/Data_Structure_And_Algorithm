/*
 *  An element is leader if it is greater than all the elements to its right side. And the rightmost element is always a leader
 */

public func getLeaders<T : Comparable>(arrayToBeProcessed : [T]) -> [T]? {
    guard arrayToBeProcessed.count > 0 else {
        return nil
    }
    
    var leadersArray : [T]?
    var highestRightElement : T?
    
    for element in arrayToBeProcessed.reversed() {
        if leadersArray == nil {
            leadersArray = [element]
            highestRightElement = element
        }
        else {
            if element > highestRightElement! {
                leadersArray!.append(element)
                highestRightElement = element
            }
        }
    }
    
    return leadersArray
}
