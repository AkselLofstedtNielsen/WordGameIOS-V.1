//
//  Word.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-01-09.
//

import Foundation

//a word in the firebase wordlist
struct Word : Identifiable {
    var id = UUID()
    var word : String
}
