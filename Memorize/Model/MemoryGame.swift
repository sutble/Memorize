//
//  MemoryGame.swift
//  Memorize
//
//  Created by Adi on 7/5/20.
//  Copyright © 2020 Adi. All rights reserved.
//

import Foundation



struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    mutating func choose(card: Card){
        print("Card Chosen \(card)")
        if let chosenIndex = cards.firstIndex(matching: card){
            self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        }
        
    }
    
    init(pairsOfCards: Int, makeCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<pairsOfCards{
            let first_card = Card(content: makeCardContent(pairIndex),id:pairIndex)
            let second_card = Card(content: makeCardContent(pairIndex),id:100*(pairIndex+1)+1)
            cards.append(first_card)
            cards.append(second_card)
        }
        cards.shuffle()
    }
    
    struct Card:Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id : Int
        
        init(content: CardContent,id:Int){
            self.isFaceUp = true
            self.isMatched = false
            self.content = content
            self.id = id
        }
        
    }
    
}
