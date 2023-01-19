//
//  TypedLetter.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-18.
//

import Foundation

struct TypedLetter : Identifiable{
    let id = UUID()
    let letter : String
    var isCorred : Bool
    
}
