/*
 * Given an array of integers, return indices of the two numbers such that they add up to a specific target
 */

public func getTwoSumElements(arrayToBeProcessed : [Int], sum : Int) -> (firstElementIndex : Int, SecondElementIndex : Int)?{
    //Sorting array
    let inputArray = mergeSort(arrayToBeProcessed)
    
    var leftMarker = 0
    var rightMarker = inputArray.count - 1
    
    while leftMarker < rightMarker {
        if inputArray[leftMarker] + inputArray[rightMarker] == sum {
            return (leftMarker, rightMarker)
        }
        else if inputArray[leftMarker] + inputArray[rightMarker] > sum {
            rightMarker -= 1
        }
        else if inputArray[leftMarker] + inputArray[rightMarker] < sum {
            leftMarker += 1
        }
    }
    
    return nil
}
