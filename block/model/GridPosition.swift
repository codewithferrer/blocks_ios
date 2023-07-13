//
//  GridPosition.swift
//  block
//
//  Created by Daniel Ferrer on 10/7/23.
//

import Foundation

protocol GridPositionProtocol {
    var x: Int { get set }
    var y: Int { get set }
    var isPivot: Bool { get set }
}

struct GridPosition: GridPositionProtocol {
    var x: Int = -1
    var y: Int = -1
    var isPivot: Bool = false
}
