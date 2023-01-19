//
//  WordList.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-09.
//

import Foundation

class WordList : ObservableObject {
    @Published var list = [Word]()
    
    init(){
        addData()
    }
    
    func addData(){
        list.append(Word(word: "Hejsan"))
        list.append(Word(word: "Aksel"))
        list.append(Word(word: "Sarah"))
        list.append(Word(word: "Hejdå"))
        list.append(Word(word: "Frodo"))
    }
    func getRandomWord () -> Word?{
        list.shuffle()
        if let word = list.first{
            return word
        }
        
        return nil
        
    }
}
