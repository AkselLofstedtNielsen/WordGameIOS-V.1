//
//  MultiplayerWordList.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-20.
//

import Foundation

class MultiplayerWordList: ObservableObject{
    var fbManager = MultiplayerFirebaseManager()
    
    @Published var words : [Word] = []
    
    @Published var gameWords : [Word] = []
    
    @Published var typed : [Word] = []
    

    func fillFromFB(){
        if fbManager.words.isEmpty{
            gameWords.append(Word(word: "NOFIREBASEWORDS", xPos: 0, yPos: 0))
        }else{
            let multiList = fbManager.words.prefix(10)
            for word in multiList{
                gameWords.append(Word(word: word.word, xPos: 0, yPos: 0))
            }
        }
    }
    func addRandomWord(){
        guard let word = gameWords.randomElement() else {return}
        
        let id = word.id
        addToWords(word: word)
        gameWords.removeAll(where: {$0.id == id})
        
    }
    func startPositions(){
        let xPositions : [CGFloat] = [-140, -120, -100, -80, -60, -40, 0, 30, 50, 70,90,130]
        for word in gameWords{
            word.xPos = xPositions.randomElement()!
            word.yPos = -400
        }
    }
    func addToWords(word: Word){
        words.append(word)
    }
    func addToTyped(inputWord: Word){
        typed.append(inputWord)
    }
    func clearAll(){
        words.removeAll()
        typed.removeAll()
        gameWords.removeAll()
    }

}
