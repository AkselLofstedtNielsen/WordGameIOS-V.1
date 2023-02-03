//
//  WordList.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import Foundation

//Wordlist = fylls av firebase, fyller resten av projekten.
class WordList: ObservableObject{
    @Published var words : [Word] = []
    
    @Published var gameWords : [Word] = [Word(word:"AKSEL",xPos: -120, yPos: -400),
                                         Word(word:"BANAN", xPos: -95, yPos: -400),
                                         Word(word:"CITRON",xPos: -60,yPos: -400),
                                         Word(word:"DELFIN",xPos: -75,yPos: -400),
                                         Word(word:"ELEFANT",xPos: -100,yPos: -400),
                                         Word(word:"FIOL",xPos: 20,yPos: -400),
                                         Word(word:"GRODA",xPos: 40,yPos: -400),
                                         Word(word:"HUMMER",xPos: 75,yPos: -400),
                                         Word(word:"ISLAND",xPos: 100,yPos: -400),
                                         Word(word:"JULKULA", xPos: 120, yPos: -400)]
    
    @Published var typed : [Word] = []
    

    func addRandomWord(){
        guard let word = gameWords.randomElement() else {return}
        
        let id = word.id
        addToWords(word: word)
        gameWords.removeAll(where: {$0.id == id})
        
    }
    func addToWords(word: Word){
        words.append(word)
    }
    func addToTyped(inputWord: Word){
        typed.append(inputWord)
    }
}
