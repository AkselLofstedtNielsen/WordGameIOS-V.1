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


//TODO: Fixa om vm till passande
//TODO: Fixa om så man kan joina games med email på spelare 1
//TODO: Fixa player names: Alltså starta game när båda spelare e med

class MultiplayerVM : ObservableObject{
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
    
    @Published var game = MultiplayerGame(p1Id: "", p2Id: "", p1Score: 0, p2Score: 0,p1Life: 3,p2Life: 3, gameId: 0)
    @Published var gameId : String = ""
    @Published var joinedGame = false
    @Published var player = 0 //1 or 2
    
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
    
    
    init(){
        subscribeToGame()
    }
    
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
                    
//                        stopGame()
                        
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
      

      func stopGame() {
//          timePlayed = 0
//          isTimerRunning = false
//          gameRunning = false
      }
      
      func restartGame() {
          list.fillFromFB()
          list.startPositions()

          gameRunning = true
          isTimerRunning = true
          timePlayed = 0.0

      }
    func checkDead(){
//        if playerLife == 0{
//            list.clearAll()
//            stopGame()
//
//        }
        
    }
    
    func subscribeToGame(){
        let documents = db.collection("games").whereField("gameId", isEqualTo: Int(gameId))

        documents.addSnapshotListener{snapshot, err in
            if let err = err{
                print("err : \(err)")
            }
            guard let docs = snapshot?.documents else {return}
            
            for doc in docs {
                let result = Result{
                    try doc.data(as: MultiplayerGame.self)
                }
                switch result{
                case.success(let game):
                    self.game = game
                case.failure(let err):
                    print("err: \(err)")
                }
            }
        }
    }
    func addGame()-> String{
        
        guard let user = user else {return ""}
        
        let gameId = Int.random(in: 1000...9999)
        
        let game = MultiplayerGame(p1Id: user.email ?? "No user", p2Id: "", p1Score: 100, p2Score: 0,p1Life: 3,p2Life: 3,gameId: gameId)
        
        do{
            _ = try db.collection("games").document(user.uid).setData(from: game)
        }catch{
            print("Error creating game")
        }
        
        return String(gameId)
    }
    func setPlayerName(player : Int){
        if player == 2{
            guard let user = user else {return}
            let ref = db.collection("games").document(user.uid)
            
            ref.updateData([
                "p\(player)Id" : user.email ?? "No user"
            ]) { err in
                if let err = err{
                    print("Error updating: \(err)")
                } else{
                    print("Player name updated")
                }
                
            }
        }else{
            print("Invalid player")
        }
    }
    func decreasePlayerLife(){
        let ref = db.collection("games").whereField("gameId", isEqualTo: Int(gameId))
        
        ref.getDocuments(completion: {snapshot, err in
            if let err = err{
                print("err: \(err)")
            }
            guard let docs = snapshot?.documents else {return}
            
            for doc in docs{
                let ref = doc.reference
                ref.updateData(["p\(self.player)Life" : FieldValue.increment(Int64(-1))])
            }
        })

    }
    func increasePlayerScore(){
        let ref = db.collection("games").whereField("gameId", isEqualTo: Int(gameId))
        
        ref.getDocuments(completion: {snapshot, err in
            if let err = err{
                print("err: \(err)")
            }
            guard let docs = snapshot?.documents else {return}
            
            for doc in docs{
                let ref = doc.reference
                ref.updateData(["p\(self.player)Score" : FieldValue.increment(Int64(1))])
            }
        })
    }
  }


