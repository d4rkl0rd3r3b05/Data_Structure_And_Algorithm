/*
 * Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 */

enum parsingDirection : Int{
    case horizontal = 0
    case vertical = 1
}

public func generateSpiral<T>(matrixToBeProcessed : [[T]]) -> [T] {
    var spiralResult : [T] = []
    
    var verticalParsingMinimumLimit = 0
    var horizontalParsingMinimumLimit = 0
    var verticalParsingMaximumLimit = matrixToBeProcessed.count
    var horizontalParsingMaximumLimit = matrixToBeProcessed[0].count
    
    var scrollDirection : parsingDirection = .horizontal
    
    var verticalCounter = 0, horizontalCounter = 0
    
    while horizontalParsingMinimumLimit != horizontalParsingMaximumLimit && verticalParsingMinimumLimit != verticalParsingMaximumLimit {
        if scrollDirection == .horizontal {
            //Parse Left To Right
            if horizontalCounter == horizontalParsingMinimumLimit {
                spiralResult.append(contentsOf: parseFromLeftToRight(matrixToBeProcessed: matrixToBeProcessed, y: verticalCounter, xMin: horizontalParsingMinimumLimit, xMax: horizontalParsingMaximumLimit))
                
                horizontalCounter = horizontalParsingMaximumLimit
                verticalParsingMinimumLimit += 1
                verticalCounter = verticalParsingMinimumLimit
            }
            //Parse Right To Left
            else if horizontalCounter == horizontalParsingMaximumLimit {
                spiralResult.append(contentsOf: parseFromRightToLeft(matrixToBeProcessed: matrixToBeProcessed, y: verticalCounter - 1, xMin: horizontalParsingMinimumLimit, xMax: horizontalParsingMaximumLimit))
                
                horizontalCounter = horizontalParsingMinimumLimit
                verticalParsingMaximumLimit -= 1
                verticalCounter = verticalParsingMaximumLimit
            }
            
            //Toggling scroll Direction
            scrollDirection = .vertical
        }else {
            
            //Parse Top To Bottom
            if verticalCounter == verticalParsingMinimumLimit {
                spiralResult.append(contentsOf: parseFromTopToBottom(matrixToBeProcessed: matrixToBeProcessed, x: horizontalCounter - 1, yMin: verticalParsingMinimumLimit, yMax: verticalParsingMaximumLimit))
                
                verticalCounter = verticalParsingMaximumLimit
                horizontalParsingMaximumLimit -= 1
                horizontalCounter = horizontalParsingMaximumLimit
            }
            //Parse Bottom To Top
            else if verticalCounter == verticalParsingMaximumLimit {
                spiralResult.append(contentsOf: parseFromBottomToTop(matrixToBeProcessed: matrixToBeProcessed, x: horizontalCounter, yMin: verticalParsingMinimumLimit, yMax: verticalParsingMaximumLimit))
                
                verticalCounter = verticalParsingMinimumLimit
                horizontalParsingMinimumLimit += 1
                horizontalCounter = horizontalParsingMinimumLimit
            }
            
            //Toggling scroll Direction
            scrollDirection = .horizontal
        }
    }
    
    return spiralResult
}

func parseFromLeftToRight<T>(matrixToBeProcessed : [[T]], y : Int, xMin: Int, xMax : Int) -> [T] {
    var result : [T] = []
    for index in xMin ..< xMax {
        result.append(matrixToBeProcessed[y][index])
    }
    
    return result
}

func parseFromRightToLeft<T>(matrixToBeProcessed : [[T]], y : Int, xMin: Int, xMax : Int) -> [T] {
    var result : [T] = []
    for index in (xMin ..< xMax).reversed() {
        result.append(matrixToBeProcessed[y][index])
    }
    
    return result
}

func parseFromTopToBottom<T>(matrixToBeProcessed : [[T]], x : Int, yMin: Int, yMax : Int) -> [T] {
    var result : [T] = []
    for index in yMin ..< yMax {
        result.append(matrixToBeProcessed[index][x])
    }
    
    return result
}

func parseFromBottomToTop<T>(matrixToBeProcessed : [[T]], x : Int, yMin: Int, yMax : Int) -> [T] {
    var result : [T] = []
    for index in (yMin ..< yMax).reversed() {
        result.append(matrixToBeProcessed[index][x])
    }
    
    return result
}

