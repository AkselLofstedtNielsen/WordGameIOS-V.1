//
//  NewGameView.swift
//  WordGameIOS-V.1
//
//  Created by Aksel Nielsen on 2023-02-10.
//

import SwiftUI

struct NewGameView: View {
    @ObservedObject var vm : MultiplayerVM
    
    var body: some View {
        ZStack{
            VStack{
                MultiplayerTopBarView(vm: vm)
                Spacer()
                MultiplayerFallingWords(vm: vm)
                Spacer()
                MultiplayerTypingView(vm: vm)
            }
        }
        .background(Color.black)
        
        
    }
}
