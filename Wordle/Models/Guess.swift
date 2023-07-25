//
//  Guess.swift
//  Wordle
//
//  Created by Zaid Sheikh on 18/07/2023.
//

import Foundation
import SwiftUI

struct Guess{
    let index: Int
    var word = "     "
    var bgColor = [Color](repeating: .wrong, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String]{
        word.map {String($0)}
    }
}
