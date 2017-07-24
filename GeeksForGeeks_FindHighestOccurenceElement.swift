/*
 * Find Highest Occuring Element in an array alongwith its Frequency.
 */

public func findHighestOccurence<T : Hashable>(_ arrayForOperation : [T]) -> (T?, Int){
    var frequencyHashmap : [T:Int] = [:]
    var largestFrequency = 0
    var maxOccuredElement : T? = nil
    
    for element in arrayForOperation {
        if let frequency = frequencyHashmap[element] {
            frequencyHashmap[element] = frequency + 1
        }else{
            frequencyHashmap[element] = 1
        }
        
        if largestFrequency < frequencyHashmap[element]! {
            largestFrequency = frequencyHashmap[element]!
            maxOccuredElement = element
        }
    }
    
    return (maxOccuredElement, largestFrequency)
}
