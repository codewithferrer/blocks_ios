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
    }
    
    private func getSquareGameInMatrix(x: Int, y: Int) -> SquareGame? {
        if y >= 0, x >= 0, y < height, x < width {
            return boardMatrix[y][x]
        } else {
            return nil
        }
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
    }
    
    func moveRight() {
        activeShape?.moveRight()
    }
    
    func rotateShape() {
        activeShape?.rotateToRight()
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
    
    
}





































