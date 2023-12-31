//
//  Shape.swift
//  block
//
//  Created by Daniel Ferrer on 10/7/23.
//

import Foundation
import SwiftUI

protocol Shape {
    var color: Color { get }
    var ocuppiedPositions: [GridPosition] { get set }
    
    mutating func moveDown()
    mutating func moveUp()
    mutating func moveLeft()
    mutating func moveRight()
    
    mutating func rotateToRight()
    mutating func rotateToLeft()
    
    func isInPosition(x: Int, y: Int) -> Bool
}

extension Shape {
    
    func isInPosition(x: Int, y: Int) -> Bool {
        return ocuppiedPositions.first { item in
            item.x == x && item.y == y
        } != nil
    }
    
}

extension Shape {
    
    mutating func moveDown() {
        for index in ocuppiedPositions.indices {
            ocuppiedPositions[index].y += 1
        }
    }
    
    mutating func moveUp() {
        for index in ocuppiedPositions.indices {
            ocuppiedPositions[index].y -= 1
        }
    }
}

extension Shape {
  mutating func moveLeft() {
      for index in ocuppiedPositions.indices {
          ocuppiedPositions[index].x -= 1
      }
  }
  
  mutating func moveRight() {
      for index in ocuppiedPositions.indices {
          ocuppiedPositions[index].x += 1
      }
  }
}

extension Shape {
    
    mutating func rotateToRight() {
        if let pivot = ocuppiedPositions.first(where: { $0.isPivot == true }) {
            
            let px = pivot.x
            let py = pivot.y
            
            for index in ocuppiedPositions.indices {
                let y1 = ocuppiedPositions[index].y
                let x1 = ocuppiedPositions[index].x
                
                let x2 = (y1 + px - py)
                let y2 = (px + py - x1)
                
                ocuppiedPositions[index].x = x2
                ocuppiedPositions[index].y = y2
            }
        }
    }
    
    mutating func rotateToLeft() {
        if let pivot = ocuppiedPositions.first(where: { $0.isPivot == true }) {
            let px = pivot.x
            let py = pivot.y
            
            for index in ocuppiedPositions.indices {
                let y1 = ocuppiedPositions[index].y
                let x1 = ocuppiedPositions[index].x
                
                let x2 = (px + py - y1)
                let y2 = (x1 + py - px)
                
                ocuppiedPositions[index].x = x2
                ocuppiedPositions[index].y = y2
            }
        }
    }
    
}

































