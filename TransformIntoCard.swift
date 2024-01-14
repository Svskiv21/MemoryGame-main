//
//  TransformIntoCard.swift
//  MemoryGame
//
//  Created by student on 28/11/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier {
    
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
    }
    
}

extension View {
    
    func cardify(isFaceUp: Bool) -> some View {
        modifier(TransformIntoCard(isFaceUp: isFaceUp))
    }
    
}
