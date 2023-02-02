//
//  TypingViewModel.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-24.
//

import Foundation
//firebase wordlist
//VM for the typing/user input

class TypingViewModel : ObservableObject {
    
    //spelet ska inte sluta när words är tom utan när gameword är tom

    @Published var timePlayed = 0.0
    @Published var isTimerRunning = false
    @Published var gameOver = true
    @Published var WPS : Double = 0.0
    
    @Published var userText = ""
    @Published var wordFound = false
    @Published var id = UUID()
    @Published var letterPosition = 1
    
    @Published var list = WordList()
    
    
    
    func testing(letter: Character) {
        if wordFound{
            guard let index = list.words.firstIndex(where: {$0.id == id}) else { return }
            
            print("i ord: \(list.words[index].word)")
            
            let wordInLetters = list.words[index].letters
            
            if wordInLetters[letterPosition] == letter{
                if letterPosition == wordInLetters.count - 1{
                    print("Ord skrivet")
                    resetWord()
                    list.addToTyped(inputWord: list.words.first(where: {$0.id == id})!)
                    list.words.removeAll(where: {$0.id == id})
                    
                    if list.gameWords.isEmpty && list.words.isEmpty{
                        WPS = getWPS()
                        stopGame()
                    }
                    
                }else{
                    print("Rätt")
                    letterPosition += 1
                }
                
            }else{
                print("Fel")
            }
            
        }
        if !wordFound{
            for word in list.words{
                if word.letter == letter{
                    print("Ja")
                    id = word.id
                    wordFound = true
                    break
                }else{
                    print("Nej")
                }
            }
        }
        
      }
      
      func resetWord() {
          letterPosition = 1
          userText = ""
          wordFound = false
      }
      
      func getWPS() -> Double {
          return Double(list.typed.count) / timePlayed
          
      }

      func stopGame() {
          timePlayed = 0
          isTimerRunning = false
          gameOver = true
      }
      
      func restartGame() {
          for word in list.typed{
              list.words.append(word)
          }
          list.typed.removeAll()
          
          gameOver = false
          isTimerRunning = true
          timePlayed = 0.0
      }
    
  }


    //TODO func för,
    //Backspace för att hoppa ur ord när det väl e valt




   






