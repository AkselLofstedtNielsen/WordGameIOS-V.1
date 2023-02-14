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
            Text("gameId: \(game.game.gameId)")
            Spacer()
            Text("p1 id: \(game.game.p1Id)")
        }
    }
}


