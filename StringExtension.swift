import UIKit

public extension String {
    subscript(_ range : Range<Int>) -> String{
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        
        return self.substring(with: Range<String.Index>(uncheckedBounds: (lower: startIndex, upper: endIndex)))
    }
    
    subscript(index: Int) -> String{
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
    
    static func +(lhs : String, rhs : String) -> String {
        return "\(lhs)\(rhs)"
    }
}
