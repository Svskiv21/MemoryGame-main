//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation
import SwiftUI

class MemoGameViewModel : ObservableObject{
    
    typealias Card = MemoGameModel<String>.Card
    
    private static var emojis = ["😀", "😠", "😆", "🥺", "🥲", "😭", "😱", "😧", "🙄", "🌚"]
    
    private var theme1 = ["😀", "😠", "😆", "🥺", "🥲", "😭", "😱", "😧", "🙄", "🌚"]
    private var theme2 = ["🧚🏻‍♀️", "👻", "💀", "🎃", "🦇", "🧟‍♀️", "🧛🏻‍♂️", "🧙🏻‍♂️", "🧝🏻‍♀️", "🧞‍♀️"]
    private var theme3 = ["🦔", "🦙", "🦄", "🦢", "🐩", "🐴", "🦨", "🐥", "🪿", "🐬"]
    
    @Published private var model : MemoGameModel<String> = createGame()
    
    private static func createGame() -> MemoGameModel<String> {
        MemoGameModel(numberPairsOfCard: 10) {
            index in
            if emojis.indices.contains(index){
                return emojis[index]
            }
            return "??"
        }
    }
    
    var cards : Array<Card> {
        return model.cards
    }
    
    var points: Int{
        return model.points
    }
    
    func choose(_ card: Card){
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    @Published var themeColor = Color.blue
    
    func changeThemeColor(color: Color) {
        themeColor = color
        switch color {
            case .red: MemoGameViewModel.emojis = theme2
            case .green: MemoGameViewModel.emojis = theme3
            default: MemoGameViewModel.emojis = theme1
        }
        
        model = MemoGameViewModel.createGame()
    }
    
}
