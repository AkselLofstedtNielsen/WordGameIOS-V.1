//
//  FirebaseTestWord.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-07.
//

import Foundation
import FirebaseFirestoreSwift

struct FirebaseWord: Codable, Identifiable{
    @DocumentID var id : String?
    var word : String
    
    //fixa yPos + xPos
    
    
}


