//
//  WordList.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import Foundation

//Wordlist = fylls av firebase, fyller resten av projekten.
class WordList : ObservableObject{
    @Published var words : [Word] = [Word(word: "AKSEL"),
                                     Word(word: "HEJSAN"),
                                     Word(word: "KATT"),
                                     Word(word: "TIGER"),
                                     Word(word:"ELEFANT")]
    
    @Published var typed : [Word] = []
    

    
        //TODO
        //ladda ord från firebase till words
        //sätt första ordet till letter
    
    
    
    
    func addToTyped(inputWord: Word){
        typed.append(inputWord)
    }
    func getRandomWord () -> Word?{
        words.shuffle()
        if let word = words.first{
            return word
        }
        return nil
        
    }
}
