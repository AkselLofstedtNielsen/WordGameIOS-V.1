//
//  MultiplayerTopBarView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct MultiplayerTopBarView: View {
    @ObservedObject var vm : MultiplayerVM
    
    var body: some View {
        HStack{
            Text("p1 life: \(vm.game.p1Life)")
            Spacer()
            Text("p1 score: \(vm.game.p1Score)")
            Spacer()
            Text("p2 life: \(vm.game.p2Life)")
            Spacer()
            Text("p2 score: \(vm.game.p2Score)")
        }
    }
}


