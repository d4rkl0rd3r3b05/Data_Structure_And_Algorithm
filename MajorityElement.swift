/**
 *Majority Element
 *Majority Element: A majority element in an array A[] of size n is an element that appears more than n/2 times (and hence there is at most one such element)
 */
func findMajority<T : Comparable>(_ arrayForOperation : inout [T]) -> T?{
    //Sort array using merge sort - O(n log n)
    let sortedArray = mergeSort(arrayForOperation)
    
    for index in 0..<sortedArray.count/2 {
        if sortedArray[index] == sortedArray[index + sortedArray.count/2] {
            return sortedArray[index]
        }
    }
    
    return nil
}
