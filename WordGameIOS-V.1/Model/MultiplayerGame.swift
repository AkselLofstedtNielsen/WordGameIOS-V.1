//
//  MultiplayerGame.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-13.
//

import Foundation
import FirebaseFirestoreSwift

struct MultiplayerGame: Codable{
    var gameId : String
    
    var p1Id : String
    var p2Id : String
    
    var p1Score : Int
    var p2Score : Int
    
    
}
