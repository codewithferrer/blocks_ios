//
//  TextExtension.swift
//  block
//
//  Created by Daniel Ferrer on 7/8/23.
//

import SwiftUI

enum FontSize: CGFloat {
    case s24 = 24
    case s18 = 18
    case s16 = 16
    case s15 = 15
    case s14 = 14
    case s20 = 20
    case s22 = 22
    case s12 = 12
    case small = 9
    case s30 = 30
    case s38 = 38
    case s60 = 60
}

enum FontType: String {
    //case light = "dsdigi"
    case regular = "DS-Digital"
    case bold = "DS-Digital Bold"
    case digital = "Digital-7 Mono"
}

extension View {
    
    func font(size: FontSize, type: FontType) -> some View {
        return self.font(Font.custom(type.rawValue, size: size.rawValue))
    }
    
}

