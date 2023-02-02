//
//  Word.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-09.
//

import Foundation

//a word in the wordlist
class Word : Identifiable, ObservableObject {
    var id = UUID()
    var word : String
    var xPos : CGFloat
    @Published var yPos : CGFloat
    
    var letters : [Character]{
        let st = word
        let letArr = Array(st)
        return letArr
    }
    
    var letter : Character{
        return letters.first(where: { $0.isLetter }) ?? "#"
    }
    
    init(word: String, xPos: CGFloat, yPos: CGFloat) {
        self.word = word
        self.xPos = xPos
        self.yPos = yPos
    }
}
