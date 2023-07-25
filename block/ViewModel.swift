//
//  ViewModel.swift
//  block
//
//  Created by Daniel Ferrer on 10/7/23.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    let width: Int = 10
    let height: Int = 26
    
    @Published var boardMatrix: [[SquareGame?]]
    @Published var activeShape: Shape? = nil
    
    var timer = Timer.publish(every: 0.5, on: .main, in: .common)
    var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        boardMatrix = Array(repeating: Array(repeating: nil, count: width), count: height)
        
        if activeShape == nil {
            activeShape = createRamdonShape()
        }
        
        timer
            .autoconnect()
            .sink { timer in
                self.moveDown()
            }
            .store(in: &cancellableSet)
    }
    
    func moveDown() {
        activeShape?.moveDown()
        
        if let shape = activeShape {
            if !isInValidPosition(shape: shape) {
                activeShape?.moveUp()
                if isOverLimit(shape: activeShape!) {
                    return
                }
                
                landShape()
            }
        }
    }
    
    func landShape() {
        if let shape = activeShape {
            storeShapeInGrid(shape: shape)
            
            let cleared = clearAllRows()
        }
    }
    
    private func getSquareGameInMatrix(x: Int, y: Int) -> SquareGame? {
        if y >= 0, x >= 0, y < height, x < width {
            return boardMatrix[y][x]
        } else {
            return nil
        }
    }
    
    func storeShapeInGrid(shape: Shape) {
        if isInValidPosition(shape: shape) {
            for position in shape.ocuppiedPositions {
                boardMatrix[position.y][position.x] = SquareGame(x: position.x, y: position.y,
                                                                 ocuppied: true, color: shape.color)
            }
        }
        
        activeShape = createRamdonShape()
    }
    
    func getSquareGame(x: Int, y: Int) -> SquareGame? {
        if let activeShape = activeShape, activeShape.isInPosition(x: x, y: y) {
            return SquareGame(x: x, y: y, color: activeShape.color)
        }
        
        if let squareGame = getSquareGameInMatrix(x: x, y: y), squareGame.ocuppied {
            return squareGame
        }
        
        return nil
    }
    
    func moveLeft() {
        activeShape?.moveLeft()
        
        if let shape = activeShape, !isInValidPosition(shape: shape) {
            activeShape?.moveRight()
        }
    }
    
    func moveRight() {
        activeShape?.moveRight()
        
        if let shape = activeShape, !isInValidPosition(shape: shape) {
            activeShape?.moveLeft()
        }
    }
    
    func rotateShape() {
        activeShape?.rotateToRight()
        
        if let shape = activeShape, !isInValidPosition(shape: shape) {
            activeShape?.rotateToLeft()
        }
    }
    
    func createRamdonShape() -> Shape {
        let value = Int.random(in: 0..<7)
        
        switch(value) {
            case 0: return OShape()
            case 1: return IShape()
            case 2: return TShape()
            case 3: return LShape()
            case 4: return JShape()
            case 5: return SShape()
            case 6: return ZShape()
            default: return OShape()
        }
        
    }
    
    func isInValidPosition(shape: Shape) -> Bool {
            
        for position in shape.ocuppiedPositions {
            if (!isWithInBoard(x: position.x, y: position.y)) {
                return false
            }
            
            if isOccupied(x: position.x, y: position.y) {
                return false
            }
        }
        
        
        return true
    }
    
    func isWithInBoard(x: Int, y: Int) -> Bool {
        if x < width, y < height, x >= 0 {
            return true
        }
        return false
    }
    
    func isOccupied(x: Int, y: Int) -> Bool {
        if let squareGame = getSquareBoard(x: x, y: y), squareGame.ocuppied {
            return true
        }
        return false
    }

    private func getSquareBoard(x: Int, y: Int) -> SquareGame? {
        if y >= 0, x >= 0, y < height, x < width {
            return boardMatrix[y][x]
        } else {
            return nil
        }
    }
    
    func isOverLimit(shape: Shape) -> Bool {
            
        for position in shape.ocuppiedPositions {
            if position.y <= -1 || position.y >= height {
                return true
            }
        }
        
        return false
    }
    
    func clearAllRows() -> Int {
        var cleared = 0
        for (index, item) in boardMatrix.enumerated() {
            
            if isRowComplete(y: index) {
                clearRow(y: index)
                shiftRowsDown(end: index)
                
                cleared += 1
            }
        }
        return cleared
    }
    
    func isRowComplete(y: Int) -> Bool {
        boardMatrix[y].filter { squaregame in
            squaregame == nil || squaregame?.ocuppied == false
        }.count == 0
    }
    
    func clearRow(y: Int) {
        for index in boardMatrix[y].indices {
            boardMatrix[y][index] = nil
        }
    }
    
    func shiftRowsDown(end: Int) {
        for index in (0..<end).reversed() {
            shitfOneRowDown(y: index)
        }
    }

    func shitfOneRowDown(y: Int) {
        for index in boardMatrix[y].indices {
            if let squareGame = boardMatrix[y][index] {
                boardMatrix[y + 1][index] = SquareGame(x: squareGame.x,
                                                       y: squareGame.y,
                                                       ocuppied: squareGame.ocuppied,
                                                       color: squareGame.color)
            } else {
                boardMatrix[y + 1][index] = nil
            }
            boardMatrix[y][index] = nil
        }
    }
}





































