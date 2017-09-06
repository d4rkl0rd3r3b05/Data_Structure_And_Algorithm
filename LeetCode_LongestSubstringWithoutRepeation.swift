/*
 * Given a string, find the length of the longest substring without repeating characters. 
 */

public func getLongestSubstringWithoutRepeation(input : String) -> String? {
    let length = input.characters.count
    var uniqueCharacters = Set<String>()
    
    var index = 0, subsequentIndex = 0, longestSubstringWithoutRepeation = ""
    
    while index < length && subsequentIndex < length {
        if !uniqueCharacters.contains(input[subsequentIndex]) {
            uniqueCharacters.insert(input[subsequentIndex])
            subsequentIndex += 1
            longestSubstringWithoutRepeation = longestSubstringWithoutRepeation.characters.count > subsequentIndex - index ?
                longestSubstringWithoutRepeation : input[index..<subsequentIndex]
        }else{
            let repeatitionPosition = input.distance(from: input.startIndex, to: input.range(of: input[subsequentIndex])!.lowerBound)
            uniqueCharacters.remove(input[index])
            index = repeatitionPosition + 1
        }
        
        if longestSubstringWithoutRepeation.characters.count > length - index - 1 {
            break
        }
    }
    
    return longestSubstringWithoutRepeation == "" ? nil : longestSubstringWithoutRepeation
}


