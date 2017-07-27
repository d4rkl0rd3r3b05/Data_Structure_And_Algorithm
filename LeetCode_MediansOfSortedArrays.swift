/*
 * Median of Sorted Arrays
 */

public func getMedianSortedArray(arrays : Array<Int>...) -> Double?{
    guard arrays.count > 0 else {
        return nil
    }
    
    var totalElementCount = 0
    arrays.forEach({ totalElementCount = totalElementCount + $0.count})
    
    func getElementAtIndex(requiredElementIndex : Int) -> Int?{
        var index = 0
        var minCurrentElement : Int?
        var arrayWithMinElementIndex = 0
        var counterArray = Array(repeating: 0, count: arrays.count)
        while index < requiredElementIndex {
            minCurrentElement = Int.max
            for currentArrayIndex in 0 ..< arrays.count {
                if arrays[currentArrayIndex].count <= counterArray[currentArrayIndex]{
                    continue
                }
                else if arrays[currentArrayIndex][counterArray[currentArrayIndex]] < minCurrentElement! {
                    arrayWithMinElementIndex = currentArrayIndex
                    minCurrentElement = arrays[currentArrayIndex][counterArray[currentArrayIndex]]
                }
            }
            counterArray[arrayWithMinElementIndex] += 1
            index += 1
        }
        
        return minCurrentElement
    }
    
    
    if totalElementCount % 2 == 0 {
        return Double(getElementAtIndex(requiredElementIndex: totalElementCount/2)! + getElementAtIndex(requiredElementIndex: totalElementCount/2 + 1)!) / 2.0
    }else{
        return Double(getElementAtIndex(requiredElementIndex: totalElementCount/2 + 1)!)
    }
}
