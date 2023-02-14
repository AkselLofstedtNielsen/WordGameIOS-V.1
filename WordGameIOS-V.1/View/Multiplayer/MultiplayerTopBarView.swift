//
//  MultiplayerTopBarView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct MultiplayerTopBarView: View {
    @ObservedObject var game : MultiplayerVM
    
    var body: some View {
        HStack{
            Text("p1 id: \(game.game.p1Id)")
            Spacer()
            Text("p1 score: \(game.game.p1Score)")
            Spacer()
            Text("p2 id: \(game.game.p2Id)")
            Spacer()
            Text("p2 score: \(game.game.p2Score)")
        }
    }
}


