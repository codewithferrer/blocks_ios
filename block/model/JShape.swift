//
//  JShape.swift
//  block
//
//  Created by Daniel Ferrer on 19/7/23.
//

import Foundation
import SwiftUI

struct JShape: Shape {
    var color: Color {
        Color.teal
    }
    
    var ocuppiedPositions: [GridPosition] = [
        GridPosition(x: 4, y: -1),
        GridPosition(x: 4, y: 0, isPivot: true),
        GridPosition(x: 4, y: 1),
        GridPosition(x: 3, y: 1),
    ]

}
