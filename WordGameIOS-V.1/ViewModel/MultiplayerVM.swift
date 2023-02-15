//
//  MultiplayerViewModel.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase

class MultiplayerVM : ObservableObject{
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
    
    @Published var game = MultiplayerGame(p1Id: "", p2Id: "", p1Score: 0, p2Score: 0)
    @Published var playerLife : Int = 3
    @Published var timePlayed = 0.0
    @Published var isTimerRunning = false
    @Published var gameRunning = false
    @Published var WPS : Double = 0.0
    
    @Published var userText = ""
    @Published var wordFound = false
    @Published var id = UUID()
    @Published var letterPosition = 1
    
    @Published var list = WordList()
    
    @Published var gameSpeed : Double = 9.0
    
    
    
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
          gameRunning = false
      }
      
      func restartGame() {
          //Fill from firebase
          list.fillFromFB()
          list.startPositions()
          
          gameRunning = true
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
    
    
    func subscribeToGame(id : String?){
        guard let id = id else {return}
        
        db.collection("games").document(id)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else{
                    print("error fetching document")
                    return
                }
                let result = Result{
                    try document.data(as: MultiplayerGame.self)
                }
                switch result {
                case .success(let game) :
                    self.game = game
                case .failure(let error) :
                    print("error : \(error)")
                }
            }
 
    }
    func addGame(){
        let game = MultiplayerGame(p1Id: "", p2Id: "", p1Score: 0, p2Score: 0)
        
        if let user = user{
            do{
                _ = try db.collection("games").document(user.uid).setData(from: game)
                subscribeToGame(id: user.uid)
                setPlayerName(player: 1)
            }catch{
                print("Error creating game")
            }
        }
    }
    func setPlayerName(player : Int){
        guard let user = user else {return}
            let ref = db.collection("games").document(user.uid)
            
            ref.updateData([
                "p\(player)Id" : user.email
            ]) { err in
                if let err = err{
                    print("Error updating: \(err)")
                } else{
                    print("Player name updated")
                }
                
            }
    }
    func updatePlayerScore(){
        
    }
  }


