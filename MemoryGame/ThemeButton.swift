//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ThemeButton: View {
    
    @ObservedObject var viewModel : MemoGameViewModel
    
    var icon: String
    var text: String
    var color: Color
    
    var body: some View {
        Button(action: {
            viewModel.changeThemeColor(color: color)
        }){
            VStack{
                Text(.init(systemName: icon))
                    .font(.largeTitle)
                Text(text)
            }
        }
    }
}

#Preview {
    ThemeButton(viewModel: MemoGameViewModel(), icon: "pencil.circle", text: "Pencil", color: Color.red)
}
