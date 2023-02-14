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
    
    @Published var game = MultiplayerGame(gameId: "", p1Id: "", p2Id: "", p1Score: 0, p2Score: 0)
    
    
    func subscribeToGame(id : String){
        db.collection("games").document(id)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else{
                    print("error fetching document")
                    return
                }
                guard let data = document.data() else{
                    print("Data empty")
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
}
