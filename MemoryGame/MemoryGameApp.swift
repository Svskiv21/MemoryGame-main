//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    
    @StateObject var game = MemoGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
