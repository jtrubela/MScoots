//
//  Card.swift
//  MScoots
//
//  Created by Lennyn Stephano Prado on 4/21/23.
//

import SwiftUI

// MARK: BANK CARDS MODEL

struct Card: Identifiable {
   var id = UUID().uuidString
   var name: String
   var cardNumber: String
   var cardImage: String
}


// MARK: - CARD SAMPLE DATA

var cards: [Card] = [
   Card(name: "", cardNumber: "", cardImage: "card_ID"),
//    Card(name: "Steven Vance", cardNumber: "4179 2863 0168 7150", cardImage: "card_AppleCash"),
   Card(name: "James Olatunji", cardNumber: "4929 0958 237 63677", cardImage: "card4"),

   Card(name: "Vincent Cavallaro", cardNumber: "4716 2394 4688 5700", cardImage: "card2"),
   Card(name: "Justin Trubela", cardNumber: "5295 8066 4295 5853", cardImage: "card3"),
   Card(name: "Shade Dorch", cardNumber: "5295 8066 4295 5853", cardImage: "card4"),

]
