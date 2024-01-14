//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoGameModel<String>.Card
    
    let card: Card
    
    init(card: Card) {
        self.card = card
    }
    
    var body: some View {
        CirclePart(endAngle: .degrees(270))
            .opacity(0.5)
            .overlay(Text(card.content)
                .font(.system(size: 200))
                .minimumScaleFactor(0.01)
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                .animation(.spin(duration: 2), value: card.isMatched)) //tu sie konczy .overlay
            .cardify(isFaceUp: card.isFaceUp) // tu bierzesz karte
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0) // to na cardify
        
    }
}

extension Animation{
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
}
