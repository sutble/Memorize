//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Adi on 7/5/20.
//  Copyright © 2020 Adi. All rights reserved.
//

import Foundation
import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var fontSize : Font {(model.cards.count == 5 ? Font.footnote : Font.largeTitle)}
    
    var cards: Array<MemoryGame<String>.Card> {model.cards}
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    
    
    static func createMemoryGame()-> MemoryGame<String>{
        //let emojis = ["👻","🎃","🕸","🕷","👁"]
        let randomInt : Int = Int.random(in: 2..<6)
        var emojis_set = Array<String>()
        for i in 0x1F600...0x1F64F {
            let c = String(UnicodeScalar(i) ?? "-")
            emojis_set.append(c)
        }
        let emojis = Array(Set(emojis_set)).prefix(randomInt)
        return MemoryGame<String>(pairsOfCards: randomInt ){index in return emojis[index]}
    }
    
}
