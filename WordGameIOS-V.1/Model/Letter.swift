//
//  Letter.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-23.
//

import Foundation
//letters from word to character

struct Letter: Identifiable{
    let id = UUID()
    var word : Word
    
    var letters : [Character]{
        let st = word.word
        let letArr = Array(st)
        return letArr
    }
    
    var letter : Character{
        return letters.first(where: { $0.isLetter }) ?? "#"
    }
    
    
}
