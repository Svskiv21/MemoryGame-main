//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoGameViewModel

    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            HStack {
                points
                Spacer()
                shuffleButton
            }
            themeButtons
        }
        .padding()
        .foregroundColor(viewModel.themeColor)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                if !card.isMatched || card.isFaceUp {
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                        .animation(card.isMatched ? .default : nil, value: card.isMatched)
                        .transition(.scale)
                        .opacity(card.isMatched ? 0 : 1)
                        .scaleEffect(card.isMatched ? 0.5 : 1)
                        .rotation3DEffect(
                            .degrees(card.isMatched ? 360 : 0),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .rotation3DEffect(
                            .degrees(card.isMatched ? -180 : 0),                            axis: (x: 0.0, y: 0.0, z: 1.0)
                        )
                }
            }
        }
    }

    
    var points: some View{
        HStack {
            Text("Wynik: \(viewModel.points)")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
    
    var shuffleButton : some View {
        Button(action: {
            viewModel.shuffle()
        }, label: {
            Text("SHUFFLE")
                .font(.title)
                .padding()
        })

    }
    
    var themeButtons : some View {
        HStack{
            ThemeButton(viewModel: viewModel, icon: "smiley.fill", text: "Motyw 1", color: Color.blue)
            Spacer()
            ThemeButton(viewModel: viewModel, icon: "shuffle.circle", text: "Motyw 2", color: Color.red)
            Spacer()
            ThemeButton(viewModel: viewModel, icon: "pawprint.circle", text: "Motyw 3", color: Color.green)
        }
        
    }
}

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
