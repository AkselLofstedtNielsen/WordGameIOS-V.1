//
//  FirebaseManager.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-07.
//

import Foundation
import Firebase

class FirestoreManager: ObservableObject{
    @Published var words = [FirebaseWord]()
    let db = Firestore.firestore()
    
    init(){
        getSinglePlayerList()
        
    }
    
    func getSinglePlayerList(){
        db.collection("GameListTest").addSnapshotListener{ snapshot, err in
            guard let snapshot = snapshot else{return}
            
            if let err = err{
                print("Err = \(err)")
            }else{
                self.words.removeAll()
                for document in snapshot.documents{
                    let result = Result{
                        try document.data(as: FirebaseWord.self)
                    }
                    switch result{
                    case .success(let word):
                        self.words.append(word)
                    case.failure(let error):
                        print("Err: :\(error)")
                    }
                }
            }
            
        }
    }
    func saveToFirestore(word : String){
        let item = FirebaseWord(word : word)
        
        do{
            _=try db.collection("GameListTest").addDocument(from: item)
        }catch{
            print("Error saving")
        }
    }
}
