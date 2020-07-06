//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Adi on 7/3/20.
//  Copyright © 2020 Adi. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var viewModel =  EmojiMemoryGame()
    
    var body: some View {
         HStack() {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {self.viewModel.choose(card: card)})
            }
        }
         .font(viewModel.fontSize)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    var body : some View {
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth:3)
                Text(card.content)

            }
            else {
                RoundedRectangle(cornerRadius: 10.0)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .aspectRatio(0.66, contentMode: .fit)
        

    }
}
