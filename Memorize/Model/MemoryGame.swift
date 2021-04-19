//
//  MemoryGame.swift
//  Memorize
//
//  Created by Adi on 7/5/20.
//  Copyright © 2020 Adi. All rights reserved.
//

import Foundation



struct MemoryGame<CardContent> where CardContent:Equatable {
    
    var cards: Array<Card>
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter{index in cards[index].isFaceUp}
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card){
        print("Card Chosen \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content ==  cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true

            }
            else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
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
            self.isFaceUp = false
            self.isMatched = false
            self.content = content
            self.id = id
        }
        
    }
    
}
