//
//  ButtonView.swift
//  block
//
//  Created by Daniel Ferrer on 19/7/23.
//

import SwiftUI

struct ButtonView: View {
    
    var iconSystemName: String
    var action: () -> Void
    
    private var size: CGFloat {
        return 70.0
    }
    
    private var iconSize: CGFloat {
        return 70.0
    }
    
    var cornerRadius: CGFloat = 35
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: iconSystemName)
                .foregroundColor(Color.white)
                .frame(width: iconSize, height: iconSize)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.white, lineWidth: 6)
                )
        }
        .frame(width: size, height: size, alignment: Alignment.center)
        .background(Color.black)
        .clipShape(Circle())
        .buttonStyle(IconButtonRoundDefault())
    }
}

struct IconButtonRoundDefault: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.6), value: configuration.isPressed)
    }
    
    
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(iconSystemName: IconButtons.icons.rotateright)  {}
    }
}

struct IconButtons {
    static let icons = IconNames()
    
    struct IconNames {
        let arrowback = "arrow.backward"
        let arrowforward = "arrow.forward"
        let rotateleft = "arrow.counterclockwise"
        let rotateright = "arrow.clockwise"
        let restart = "restart"
    }
}
