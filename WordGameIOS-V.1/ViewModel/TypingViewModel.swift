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
    @Published var playerLife : Int = 3

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
                    list.addToTyped(inputWord: list.words[index])
                    list.words.remove(at: index)
                    
                    if list.gameWords.isEmpty && list.words.isEmpty{
                    
                        WPS = getWPS()
                        stopGame()
                        
                        for word in list.typed{
                            print("\(word.word) + \(word.dead)")
                        }
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
    func addWordToGame(){
        let check: Double = timePlayed .truncatingRemainder(dividingBy: 2.0)
        let checkRounded = check.roundToDecimal(1)

        if  checkRounded == 0.1{

            list.addRandomWord()
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
          //Fill from firebase
          
          gameOver = false
          isTimerRunning = true
          timePlayed = 0.0
          playerLife = 3
      }
    func checkDead(){
        if playerLife == 0{
            list.clearAll()
            stopGame()
            
        }
        
    }
    
    
  }


    //TODO func för,
    //Backspace för att hoppa ur ord när det väl e valt




   






