/*
 * Given a string, find the length of the longest substring without repeating characters.
 */

public func getLongestSubstringWithoutRepeation(input : String) -> String?{
    var uniqueCharacters : [String : Int] = [:]
    var longestSubstringWithoutRepeation : String?
    
    for index in 0..<input.characters.count {
        if let _ = uniqueCharacters[input[index]] {
            return longestSubstringWithoutRepeation
        }else {
            uniqueCharacters[input[index]] = 1
            if longestSubstringWithoutRepeation == nil {
                longestSubstringWithoutRepeation = input[index]
            }else{
                longestSubstringWithoutRepeation = longestSubstringWithoutRepeation! + input[index]
            }
        }
    }
    
    return longestSubstringWithoutRepeation
}
