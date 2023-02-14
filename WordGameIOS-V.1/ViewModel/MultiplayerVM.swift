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
            }catch{
                print("Error creating game")
            }
        }
        
        
        
    }
}
