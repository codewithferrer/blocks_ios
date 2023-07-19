//
//  ContentView.swift
//  block
//
//  Created by Daniel Ferrer on 10/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    let boxSize: CGFloat = 20.0
    let spacing: CGFloat = 2.0
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    board
                }
                .padding(.top, 80)
                .padding(.horizontal, 20)
                Spacer()
            }
            Spacer()
            controls
                .padding(.horizontal)
                .padding(.bottom, 20)
        }
        .ignoresSafeArea(.all)
        .background(Color.black)
        
    }
    
    
    var board: some View {
        VStack(spacing: spacing) {
            
            ForEach(0..<viewModel.height, id: \.self) { y in
                HStack (spacing: spacing) {
                    ForEach(0..<viewModel.width, id: \.self) { x in
                        
                        let squareGame = viewModel.getSquareGame(x: x, y: y)
                        let color = squareGame?.color ?? Color.gray.opacity(0.2)
                        
                        Rectangle()
                            .aspectRatio(1.0, contentMode: .fit)
                            .foregroundColor(color)
                            .frame(width: boxSize, height: boxSize)
                            .padding(0)
                        
                    }
                }
            }
            
        }
    }
    
    var controls: some View {
        HStack(spacing: 20) {
                
            ButtonView(iconSystemName: IconButtons.icons.arrowback) {
                viewModel.moveLeft()
            }
            
            ButtonView(iconSystemName: IconButtons.icons.arrowforward) {
                viewModel.moveRight()
            }
            
            Spacer()
            
            
            ButtonView(iconSystemName: IconButtons.icons.rotateright) {
                viewModel.rotateShape()
            }
            
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
