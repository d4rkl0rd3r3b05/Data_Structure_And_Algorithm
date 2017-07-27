/*
 * Median of Sorted Arrays
 */

public func getMedianSortedArray(arrays : Array<Int>...) -> Double?{
    guard arrays.count > 0 else {
        return nil
    }
    
    var totalElementCount = 0
    arrays.forEach({ totalElementCount = totalElementCount + $0.count})
    
    func getElementAtIndex(requiredElementIndex : Int, isSeriesEven : Bool = false) -> Int?{
        var index = 0
        var minCurrentElement : Int?
        var arrayWithMinElementIndex = 0
        var counterArray = Array(repeating: 0, count: arrays.count)
        while index <= requiredElementIndex {
            var previousElementInSeries = 0
            if isSeriesEven && index == requiredElementIndex {
                previousElementInSeries = arrays[arrayWithMinElementIndex][counterArray[arrayWithMinElementIndex] - 1]
            }
            
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
            
            if isSeriesEven && index == requiredElementIndex {
                minCurrentElement! += previousElementInSeries
            }
            index += 1
        }
        
        return minCurrentElement
    }
    
    
    if totalElementCount % 2 == 0 {
        return Double(getElementAtIndex(requiredElementIndex: totalElementCount/2, isSeriesEven: true)!) / 2.0
    }else{
        return Double(getElementAtIndex(requiredElementIndex: totalElementCount/2)!)
    }
}
