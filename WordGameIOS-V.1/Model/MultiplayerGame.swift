//
//  MultiplayerGame.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-13.
//

import Foundation
import FirebaseFirestoreSwift

struct MultiplayerGame: Codable{
    
    var p1Id : String
    var p2Id : String
    
    var p1Score : Int
    var p2Score : Int
    
    var p1Life : Int
    var p2Life : Int
    
    var gameId : Int
    
    var waitingForPlayer : Bool = true
    
    var isGameRunning : Bool = false
    
}
