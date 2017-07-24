/*
 * Given an array of positive integers. All numbers occur even number of times except one number which occurs odd number of times. Find the number in O(n) time & constant space
 */

public func findNumberWithOddOccurence(arrayToBeProcessed : [Int]) -> Int?{
    guard arrayToBeProcessed.count > 0 else {
        return nil
    }
    
    var requiredElement : Int = arrayToBeProcessed[0]
    for element in arrayToBeProcessed[1 ..< arrayToBeProcessed.count] {
        requiredElement = requiredElement ^ element
    }
    
    return requiredElement
}
