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
        
    var cards: Array<MemoryGame<String>.Card> {model.cards}
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    func makeThemes() -> Set<Theme>{
        var theme_set = Set<Theme>()
        theme_set.insert(Theme(name: "Halloween", emoji_set: ["👻","🎃","🕸","🕷","👁"], num_cards: 5, color: Color.orange))
        theme_set.insert(Theme(name: "Christmas", emoji_set: ["🤶","🎄","🎅","🍪","🦌"], num_cards: 5, color: Color.green))
        theme_set.insert(Theme(name: "Halloween", emoji_set: ["👻","🎃","🕸","🕷","👁"], num_cards: 5, color: Color.orange))
        theme_set.insert(Theme(name: "Halloween", emoji_set: ["👻","🎃","🕸","🕷","👁"], num_cards: 5, color: Color.orange))
        theme_set.insert(Theme(name: "Halloween", emoji_set: ["👻","🎃","🕸","🕷","👁"], num_cards: 5, color: Color.orange))
        theme_set.insert(makeRandomTheme())
        return theme_set
    }

    func pickRandomTheme()->Theme{
        return makeThemes().prefix(1)
    }
    
    func makeRandomTheme()-> Theme{
        let randomInt : Int = Int.random(in: 2..<20)
        var emojis_set = Array<String>()
        for i in 0x1F600...0x1F64F {
            let c = String(UnicodeScalar(i) ?? "-")
            emojis_set.append(c)
        }
        
        emojis_set = Array(Array(Set(emojis_set)).prefix(randomInt))
        var color: Color = Color(red: Double(arc4random()) / 0xFFFFFFFF, green: Double(arc4random()) / 0xFFFFFFFF, blue: Double(arc4random()) / 0xFFFFFFFF)
        return Theme(name: "Random!", emoji_set: emojis_set, num_cards: randomInt, color: color)
    
    }
    
    static func createMemoryGame()-> MemoryGame<String>{
        //let emojis = ["👻","🎃","🕸","🕷","👁"]
        let randomInt : Int = Int.random(in: 2..<20)
        
        return MemoryGame<String>(pairsOfCards: randomInt ){index in return emojis[index]}
    }
    
}
