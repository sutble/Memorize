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
        GeometryReader(){geometry in
            Grid(self.viewModel.cards) { card in
                    CardView(card: card).onTapGesture(perform: {self.viewModel.choose(card: card)})
                }
            }
        }
    }



struct CardView: View {
    var card: MemoryGame<String>.Card
    var body : some View {
        GeometryReader(){geometry in
            ZStack() {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth:self.lineWidth)
                    Text(self.card.content)

                }
                else {
                    if !self.card.isMatched {
                        RoundedRectangle(cornerRadius: self.cornerRadius)
                    }
                }
            }.font(Font.system(size:min(geometry.size.width,geometry.size.height)*self.fontScaleFactor))
        }
        
        .padding()
        .foregroundColor(Color.orange)
        .aspectRatio(0.66, contentMode: .fit)
    }
    
    //MARK: - Drawing Constants
    
    let cornerRadius:CGFloat = 10
    let lineWidth:CGFloat = 3
    let fontScaleFactor:CGFloat = 0.75
    
}
