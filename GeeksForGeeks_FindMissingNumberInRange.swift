/*
 * You are given a list of n-1 integers and these integers are in the range of 1 to n. There are no duplicates in list. One of the integers is missing in the list. Write an efficient code to find the missing integer
 */

public func findMissingNumberInRange(arrayToBeProcessed : [Int]) -> Int {
    var sumOfAllElementsOfArray = 0
    
    for index in 1 ... (arrayToBeProcessed.count + 1) {
        sumOfAllElementsOfArray += index - ((index - 1) < arrayToBeProcessed.count ? arrayToBeProcessed[index - 1] : 0)
    }
    
    return sumOfAllElementsOfArray
}
