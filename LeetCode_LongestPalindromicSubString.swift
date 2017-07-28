/*
 * Given a string s, find the longest palindromic substring in s.
 */

func checkPalindromicString(input : String) -> Bool{
    guard input.characters.count > 0 else {
        return false
    }
    
    if input.characters.count == 1 {
        return true
    }
    
    for index in 0 ..< input.characters.count/2 {
        if input[index] != input[input.characters.count - index - 1] {
            return false
        }
    }
    
    return true
}

public func getLongestPalindromicSubString(input : String) -> String?{
    var maxLength = 0
    var palindromicSubString = ""
    for index in 0 ..< input.characters.count {
        for innerIndex in ((index + 1) ..< input.characters.count).reversed() {
            if input[index] == input[innerIndex] {
                if checkPalindromicString(input: input[(index + 1) ..< innerIndex]) && maxLength < input[(index + 1) ..< innerIndex].characters.count{
                    maxLength = input[(index + 1) ..< innerIndex].characters.count
                    palindromicSubString = input[index ..< innerIndex + 1]
                }
            }
        }
    }
    
    return maxLength != 0 ? palindromicSubString : nil
}
