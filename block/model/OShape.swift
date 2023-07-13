//
//  OShape.swift
//  block
//
//  Created by Daniel Ferrer on 10/7/23.
//

import Foundation
import SwiftUI

struct OShape: Shape {
    
    var color: Color {
        Color.yellow
    }
    
    var ocuppiedPositions: [GridPosition] = [
        GridPosition(x: 4, y: -1),
        GridPosition(x: 5, y: -1),
        GridPosition(x: 4, y: 0),
        GridPosition(x: 5, y: 0),
    ]

    
}
