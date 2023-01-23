//
//  WordList.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-09.
//

import Foundation

//firebase wordlist

class WordList : ObservableObject {
    @Published var words : [Word] = [Word(word: "Aksel"),Word(word: "Hejsan"),Word(word: "Katt"),Word(word: "Hund")]
    @Published var typed : [Word] = []
    @Published var currentWord : String = ""
    @Published var textFieldWord : String = ""
//    @Published var letter : Letter
    
    init(){
        
        //TODO
        //ladda ord från firebase till words
        //sätt första ordet till letter
      
    }
    //TODO func för,
    //Backspace, space/enter, varje keypress
   
    func getRandomWord () -> Word?{
        words.shuffle()
        if let word = words.first{
            return word
        }
        
        return nil
        
    }
    func addToTyped(inputWord: Word){
        typed.append(inputWord)
    }
}
