//
//  IShape.swift
//  block
//
//  Created by Daniel Ferrer on 19/7/23.
//

import Foundation
import SwiftUI

struct IShape: Shape {
    
    var color: Color {
        Color.red
    }
    
    var ocuppiedPositions: [GridPosition] = [
        GridPosition(x: 4, y: -1),
        GridPosition(x: 4, y: 0),
        GridPosition(x: 4, y: 1, isPivot: true),
        GridPosition(x: 4, y: 2),
    ]
    
}
