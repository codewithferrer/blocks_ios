//
//  LShape.swift
//  block
//
//  Created by Daniel Ferrer on 19/7/23.
//

import Foundation
import SwiftUI

struct LShape: Shape {
    var color: Color {
        Color.blue
    }
    
    var ocuppiedPositions: [GridPosition] = [
        GridPosition(x: 4, y: -1),
        GridPosition(x: 4, y: 0, isPivot: true),
        GridPosition(x: 4, y: 1),
        GridPosition(x: 5, y: 1),
    ]
    
}
