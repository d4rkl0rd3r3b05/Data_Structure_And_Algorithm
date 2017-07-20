public func generateAnagram(input : String) -> [String]{
    guard input.characters.count > 1 else {
        return [input]
    }
    
    var requiredAnagrams : [String] = []
    
    for index in 0 ..< input.characters.count {
        //String removing current character
        var exludedString = input
        let _ = exludedString.remove(at: exludedString.index(exludedString.startIndex, offsetBy: index))
        
        let generatedAnagrams = generateAnagram(input: exludedString)
        
        //prepend first character to anagram of remaining substring
        requiredAnagrams.append(contentsOf: generatedAnagrams.map{ input[index] + $0})
    }
        
    return Array(Set(requiredAnagrams))
}
