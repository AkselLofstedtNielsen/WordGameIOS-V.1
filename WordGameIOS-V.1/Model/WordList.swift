//
//  WordList.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import Foundation

//Wordlist = fylls av firebase, fyller resten av projekten.
class WordList{
    @Published var words : [Word] = [Word(word:"AKSEL"),
                                     Word(word:"BANAN"),
                                     Word(word:"CITRON"),
                                     Word(word:"DELFIN"),
                                     Word(word:"ELEFANT"),
                                     Word(word:"FIOL"),
                                     Word(word:"GRODA"),
                                     Word(word:"HUMMER"),
                                     Word(word:"ISLAND")]
    
    @Published var typed : [Word] = []
    

    
    
    func addToTyped(inputWord: Word){
        typed.append(inputWord)
    }
}
