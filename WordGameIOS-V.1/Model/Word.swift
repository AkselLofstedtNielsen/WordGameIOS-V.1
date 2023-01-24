//
//  Word.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-09.
//

import Foundation

//a word in the wordlist
struct Word : Identifiable {
    var id = UUID()
    var word : String
    
    var letters : [Character]{
        let st = word
        let letArr = Array(st)
        return letArr
    }
    
    var letter : Character{
        return letters.first(where: { $0.isLetter }) ?? "#"
    }
}
