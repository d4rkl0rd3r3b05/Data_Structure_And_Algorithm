func merge<T : Comparable>(leftArray: [T], rightArray: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0

    //Order Array
    var orderedArray = [T]()

    //Re-ordering elements and merging left and right arrays
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            orderedArray.append(leftArray[leftIndex])
            leftIndex += 1
        } else if leftArray[leftIndex] > rightArray[rightIndex] {
            orderedArray.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            orderedArray.append(leftArray[leftIndex])
            leftIndex += 1
            orderedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }
    
    //Combining array
    while leftIndex < leftArray.count {
        orderedArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightArray.count {
        orderedArray.append(rightArray[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

public func mergeSort<T : Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray : leftArray, rightArray: rightArray)         
}
