//
//  ZShape.swift
//  block
//
//  Created by Daniel Ferrer on 19/7/23.
//

import Foundation
import SwiftUI

struct ZShape: Shape {
    var color: Color {
        Color.pink
    }
    
    var ocuppiedPositions: [GridPosition] = [
        GridPosition(x: 4, y: -1),
        GridPosition(x: 3, y: -1),
        GridPosition(x: 4, y: 0, isPivot: true),
        GridPosition(x: 5, y: 0),
    ]

}
