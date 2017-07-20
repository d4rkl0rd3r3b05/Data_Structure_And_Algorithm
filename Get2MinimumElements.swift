public func get2MinimumElements<T : Comparable>(arrayToBeProcessed : [T]) -> (smaller : T, smallest : T)?{
    guard arrayToBeProcessed.count >= 2 else {
        return nil
    }
    
    var smaller = arrayToBeProcessed[1]
    var smallest = arrayToBeProcessed[0]
    
    
    for currentElement in arrayToBeProcessed {
        if smallest > currentElement {
            smaller = smallest
            smallest = currentElement
        }
        else if (smaller > currentElement && currentElement != smallest) || (smaller == smallest) {
            smaller = currentElement
        }
    }
    
    return (smaller: smaller, smallest : smallest)
}
